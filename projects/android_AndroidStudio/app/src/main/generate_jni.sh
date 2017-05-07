#http://geosoft.no/development/android.html

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export ANDROID_HOME=/Users/jamesfolk/Library/Android/sdk
export DEV_HOME=`pwd`

mkdir -p obj

FMOD_JAR=/Users/jamesfolk/Dropbox/Developer/NJLI/Engine/projects/android_AndroidStudio/app/libs/fmod.jar 

${JAVA_HOME}/bin/javac \
    -verbose \
    -d "${DEV_HOME}/obj" \
    -classpath "${ANDROID_HOME}/platforms/android-19/android.jar:${DEV_HOME}/obj:${FMOD_JAR}" \
    "${DEV_HOME}/java/source/android/engine/njligames/com/android_androidstudio/SDLActivity.java"

${JAVA_HOME}/bin/javah -v -jni \
    -o ${DEV_HOME}/../../../../../src/njli/platform/android/SDLActivity.h \
    -classpath "${ANDROID_HOME}/platforms/android-19/android.jar:${DEV_HOME}/obj:${FMOD_JAR}" \
    source.android.engine.njligames.com.android_androidstudio.SDLActivity

rm -rf obj
