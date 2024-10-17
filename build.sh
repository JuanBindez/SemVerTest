#!/bin/bash

VERSION=1
PATCHLEVEL=1
SUBLEVEL=
EXTRAVERSION="-rc1"

NAME="SemVerTest"
BRANCH="main"
MESSAGE="Release"

# Se SUBLEVEL for vazio, não há ponto antes dele
if [[ -z $SUBLEVEL ]]; then
    SUBLEVEL=""
else
    SUBLEVEL=".$SUBLEVEL" # Sempre adiciona um ponto se houver sublevel, inclusive se for zero
fi

# Se EXTRAVERSION contiver "-rc", não adiciona ponto antes do EXTRAVERSION
if [[ $EXTRAVERSION == *"-rc"* ]]; then
    FULL_VERSION="$VERSION.$PATCHLEVEL$SUBLEVEL$EXTRAVERSION"
else
    # Se o EXTRAVERSION for vazio, então precisa do ponto
    if [[ -z $EXTRAVERSION ]]; then
        FULL_VERSION="$VERSION.$PATCHLEVEL$SUBLEVEL"
    else
        FULL_VERSION="$VERSION.$PATCHLEVEL$SUBLEVEL.$EXTRAVERSION"
    fi
fi

git add .
git commit -m "$NAME $FULL_VERSION $MESSAGE"
git push -u origin $BRANCH
git tag v$FULL_VERSION
git push --tags

echo "Build $FULL_VERSION completed successfully!"
