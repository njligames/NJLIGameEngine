#include "SDLActivity.h"

#include <unistd.h>

#include "android_file.h"
#include "NJLIInterface.h"

#ifdef __ANDROID__

#ifdef __cplusplus
extern "C" {
#endif

/* Include the SDL main definition header */
#include "SDL_main.h"

/* Called before SDL_main() to initialize JNI bindings in SDL library */
extern void SDL_Android_Init(JNIEnv* env, jclass cls);

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeInit
 * Signature: (Ljava/lang/Object;)I
 */
JNIEXPORT jint JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeInit
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
    NJLI_HandleLowMemory();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeQuit
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeQuit
  (JNIEnv *env, jclass cls)
{
    NJLI_HandleQuit();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativePause
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativePause
  (JNIEnv *env, jclass cls)
{
    NJLI_HandlePause();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeResume
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeResume
  (JNIEnv *env, jclass cls)
{
    NJLI_HandleResume();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeDropFile
 * Signature: (Ljava/lang/String;)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeDropFile
  (JNIEnv *env, jclass cls, jstring filename)
{
    const char *_filename = (*env)->GetStringUTFChars(env, filename, NULL);
    NJLI_HandleDropFile(filename);
    (*env)->ReleaseStringUTFChars(env, filename, _filename);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeResize
 * Signature: (IIIF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeResize
  (JNIEnv *env, jclass cls, jint width, jint height, jint sdlFormat, jfloat refreshRate)
{
    NJLI_HandleResize(width, height, sdlFormat, refreshRate);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativePadDown
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativePadDown
  (JNIEnv *env, jclass cls, jint device_id, jint keycode)
{
    return NJLI_HandlePadDown(device_id, keycode);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativePadUp
 * Signature: (II)I
 */
JNIEXPORT jint JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativePadUp
  (JNIEnv *env, jclass cls, jint device_id, jint keycode)
{
    return NJLI_HandlePadUp(device_id, keycode);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeJoy
 * Signature: (IIF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeJoy
  (JNIEnv *env, jclass cls, jint device_id, jint axis, jfloat value)
{
    NJLI_HandleJoy(device_id, axis, value);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeHat
 * Signature: (IIII)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeHat
  (JNIEnv *env, jclass cls, jint device_id, jint hat_id, jint x, jint y)
{
    NJLI_HandleHat(device_id, hat_id, x, y);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyDown
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyDown
  (JNIEnv *env, jclass cls, jint keycode)
{
    NJLI_HandleKeyDown(keycode);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyUp
 * Signature: (I)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyUp
  (JNIEnv *env, jclass cls, jint keycode)
{
    NJLI_HandleKeyUp(keycode);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeKeyboardFocusLost
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeKeyboardFocusLost
  (JNIEnv *env, jclass cls)
{
    NJLI_HandleKeyboardFocusLost();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeMouse
 * Signature: (IIFFI)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeMouse
  (JNIEnv *env, jclass cls, jint button, jint action, jfloat x, jfloat y, jint clicks)
{
    NJLI_HandleMouse(button, action, x, y, clicks);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeStartTouches
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeStartTouches(JNIEnv *env, jclass cls)
{
    NJLI_HandleStartTouches();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeTouch
 * Signature: (IIIFFFFF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeTouch
  (JNIEnv *env, jclass cls, jint touchDevId, jint pointerFingerId, jint event, jfloat x, jfloat y, jfloat dx, jfloat dy, jfloat pressure)
{
    NJLI_HandleTouch(touchDevId, pointerFingerId, event, x, y, dx, dy, pressure);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeFinishTouches
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeFinishTouches(JNIEnv *env, jclass cls)
{
    NJLI_HandleFinishTouches();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeAccel
 * Signature: (FFF)V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeAccel
  (JNIEnv *env, jclass cls, jfloat x, jfloat y, jfloat z)
{
    NJLI_HandleAccel(x, y, z);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeSurfaceChanged
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeSurfaceChanged
  (JNIEnv *env, jclass cls)
{
    NJLI_HandleSurfaceChanged();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    onNativeSurfaceDestroyed
 * Signature: ()V
 */
JNIEXPORT void JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_onNativeSurfaceDestroyed
  (JNIEnv *env, jclass cls)
{
    NJLI_HandleSurfaceDestroyed();
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeAddJoystick
 * Signature: (ILjava/lang/String;IIIII)I
 */
JNIEXPORT jint JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeAddJoystick
  (JNIEnv *env, jclass cls, jint device_id, jstring name, jint is_accelerometer, jint nbuttons, jint naxes, jint nhats, jint nballs)
{
    const char *_name = (*env)->GetStringUTFChars(env, name, NULL);
    int ret = NJLI_HandleAddJoystick(device_id, _name, is_accelerometer, nbuttons, naxes, nhats, nballs);
    (*env)->ReleaseStringUTFChars(env, name, _name);
    return ret;
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeRemoveJoystick
 * Signature: (I)I
 */
JNIEXPORT jint JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeRemoveJoystick
  (JNIEnv *env, jclass cls, jint device_id)
{
    return NJLI_HandleRemoveJoystick(device_id);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    nativeGetHint
 * Signature: (Ljava/lang/String;)Ljava/lang/String;
 */
JNIEXPORT jstring JNICALL Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_nativeGetHint
  (JNIEnv *env, jclass cls, jstring name)
{
    const char *_name = (*env)->GetStringUTFChars(env, name, NULL);
    const char * _ret = NJLI_HandleGetHint(_name);

    (*env)->ReleaseStringUTFChars(env, name, _name);

    return (*env)->NewStringUTF(env, _ret);
}

/*
 * Class:     source_android_engine_njligames_com_android_androidstudio_SDLActivity
 * Method:    initAssetManager
 * Signature: (Landroid/content/res/AssetManager;)V
 */
void Java_source_android_engine_njligames_com_android_1androidstudio_SDLActivity_initAssetManager(JNIEnv * env, jclass jclazz, jobject java_asset_manager)
{

    initAssetManager(AAssetManager_fromJava(env, java_asset_manager));
}

#ifdef __cplusplus
}
#endif

#endif
