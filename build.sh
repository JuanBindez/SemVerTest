#!/bin/bash

VERSION=1
PATCHLEVEL=0
SUBLEVEL=0
EXTRAVERSION=""

NAME="SemVerTest"
BRANCH="main"
MESSAGE="Release"

if [[ -z $SUBLEVEL || $SUBLEVEL -eq 0 ]]; then
    SUBLEVEL=""
else
    SUBLEVEL=".$SUBLEVEL"
fi

if [[ $EXTRAVERSION == *"-rc"* ]]; then
    FULL_VERSION="$VERSION.$PATCHLEVEL$SUBLEVEL$EXTRAVERSION"
else
    FULL_VERSION="$VERSION.$PATCHLEVEL$SUBLEVEL$EXTRAVERSION"
fi

git add .
git commit -m "$NAME $FULL_VERSION $MESSAGE"
git push -u origin $BRANCH
git tag v$FULL_VERSION
git push --tags

echo "Build $FULL_VERSION completed successfully!"
