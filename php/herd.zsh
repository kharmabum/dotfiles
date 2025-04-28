# Herd injected PHP binary.
export PATH="/Users/jfoust/Library/Application Support/Herd/bin/":$PATH

# Herd injected PHP 8.2 configuration.
export HERD_PHP_82_INI_SCAN_DIR="/Users/jfoust/Library/Application Support/Herd/config/php/82/"

# Herd injected PHP 8.3 configuration.
export HERD_PHP_83_INI_SCAN_DIR="/Users/jfoust/Library/Application Support/Herd/config/php/83/"

export SAIL_XDEBUG_MODE=debug

if which herd > /dev/null; then
  herd use 8.2
fi
