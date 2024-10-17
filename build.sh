#!/bin/bash

VERSION=1
PATCHLEVEL=.0
SUBLEVEL=.0
EXTRAVERSION=""

NAME="SemVerTest"
BRANCH="main"
MESSAGE="Release"

FULL_VERSION="$VERSION$PATCHLEVEL$SUBLEVEL$EXTRAVERSION"

git add .
git commit -m "$NAME $FULL_VERSION $MESSAGE"
git push -u origin $BRANCH
git tag v$FULL_VERSION
git push --tags
make clean
make upload

echo "Build $FULL_VERSION completed successfully!"
