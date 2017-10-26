#!/bin/sh
#http://www.swig.org/Doc3.0/Javascript.html

PWD=`pwd`

MY_BULLET_SOURCE_DIRECTORY=${PWD}/../External/thirdparty/BUILD/include/bullet3
MY_DEBUG_DRAW_DIRECTORY=${PWD}/../External/thirdparty/BUILD/include/debug-draw

MY_XML_OUTPUT_DIRECTORY=$1
shift
MY_OPENGL=$2
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

export SWIG_THIRDPARTY_INCLUDES=""

/usr/local/bin/swig -javascript -v8 -DV8_VERSION=0x032530 -external-runtime \
  -DSWIG_TYPE_TABLE=myprojectname \
  ${PWD}/src/njli/generated/swig/javascript_v8/swig_runtime.h

if [[ ${MY_DEFINES} == *"USE_BULLET_LIBRARY"* ]]; then
  USE_BULLET_LIBRARY=1
  #bullet.
  /usr/local/bin/swig -fcompact -fvirtual -v -w201 -w312 -c++ -javascript -v8 -DV8_VERSION=0x032530 -includeall -ignoremissing -features directors,autodoc=1 -DBT_INFINITY \
    -DSWIG_TYPE_TABLE=myprojectname \
    -I${PWD}/../External/thirdparty/BUILD/include/bullet3 \
    -I${PWD}/src/bullet \
    -xmlout ${MY_XML_OUTPUT_DIRECTORY}/lbullet.xml \
    -o ${PWD}/src/njli/generated/swig/javascript_v8/lbullet.cpp \
    ${PWD}/../External/thirdparty/swig.in/script/bullet3/_LuaEntry.i

  export SWIG_THIRDPARTY_INCLUDES=" \
    ${SWIG_THIRDPARTY_INCLUDES} \
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
    -I${PWD}/src/bullet \
    "
else
  echo "Bullet isn't being wrapped"
fi

###########################################################################################

mkdir -p ${PWD}/src/njli/generated/swig/javascript_v8/opengl_es_2/
/usr/local/bin/swig -fcompact -fvirtual -v -w201 -w312 -c++ -javascript -v8 -DV8_VERSION=0x032530 -includeall -ignoremissing -features directors,autodoc=1 \
  -DSWIG_TYPE_TABLE=myprojectname \
  -DGL_GLEXT_PROTOTYPES=1 \
  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_es_2.xml \
  -o ${PWD}/src/njli/generated/swig/javascript_v8/opengl_es_2/lgl_es_2.cpp \
  ${PWD}/../External/thirdparty/swig.in/script/opengl_es_2/_LuaEntry.i

###########################################################################################

mkdir -p ${PWD}/src/njli/generated/swig/javascript_v8/opengl_2/
/usr/local/bin/swig -fcompact -fvirtual -v -w201 -w312 -c++ -javascript -v8 -DV8_VERSION=0x032530 -includeall -ignoremissing -features directors,autodoc=1 \
  -DSWIG_TYPE_TABLE=myprojectname \
  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/opengl_2.xml \
  -o ${PWD}/src/njli/generated/swig/javascript_v8/opengl_2/lgl_2.cpp \
  ${PWD}/../External/thirdparty/swig.in/script/opengl_2/_LuaEntry.i

###########################################################################################

#njli
/usr/local/bin/swig ${MY_DEFINES} -fcompact -fvirtual -v -w201 -w312 -c++ -javascript -v8 -DV8_VERSION=0x032530 -includeall -ignoremissing -features directors,autodoc=1 \
  -DOPENGL=\"${MY_OPENGL}\" \
  -DSWIG_TYPE_TABLE=myprojectname \
  ${SWIG_THIRDPARTY_INCLUDES} \
  \
  -I${PWD}/src/njli \
  -I${PWD}/src/njli/builders \
  -I${PWD}/src/njli/builders/graphics \
  -I${PWD}/src/njli/builders/physics \
  -I${PWD}/src/njli/builders/physics/body \
  -I${PWD}/src/njli/builders/physics/constraint \
  -I${PWD}/src/njli/builders/physics/shape \
  -I${PWD}/src/njli/builders/platform \
  -I${PWD}/src/njli/builders/sound \
  -I${PWD}/src/njli/builders/steering \
  -I${PWD}/src/njli/builders/steering/behavior \
  -I${PWD}/src/njli/generated \
  -I${PWD}/src/njli/graphics \
  -I${PWD}/src/njli/physics \
  -I${PWD}/src/njli/physics/body \
  -I${PWD}/src/njli/physics/constraint \
  -I${PWD}/src/njli/physics/shape \
  -I${PWD}/src/njli/platform \
  -I${PWD}/src/njli/sound \
  -I${PWD}/src/njli/sound/fmod \
  -I${PWD}/src/njli/sound/openal \
  -I${PWD}/src/njli/steering \
  -I${PWD}/src/njli/steering/behavior \
  \
  -I${PWD}/src/swig.in/script \
  -I${PWD}/src/swig.in/script/njli \
  -I${PWD}/src/swig.in/script/njli/builders \
  -I${PWD}/src/swig.in/script/njli/builders/graphics \
  -I${PWD}/src/swig.in/script/njli/builders/physics \
  -I${PWD}/src/swig.in/script/njli/builders/physics/body \
  -I${PWD}/src/swig.in/script/njli/builders/physics/constraint \
  -I${PWD}/src/swig.in/script/njli/builders/physics/shape \
  -I${PWD}/src/swig.in/script/njli/builders/platform \
  -I${PWD}/src/swig.in/script/njli/builders/sound \
  -I${PWD}/src/swig.in/script/njli/builders/steering \
  -I${PWD}/src/swig.in/script/njli/builders/steering/behavior \
  -I${PWD}/src/swig.in/script/njli/graphics \
  -I${PWD}/src/swig.in/script/njli/physics \
  -I${PWD}/src/swig.in/script/njli/physics/body \
  -I${PWD}/src/swig.in/script/njli/physics/constraint \
  -I${PWD}/src/swig.in/script/njli/physics/shape \
  -I${PWD}/src/swig.in/script/njli/platform \
  -I${PWD}/src/swig.in/script/njli/sound \
  -I${PWD}/src/swig.in/script/njli/steering \
  -I${PWD}/src/swig.in/script/njli/steering/behavior \
  \
  -I${MY_DEBUG_DRAW_DIRECTORY} \
  \
  -xmlout ${MY_XML_OUTPUT_DIRECTORY}/lnjli.xml \
  -o ${PWD}/src/njli/generated/swig/javascript_v8/lnjli.cpp \
  ${PWD}/src/swig.in/script/njli/_LuaEntry.i

