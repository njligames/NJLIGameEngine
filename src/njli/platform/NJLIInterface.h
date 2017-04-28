//
//  NJLIInterface.hpp
//  macOS
//
//  Created by James Folk on 4/27/17.
//
//

#ifndef NJLIInterface_hpp
#define NJLIInterface_hpp

#include "SDL.h"

extern SDL_Window* gWindow;
extern SDL_Renderer *gRenderer;
extern SDL_GLContext gGlContext;
extern SDL_DisplayMode gDisplayMode;
extern SDL_MouseMotionEvent gLastEvent;
extern int gDone;

#ifdef __cplusplus
extern "C" {
#endif
    
    void NJLI_HandleLowMemory();
    void NJLI_HandleQuit();
    void NJLI_HandlePause();
    void NJLI_HandleResume();
    void NJLI_HandleDropFile(const char *filename);
    void NJLI_HandleResize(int width, int height, int sdlFormat, float refreshRate);
    int NJLI_HandlePadDown(int device_id, int keycode);
    int NJLI_HandlePadUp(int device_id, int keycode);
    void NJLI_HandleJoy(int device_id, int axis, float value);
    void NJLI_HandleHat(int device_id, int hat_id, int x, int y);
    void NJLI_HandleKeyDown(int keycode);
    void NJLI_HandleKeyUp(int keycode);
    void NJLI_HandleKeyboardFocusLost();
    void NJLI_HandleMouse(int button, int action, float x, float y);
    void NJLI_HandleTouch(int touchDevId, int pointerFingerId, int event, float x, float y, float pressure);
    void NJLI_HandleAccel(float x, float y, float z);
    void NJLI_HandleSurfaceChanged();
    void NJLI_HandleSurfaceDestroyed();
    int NJLI_HandleAddJoystick(int device_id, const char *name, int is_accelerometer, int nbuttons, int naxes, int nhats, int nballs);
    int NJLI_HandleRemoveJoystick(int device_id);
    const char *NJLI_HandleGetHint(const char *name);
    
#ifdef __cplusplus
}
#endif



#endif /* NJLIInterface_hpp */
