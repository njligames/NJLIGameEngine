#!/bin/bash

FILE=".NJLI_VERSION_RELEASE.txt"

if IFS= read -r var
then
  export NJLIGameEngine_VERSION_RELEASE=$var
fi < ${FILE}

RELEASE=$((NJLIGameEngine_VERSION_RELEASE + 1))

echo ${RELEASE} > ${FILE}

#git reset
#git add ${FILE}
#git commit -m 'updated release to ${RELEASE}'
#git push