################################################################################################################

if [[ ${MY_DEFINES} == *"WRAP_EMBIND"* ]]; then
  /usr/local/bin/swig ${MY_DEFINES} -fcompact -fvirtual -v -w201 -w312 -c++ -embind -includeall -ignoremissing -features directors,autodoc=1 \
    -DOPENGL=\"${MY_OPENGL}\" \
    -DSWIG_TYPE_TABLE=myprojectname \
    ${SWIG_THIRDPARTY_INCLUDES} \
    \
    -I${PWD}/src/njli \
    -I${PWD}/src/njli/builders \
    -I${PWD}/src/njli/builders/graphics \
    -I${PWD}/src/njli/builders/physics \
    -I${PWD}/src/njli/builders/physics/body \
    -I${PWD}/src/njli/builders/physics/constraint \
    -I${PWD}/src/njli/builders/physics/shape \
    -I${PWD}/src/njli/builders/platform \
    -I${PWD}/src/njli/builders/sound \
    -I${PWD}/src/njli/builders/steering \
    -I${PWD}/src/njli/builders/steering/behavior \
    -I${PWD}/src/njli/generated \
    -I${PWD}/src/njli/graphics \
    -I${PWD}/src/njli/physics \
    -I${PWD}/src/njli/physics/body \
    -I${PWD}/src/njli/physics/constraint \
    -I${PWD}/src/njli/physics/shape \
    -I${PWD}/src/njli/platform \
    -I${PWD}/src/njli/sound \
    -I${PWD}/src/njli/sound/fmod \
    -I${PWD}/src/njli/sound/openal \
    -I${PWD}/src/njli/steering \
    -I${PWD}/src/njli/steering/behavior \
    \
    -I${PWD}/src/swig.in/embind \
    -I${PWD}/src/swig.in/embind/njli \
    -I${PWD}/src/swig.in/embind/njli/builders \
    -I${PWD}/src/swig.in/embind/njli/builders/graphics \
    -I${PWD}/src/swig.in/embind/njli/builders/physics \
    -I${PWD}/src/swig.in/embind/njli/builders/physics/body \
    -I${PWD}/src/swig.in/embind/njli/builders/physics/constraint \
    -I${PWD}/src/swig.in/embind/njli/builders/physics/shape \
    -I${PWD}/src/swig.in/embind/njli/builders/platform \
    -I${PWD}/src/swig.in/embind/njli/builders/sound \
    -I${PWD}/src/swig.in/embind/njli/builders/steering \
    -I${PWD}/src/swig.in/embind/njli/builders/steering/behavior \
    -I${PWD}/src/swig.in/embind/njli/graphics \
    -I${PWD}/src/swig.in/embind/njli/physics \
    -I${PWD}/src/swig.in/embind/njli/physics/body \
    -I${PWD}/src/swig.in/embind/njli/physics/constraint \
    -I${PWD}/src/swig.in/embind/njli/physics/shape \
    -I${PWD}/src/swig.in/embind/njli/platform \
    -I${PWD}/src/swig.in/embind/njli/sound \
    -I${PWD}/src/swig.in/embind/njli/steering \
    -I${PWD}/src/swig.in/embind/njli/steering/behavior \
    \
    -I${MY_DEBUG_DRAW_DIRECTORY} \
    \
    -o ${PWD}/src/njli/generated/swig/embind/embind_njli.cpp \
    ${PWD}/src/swig.in/embind/njli/_LuaEntry.i
fi

###########################################################################################


