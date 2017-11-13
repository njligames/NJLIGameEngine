#!/bin/bash

FILE=".NJLI_VERSION_MAJOR.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_MAJOR=$var
fi < ${FILE}

RELEASE=$((NJLIGameEngine_VERSION_MAJOR + 1))

echo ${RELEASE} > ${FILE}


echo "0" > ".NJLI_VERSION_MINOR.txt"
echo "0" > ".NJLI_VERSION_RELEASE.txt"


echo "cmake will need to be run to update the platform's version number"
