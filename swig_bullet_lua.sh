#!/bin/sh

PWD=`pwd`

MY_XML_OUTPUT_DIRECTORY=$1

if [ -z "${MY_XML_OUTPUT_DIRECTORY}" ]
then
    MY_XML_OUTPUT_DIRECTORY=.
fi

#bullet.
/usr/local/bin/swig -v -w201 -w312 -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 -DBT_INFINITY \
    -I${PWD}/../External/thirdparty/bullet3/src \
    -I${PWD}/src/bullet \
    -xmlout ${MY_XML_OUTPUT_DIRECTORY}/lbullet.xml \
    -o ${PWD}/src/njli/generated/swig/lua/lbullet.cpp \
    ${PWD}/../External/thirdparty/swig.in/lua/bullet3/_LuaEntry.i

