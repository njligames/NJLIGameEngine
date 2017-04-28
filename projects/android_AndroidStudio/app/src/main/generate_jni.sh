#http://geosoft.no/development/android.html

export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.7.0_80.jdk/Contents/Home
export ANDROID_HOME=/Users/jamesfolk/Library/Android/sdk
export DEV_HOME=`pwd`

mkdir -p obj

${JAVA_HOME}/bin/javac \
    -verbose \
    -d "${DEV_HOME}/obj" \
    -classpath "${ANDROID_HOME}/platforms/android-25/android.jar:${DEV_HOME}/obj" \
    "${DEV_HOME}/java/source/android/engine/njligames/com/android_androidstudio/SDLActivity.java"

${JAVA_HOME}/bin/javah -jni \
    -o ${DEV_HOME}/cpp/SDLActivity.h \
    -classpath "${ANDROID_HOME}/platforms/android-25/android.jar:${DEV_HOME}/obj" \
    source.android.engine.njligames.com.android_androidstudio.SDLActivity

rm -rf obj
