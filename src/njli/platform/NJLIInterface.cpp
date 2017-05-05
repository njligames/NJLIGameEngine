//
//  NJLIInterface.cpp
//  macOS
//
//  Created by James Folk on 4/27/17.
//
//

#include "NJLIInterface.h"
#include "Game.h"

SDL_Window* gWindow = nullptr;
SDL_Renderer *gRenderer = nullptr;
SDL_GLContext gGlContext;
SDL_DisplayMode gDisplayMode;
SDL_MouseMotionEvent gLastEvent;
int gDone = 0;
int gXOffset = 0;
int gYOffset = 0;
int gNumTouches = 1;

void NJLI_HandleLowMemory()
{
    njli::NJLIGameEngine::receivedMemoryWarning();
}

void NJLI_HandleQuit()
{
    gDone = 1;
}

void NJLI_HandlePause()
{
}

void NJLI_HandleResume()
{
}

void NJLI_HandleDropFile(const char *filename)
{
    SDL_Log("%s", filename);
}

void NJLI_HandleResize(int width, int height, int sdlFormat, float refreshRate)
{
    gDisplayMode.w = width;
    gDisplayMode.h = height;
    gDisplayMode.refresh_rate = refreshRate;
    
    njli::NJLIGameEngine::resize(gXOffset, gYOffset,
                                 gDisplayMode.w, gDisplayMode.h,
                                 0);
    
//    njli::NJLIGameEngine::resize(SDL_WINDOWPOS_CENTERED, SDL_WINDOWPOS_CENTERED,
//                                 gDisplayMode.w, gDisplayMode.h,
//                                 0);
}

int NJLI_HandlePadDown(int device_id, int keycode)
{
    return 0;
}

int NJLI_HandlePadUp(int device_id, int keycode)
{
    return 0;
}

void NJLI_HandleJoy(int device_id, int axis, float value)
{
}

void NJLI_HandleHat(int device_id, int hat_id, int x, int y)
{
}

void NJLI_HandleKeyDown(int keycode)
{
}

void NJLI_HandleKeyUp(int keycode)
{
}

void NJLI_HandleKeyboardFocusLost()
{
}

void NJLI_HandleMouse(int button, int eventType, float x, float y, int clicks)
{
//    switch(eventType)
//    {
//        case SDL_MOUSEMOTION:
//            SDL_Log("SDL EVENT: Mouse: button %d released at %f,%f with click count %d in window %d", button, x, y, clicks, 0);
//            break;
//        case SDL_MOUSEBUTTONDOWN:
//            SDL_Log("SDL EVENT: Mouse: button %d released at %f,%f with click count %d in window %d", button, x, y, clicks, 0);
//            break;
//        case SDL_MOUSEBUTTONUP:
//            SDL_Log("SDL EVENT: Mouse: button %d released at %f,%f with click count %d in window %d", button, x, y, clicks, 0);
//            break;
//        default:
//            break;
//    }
    
    njli::NJLIGameEngine::mouse(button,
                                eventType,
                                x * gDisplayMode.w,
                                y * gDisplayMode.h,
                                clicks);
    
}

void NJLI_HandleStartTouches()
{
    njli::NJLIGameEngine::startHandleFingers();
}

void NJLI_HandleTouch(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure)
{
    //gDisplayMode.w, gDisplayMode.h
    njli::NJLIGameEngine::handleFinger(touchDevId,
                                       pointerFingerId,
                                       eventType,
                                       x * gDisplayMode.w,
                                       gDisplayMode.h - (y * gDisplayMode.h),
                                       dx * gDisplayMode.w,
                                       dy * gDisplayMode.h,
                                       pressure);
}

void NJLI_HandleFinishTouches()
{
    njli::NJLIGameEngine::finishHandleFingers();
}

void NJLI_HandleAccel(float x, float y, float z)
{
    
}

void NJLI_HandleSurfaceChanged()
{
    
}

void NJLI_HandleSurfaceDestroyed()
{
    njli::NJLIGameEngine::destroy();
    
    SDL_GL_DeleteContext(gGlContext);
    SDL_DestroyWindow(gWindow);
    SDL_Quit();
}

int NJLI_HandleAddJoystick(int device_id, const char *name, int is_accelerometer, int nbuttons, int naxes, int nhats, int nballs)
{
    return 0;
}

int NJLI_HandleRemoveJoystick(int device_id)
{
    return 0;
}

const char *NJLI_HandleGetHint(const char *name)
{
    return "";
}
