#!/bin/sh

PWD=`pwd`

MY_NJLI_INTERFACE_DIRECTORY=${PWD}/src/swig.in/lua

MY_NJLI_SOURCE_DIRECTORY=${PWD}/src/njli
MY_NJLI_BULLET_SOURCE_DIRECTORY=${PWD}/src/bullet
MY_BULLET_SOURCE_DIRECTORY=${PWD}/../External/thirdparty/bullet3/src

MY_XML_OUTPUT_DIRECTORY=$1
shift
MY_DEFINES=""
for var in "$@"
do
  MY_DEFINES="${MY_DEFINES} -D$var=1"
done

if [ -z "${MY_XML_OUTPUT_DIRECTORY}" ]
then
    MY_XML_OUTPUT_DIRECTORY=.
fi

/usr/local/bin/swig -lua -external-runtime \
  -DSWIG_TYPE_TABLE=myprojectname \
  ${PWD}/src/njli/generated/swig/lua/swig_runtime.h

if [[ ${MY_DEFINES} == *"USE_BULLET_LIBRARY"* ]]; then
  #bullet.
  /usr/local/bin/swig -v -w201 -w312 -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 -DBT_INFINITY \
    -DSWIG_TYPE_TABLE=myprojectname \
    -I${PWD}/../External/thirdparty/bullet3/src \
    -I${PWD}/src/bullet \
    -xmlout ${MY_XML_OUTPUT_DIRECTORY}/lbullet.xml \
    -o ${PWD}/src/njli/generated/swig/lua/lbullet.cpp \
    ${PWD}/../External/thirdparty/swig.in/lua/bullet3/_LuaEntry.i
fi

mkdir -p ${PWD}/src/njli/generated/swig/lua/opengl_es_2/
/usr/local/bin/swig -v -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 \
  -DSWIG_TYPE_TABLE=myprojectname \
  -DGL_GLEXT_PROTOTYPES=1 \
  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_es_2.xml \
  -o ${PWD}/src/njli/generated/swig/lua/opengl_es_2/gl_es_2.cpp \
  ${PWD}/../External/thirdparty/swig.in/lua/opengl_es_2/_LuaEntry.i

#njli
/usr/local/bin/swig ${MY_DEFINES} -v -w201 -w312 -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 \
  -DSWIG_TYPE_TABLE=myprojectname \
    -I${MY_BULLET_SOURCE_DIRECTORY} \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletCollision/BroadphaseCollision \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletCollision/CollisionDispatch \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletCollision/CollisionShapes \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletCollision/Gimpact \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletCollision/NarrowPhaseCollision \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/Character \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/ConstraintSolver \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/Dynamics \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/Featherstone \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/MLCPSolvers \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletDynamics/Vehicle \
    -I${MY_BULLET_SOURCE_DIRECTORY}/BulletSoftBody \
    -I${MY_BULLET_SOURCE_DIRECTORY}/LinearMath \
    \
    -I${MY_NJLI_BULLET_SOURCE_DIRECTORY} \
    \
    -I${MY_NJLI_SOURCE_DIRECTORY} \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/graphics \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/physics \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/physics/body \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/physics/constraint \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/physics/shape \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/platform \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/sound \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/steering \
    -I${MY_NJLI_SOURCE_DIRECTORY}/builders/steering/behavior \
    -I${MY_NJLI_SOURCE_DIRECTORY}/generated \
    -I${MY_NJLI_SOURCE_DIRECTORY}/graphics \
    -I${MY_NJLI_SOURCE_DIRECTORY}/physics \
    -I${MY_NJLI_SOURCE_DIRECTORY}/physics/body \
    -I${MY_NJLI_SOURCE_DIRECTORY}/physics/constraint \
    -I${MY_NJLI_SOURCE_DIRECTORY}/physics/shape \
    -I${MY_NJLI_SOURCE_DIRECTORY}/platform \
    -I${MY_NJLI_SOURCE_DIRECTORY}/sound \
    -I${MY_NJLI_SOURCE_DIRECTORY}/sound/fmod \
    -I${MY_NJLI_SOURCE_DIRECTORY}/sound/openal \
    -I${MY_NJLI_SOURCE_DIRECTORY}/steering \
    -I${MY_NJLI_SOURCE_DIRECTORY}/steering/behavior \
    \
    -I${MY_NJLI_INTERFACE_DIRECTORY} \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/graphics \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/physics \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/physics/body \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/physics/constraint \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/physics/shape \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/platform \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/sound \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/steering \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/builders/steering/behavior \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/graphics \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/physics \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/physics/body \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/physics/constraint \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/physics/shape \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/platform \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/sound \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/steering \
    -I${MY_NJLI_INTERFACE_DIRECTORY}/njli/steering/behavior \
    \
    -xmlout ${MY_XML_OUTPUT_DIRECTORY}/lnjli.xml \
    -o ${MY_NJLI_SOURCE_DIRECTORY}/generated/swig/lua/lnjli.cpp \
    ${MY_NJLI_INTERFACE_DIRECTORY}/njli/_LuaEntry.i

#mkdir -p ${PWD}/src/njli/generated/swig/lua/opengl_es_3/
#/usr/local/bin/swig -v -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 \
#  -I/Applications/Xcode.app/Contents/Developer/Platforms/iPhoneOS.platform/Developer/SDKs/iPhoneOS.sdk/usr/include \
#  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_es_3.xml \
#  -o ${PWD}/src/njli/generated/swig/lua/opengl_es_3/gl_es_3.cpp \
#  ${PWD}/../External/thirdparty/swig.in/lua/opengl_es_3/_LuaEntry.i
#
#mkdir -p ${PWD}/src/njli/generated/swig/lua/opengl_2/
#/usr/local/bin/swig -v -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 \
#  -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include \
#  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_2.xml \
#  -o ${PWD}/src/njli/generated/swig/lua/opengl_2/gl_2.cpp \
#  ${PWD}/../External/thirdparty/swig.in/lua/opengl_2/_LuaEntry.i
#
#mkdir -p ${PWD}/src/njli/generated/swig/lua/opengl_3/
#/usr/local/bin/swig -v -c++ -lua -includeall -ignoremissing -features directors,autodoc=1 \
#  -I/Applications/Xcode.app/Contents/Developer/Platforms/MacOSX.platform/Developer/SDKs/MacOSX.sdk/usr/include \
#  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_3.xml \
#  -o ${PWD}/src/njli/generated/swig/lua/opengl_3/gl_3.cpp \
#  ${PWD}/../External/thirdparty/swig.in/lua/opengl_3/_LuaEntry.i
#
