#!/bin/bash

FILE=".NJLI_VERSION_RELEASE.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_RELEASE=$var
fi < ${FILE}

RELEASE=$((NJLIGameEngine_VERSION_RELEASE + 1))

echo ${RELEASE} > ${FILE}

echo "cmake will need to be run to update the platform's version number"

