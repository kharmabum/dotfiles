#!/usr/bin/env python3
# /// script
# requires-python = ">=3.11"
# dependencies = [
#     "pathspec",
#     "tqdm",
# ]
# ///

# Usage: cd /path/to/local/repo && uv run /path/to/llms_txt.py

import os
import re
import ast
import pathspec
from tqdm import tqdm

# --- CONFIGURATION ---
OUTPUT_FILE = "llms.txt"
IGNORE_FILE = ".llmsignore"

# Max size for a single file before we force-summarize it (50KB)
MAX_RAW_SIZE = 50 * 1024 

# Files strictly ignored
DEFAULT_IGNORE = [
    ".git", ".github", ".vscode", ".idea", 
    "node_modules", "venv", "__pycache__", "env",
    "package-lock.json", "yarn.lock", "pnpm-lock.yaml", "go.sum", "Cargo.lock",
    "*.png", "*.jpg", "*.jpeg", "*.gif", "*.ico", "*.svg", "*.woff", "*.ttf",
    "*.pyc", "*.whl", "*.map", "*.min.js", "*.min.css",
    
    # AGGRESSIVE IGNORE: Tests and Mocks
    "tests", "test", "__tests__", "mocks", 
    "*_test.go", "*.spec.ts", "*.test.js", "test_*.py",
    OUTPUT_FILE
]

class Skeletonizer:
    """
    Strips implementation details, keeping only the 'Shape' of the code.
    """
    
    @staticmethod
    def process(content, ext):
        if ext == '.py':
            return Skeletonizer._python_ast(content)
        elif ext in ['.js', '.jsx', '.ts', '.tsx', '.go', '.rs', '.java']:
            return Skeletonizer._regex_scan(content, ext)
        return content

    @staticmethod
    def _python_ast(content):
        """Parses Python and replaces function bodies with ..."""
        try:
            tree = ast.parse(content)
        except SyntaxError:
            return content # Return raw if syntax error

        class SkeletonTransformer(ast.NodeTransformer):
            def visit_FunctionDef(self, node):
                # Keep docstring
                docstring = ast.get_docstring(node)
                new_body = []
                if docstring:
                    new_body.append(ast.Expr(value=ast.Constant(value=docstring)))
                new_body.append(ast.Expr(value=ast.Constant(value=...)))
                node.body = new_body
                return node

            def visit_AsyncFunctionDef(self, node):
                return self.visit_FunctionDef(node)

            def visit_ClassDef(self, node):
                self.generic_visit(node) # Enter the class to visit methods
                return node

        transformer = SkeletonTransformer()
        new_tree = transformer.visit(tree)
        return ast.unparse(new_tree)

    @staticmethod
    def _regex_scan(content, ext):
        """
        For JS/TS/Go, we extract only lines that define structure.
        This is a 'lossy' compression but perfect for context.
        """
        lines = content.splitlines()
        kept_lines = []
        
        # Patterns that indicate a definition
        patterns = [
            r'^(export\s+)?(async\s+)?function\s+\w+',      # JS/TS Functions
            r'^(export\s+)?class\s+\w+',                     # Classes
            r'^(export\s+)?interface\s+\w+',                 # Interfaces
            r'^(export\s+)?type\s+\w+',                      # Types
            r'^func\s+\w+',                                  # Go Functions
            r'^type\s+\w+\s+(struct|interface)',             # Go Types
        ]
        
        # Also keep imports to show dependencies
        is_import = lambda l: l.startswith('import') or l.startswith('from') or l.startswith('package')

        for line in lines:
            line_strip = line.strip()
            # 1. Keep imports (compacted)
            if is_import(line_strip):
                kept_lines.append(line)
                continue
                
            # 2. Keep structural lines
            if any(re.search(p, line_strip) for p in patterns):
                # Add a "..." comment to indicate body is hidden
                kept_lines.append(line.rstrip(' {') + " { // ... }")
            
        if not kept_lines:
            # Fallback for small config files: return full content
            if len(content) < 2000: 
                return content
            return "// File too complex to skeletonize automatically. See file list."
            
        return "\n".join(kept_lines)

def load_gitignore():
    patterns = DEFAULT_IGNORE.copy()
    for fname in [".gitignore", ".llmsignore"]:
        if os.path.exists(fname):
            try:
                with open(fname) as f:
                    patterns.extend([l for l in f.read().splitlines() if l.strip() and not l.startswith("#")])
            except: pass
    return pathspec.PathSpec.from_lines("gitwildmatch", patterns)

def get_files(spec):
    matches = []
    for root, dirs, files in os.walk("."):
        dirs[:] = [d for d in dirs if not d.startswith(".") and not spec.match_file(os.path.join(root, d))]
        for file in files:
            path = os.path.relpath(os.path.join(root, file), ".")
            if not spec.match_file(path):
                matches.append(path)
    return sorted(matches)

def generate_tree(files):
    # Simple tree generator
    tree_str = "# PROJECT MAP\n```text\n"
    tree = {}
    for path in files:
        current = tree
        for part in path.split(os.sep):
            current = current.setdefault(part, {})
            
    def render(node, prefix=""):
        lines = []
        keys = sorted(node.keys())
        for i, k in enumerate(keys):
            is_last = (i == len(keys) - 1)
            lines.append(f"{prefix}{'└── ' if is_last else '├── '}{k}")
            if node[k]:
                lines.extend(render(node[k], prefix + ("    " if is_last else "│   ")))
        return lines

    tree_str += "\n".join(render(tree)) + "\n```\n\n"
    return tree_str

def main():
    print("🧹 Generating Skeletonized Context...")
    spec = load_gitignore()
    files = get_files(spec)
    
    with open(OUTPUT_FILE, "w", encoding="utf-8") as out:
        out.write("# PROJECT CONTEXT (SKELETONIZED)\n\n")
        out.write(generate_tree(files))
        out.write("# FILE CONTENTS\n\n")
        
        count = 0
        skipped = 0
        
        for path in tqdm(files, unit="file"):
            try:
                # 1. Skip if binary
                if path.endswith(('.db', '.sqlite', '.exe', '.dll', '.so')):
                    skipped += 1
                    continue
                    
                with open(path, "r", encoding="utf-8", errors="ignore") as f:
                    content = f.read()
                
                _, ext = os.path.splitext(path)
                
                # 2. Skeletonize
                # If it's a huge file, we ALWAYS skeletonize
                # If it's small, we keep it full unless it's code
                processed = Skeletonizer.process(content, ext)
                
                out.write(f"## File: {path}\n")
                out.write(f"```{ext.lstrip('.')}\n")
                out.write(processed)
                out.write(f"\n```\n\n")
                count += 1
                
            except Exception as e:
                print(f"Error processing {path}: {e}")
                
    print(f"✅ Done! Created {OUTPUT_FILE} ({count} files included).")

if __name__ == "__main__":
    main()