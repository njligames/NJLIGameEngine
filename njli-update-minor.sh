#!/bin/bash

FILE=".NJLI_VERSION_MINOR.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_MINOR=$var
fi < ${FILE}

MINOR=$((NJLIGameEngine_VERSION_MINOR + 1))

echo ${MINOR} > ${FILE}

echo "0" > ".NJLI_VERSION_RELEASE.txt"

echo "cmake will need to be run to update the platform's version number"

