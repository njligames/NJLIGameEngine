#!/bin/sh

PWD=`pwd`

/usr/local/bin/swig -lua -external-runtime ${PWD}/src/njli/generated/swig/lua/swig_runtime.h
