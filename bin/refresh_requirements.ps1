if (!(Test-Path Env:PYTHON_EXECUTABLE)) {
    throw "Env:PYTHON_EXECUTABLE is missing!"
}

poetry env use $Env:PYTHON_EXECUTABLE;
poetry export --dev --without-hashes --format requirements.txt --output requirements.txt
