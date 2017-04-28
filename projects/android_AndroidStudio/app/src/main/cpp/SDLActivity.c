#include "SDLActivity.h"

#include "SDL_internal.h"

#ifdef __ANDROID__

/* Include the SDL main definition header */
#include "SDL_main.h"

/* Called before SDL_main() to initialize JNI bindings in SDL library */
extern void SDL_Android_Init(JNIEnv* env, jclass cls);

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeInit
 * Signature: (Ljava/lang/Object;)I
 */
JNIEXPORT jint inum JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeInit
  (JNIEnv *env, jclass cls, jobject array)
{
    int i;
    int argc;
    int status;
    int len;
    char** argv;

    /* This interface could expand with ABI negotiation, callbacks, etc. */
    SDL_Android_Init(env, cls);

    SDL_SetMainReady();

    /* Prepare the arguments. */

    len = (*env)->GetArrayLength(env, array);
    argv = SDL_stack_alloc(char*, 1 + len + 1);
    argc = 0;
    /* Use the name "app_process" so PHYSFS_platformCalcBaseDir() works.
       https://bitbucket.org/MartinFelis/love-android-sdl2/issue/23/release-build-crash-on-start
     */
    argv[argc++] = SDL_strdup("app_process");
    for (i = 0; i < len; ++i) {
        const char* utf;
        char* arg = NULL;
        jstring string = (*env)->GetObjectArrayElement(env, array, i);
        if (string) {
            utf = (*env)->GetStringUTFChars(env, string, 0);
            if (utf) {
                arg = SDL_strdup(utf);
                (*env)->ReleaseStringUTFChars(env, string, utf);
            }
            (*env)->DeleteLocalRef(env, string);
        }
        if (!arg) {
            arg = SDL_strdup("");
        }
        argv[argc++] = arg;
    }
    argv[argc] = NULL;


    /* Run the application. */

    status = SDL_main(argc, argv);

    /* Release the arguments. */

    for (i = 0; i < argc; ++i) {
        SDL_free(argv[i]);
    }
    SDL_stack_free(argv);
    /* Do not issue an exit or the whole application will terminate instead of just the SDL thread */
    /* exit(status); */

    return status;
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeLowMemory
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeLowMemory
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeQuit
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeQuit
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativePause
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativePause
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeResume
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeResume
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeDropFile
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeDropFile
  (JNIEnv *env, jclass cls, jstring sstr)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeResize
 * Signature: (IIIF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeResize
  (JNIEnv *env, jclass cls, jint inum0, jint inum1, jint inum2, jfloat fnum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativePadDown
 * Signature: (II)I
 */
JNIEXPORT jint inum JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativePadDown
  (JNIEnv *env, jclass cls, jint inum0, jint inum1)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativePadUp
 * Signature: (II)I
 */
JNIEXPORT jint inum JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativePadUp
  (JNIEnv *env, jclass cls, jint inum0, jint inum1)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeJoy
 * Signature: (IIF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeJoy
  (JNIEnv *env, jclass cls, jint inum0, jint inum1, jfloat fnum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeHat
 * Signature: (IIII)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeHat
  (JNIEnv *env, jclass cls, jint inum0, jint inum1, jint inum2, jint inum3)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyDown
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyDown
  (JNIEnv *env, jclass cls, jint inum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyUp
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyUp
  (JNIEnv *env, jclass cls, jint inum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyboardFocusLost
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyboardFocusLost
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeMouse
 * Signature: (IIFF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeMouse
  (JNIEnv *env, jclass cls, jint inum0, jint inum1, jfloat fnum, jfloat fnum0)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeTouch
 * Signature: (IIIFFF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeTouch
  (JNIEnv *env, jclass cls, jint inum0, jint inum1, jint inum2, jfloat fnum0, jfloat fnum1, jfloat fnum2)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeAccel
 * Signature: (FFF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeAccel
  (JNIEnv *env, jclass cls, jfloat fnum0, jfloat fnum1, jfloat fnum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeSurfaceChanged
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeSurfaceChanged
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeSurfaceDestroyed
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeSurfaceDestroyed
  (JNIEnv *env, jclass cls)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeAddJoystick
 * Signature: (ILjava/lang/String;IIIII)I
 */
JNIEXPORT jint inum JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeAddJoystick
  (JNIEnv *env, jclass cls, jint inum0, jstring sstr, jint inum1, jint inum2, jint inum3, jint inum4, jint inum5)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeRemoveJoystick
 * Signature: (I)I
 */
JNIEXPORT jint inum JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeRemoveJoystick
  (JNIEnv *env, jclass cls, jint inum)
{
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeGetHint
 * Signature: (Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring sstr JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeGetHint
  (JNIEnv *env, jclass cls, jstring sstr)
{
}

#endif

