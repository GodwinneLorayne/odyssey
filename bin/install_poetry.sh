#!/usr/bin/env bash

set -e

if [[ -z "${PYTHON_EXECUTABLE}" ]]; then
  PYTHON_EXECUTABLE="python3"
else
  PYTHON_EXECUTABLE="${PYTHON_EXECUTABLE}"
fi

curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py -o get-poetry.py && chmod u+x ./get-poetry.py && $PYTHON_EXECUTABLE ./get-poetry.py --yes --version 1.0.10 && rm -f ./get-poetry.py
