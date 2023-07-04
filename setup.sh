#!/usr/bin/env bash

echo "[INFO] Setting up RISCY-Lib Project Environment"

# Setup the script dir
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

export RISCY_DIR=${SCRIPT_DIR}
echo "[INFO] Setting RISCY_DIR=$RISCY_DIR"

# Setup the path to rbuild
if ! $(type "rbuild" &> /dev/null); then
  export PATH="$SCRIPT_DIR/rbuild:$PATH"
  echo "[INFO] rbuild not found in path adding it"
else
  rbuild_path=$(dirname $(which rbuild))
  echo "[INFO] rbuild found in path, replacing with local rbuild directory"
  export PATH=$(echo "$PATH" | sed -e "s|$rbuild_path|$SCRIPT_DIR/rbuild|")
fi

# Check for the dependencies
if ! $(type "vivado" &> /dev/null); then
  echo "[ERROR] vivado not found in path. Have you installed it?"
  return 1
fi
