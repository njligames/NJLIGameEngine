#!/bin/bash

FILE=.build/$1

if [ -e $FILE ]
then
  if IFS= read -r var
  then
    export NJLIGameEngine_BUILD_NUMBER=$var
  fi < ${FILE}
else
  NJLIGameEngine_BUILD_NUMBER=0
fi

RELEASE=$((NJLIGameEngine_BUILD_NUMBER + 1))

echo ${RELEASE} > ${FILE}

