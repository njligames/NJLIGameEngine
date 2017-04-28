#include <jni.h>
#include <string>

extern "C"
JNIEXPORT jstring JNICALL
Java_source_android_engine_njligames_com_android_1androidstudio_MainActivity_stringFromJNI(
        JNIEnv *env,
        jobject /* this */) {
    std::string hello = "Hello from C++";
    return env->NewStringUTF(hello.c_str());
}
