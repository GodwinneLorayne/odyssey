#!/usr/bin/env bash

set -e

if [[ -z "${PYTHON_EXECUTABLE}" ]]; then
  PYTHON="python3"
else
  PYTHON="${PYTHON_EXECUTABLE}"
fi

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
    BIN_DIRECTORY=$(dirname "$(readlink -f "$0")")
elif [[ "$OSTYPE" == "darwin"* ]]; then
    BIN_DIRECTORY=$(dirname "$(greadlink -f "$0")")

source $HOME/.poetry/env
poetry env use $PYTHON
paths=$(poetry run python -c 'import site; print("--paths=" + " --paths=".join(site.getsitepackages()));')
poetry run pyinstaller $BIN_DIRECTORY/../src/odyssey/__main__.py --noconfirm --clean --onefile --console $paths --name odyssey
