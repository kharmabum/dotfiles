# Java environment setup (guarded).
# export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
if [ -x /usr/libexec/java_home ]; then
  export JAVA_HOME="$(/usr/libexec/java_home -v 17)"
elif [ -d /usr/lib/jvm/default-java ]; then
  export JAVA_HOME="/usr/lib/jvm/default-java"
elif [ -n "${JAVA_HOME:-}" ]; then
  export JAVA_HOME
fi

if command -v java >/dev/null 2>&1; then
  java --version
fi
