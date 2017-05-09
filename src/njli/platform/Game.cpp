
#include "Log.h"
#define TAG "Game.cpp"
#include "AbstractRender.h"
#include "GLPlatform.h"
#include "Game.h"
#include "World.h"
#include <string>

#ifdef __ANDROID__
#else
#include <sys/sysctl.h>
#include <sys/types.h>
#endif

namespace njli {

bool NJLIGameEngine::isIOS() { return platformID() == PlatformID_iOS; }

bool NJLIGameEngine::isANDROID() { return platformID() == PlatformID_Android; }

bool NJLIGameEngine::isEMSCRIPTEN()
{
    return platformID() == PlatformID_Emscripten;
}

bool NJLIGameEngine::isMACOSX() { return platformID() == PlatformID_MacOSx; }

bool NJLIGameEngine::isTVOS(){ return platformID() == PlatformID_tvOS;}
    
bool NJLIGameEngine::create(const char* deviceName, bool initLua)
{
    njli::World::createInstance();
    if(initLua)
        njli::World::getInstance()->getWorldLuaVirtualMachine()->init();

//    if (LOGGING_ON) {
        const char* platform = (isIOS()
                ? "iOS"
                : (isANDROID()
                          ? "Android"
                          : (isEMSCRIPTEN()
                                    ? "Emscripten"
                                    : ((isMACOSX() ? "MacOSx" : "UNKNOWN_PLATFORM")))));
        SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "Platform Name = `%s`\n", platform);
        SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "Device Name = `%s`\n", deviceName);

        //        printGLInfo();
        printGLInfo();
//    }

    initGL();
    
    njli::World::getInstance()->setDeviceName(deviceName);
    
    return true;
}

void NJLIGameEngine::resize(int x, int y, int width, int height,
    int orientation)
{
    if(njli::World::hasInstance())
        njli::World::getInstance()->resize(x, y, width, height, orientation);
}
    int NJLIGameEngine::width()
    {
        return njli::World::getInstance()->getViewportDimensions().x();
    }
    
    int NJLIGameEngine::height()
    {
        return njli::World::getInstance()->getViewportDimensions().y();
    }
    
    int NJLIGameEngine::orientation()
    {
        return njli::World::getInstance()->getWorldInput()->getOrientation();
    }

    bool NJLIGameEngine::start()
    {
        njli::World::getInstance()->getWorldClock()->reset();
        
        std::string source = R"(
        function __NJLIWorldEnterState()
        print('__NJLIWorldEnterState')
        end
        
        function __NJLIWorldUpdateState(timeStep)
        print('__NJLIWorldUpdateState')
        end
        
        function __NJLIWorldExitState()
        print('__NJLIWorldExitState')
        end
        
        function __NJLIWorldOnMessage(message)
        print('__NJLIWorldOnMessage')
        end
        
        function __NJLIWorldKeyboardShow()
        print('__NJLIWorldKeyboardShow')
        end
        
        function __NJLIWorldKeyboardCancel()
        print('__NJLIWorldKeyboardCancel')
        end
        
        function __NJLIWorldKeyboardReturn(text)
        print('__NJLIWorldKeyboardReturn')
        end
        
        function __NJLIWorldReceivedMemoryWarning()
        print('__NJLIWorldReceivedMemoryWarning')
        end
        
        function __NJLIWorldGamePause()
        print('__NJLIWorldGamePause')
        end
        
        function __NJLIWorldGameUnPause()
        print('__NJLIWorldGameUnPause')
        end
        
        function __NJLIWorldRenderHUD()
        print('__NJLIWorldRenderHUD')
        end
        
        function __NJLIWorldTouchesDown(touches)
        print('__NJLIWorldTouchesDown')
        end
        
        function __NJLIWorldTouchesUp(touches)
        print('__NJLIWorldTouchesUp')
        end
        
        function __NJLIWorldTouchesMove(touches)
        print('__NJLIWorldTouchesMove')
        end
        
        function __NJLIWorldTouchesCancelled(touches)
        print('__NJLIWorldTouchesCancelled')
        end
        
        function __NJLIWorldTouchDown(touches)
        print('__NJLIWorldTouchDown')
        end
        
        function __NJLIWorldTouchUp(touches)
        print('__NJLIWorldTouchUp')
        end
        
        function __NJLIWorldTouchMove(touches)
        print('__NJLIWorldTouchMove')
        end
        
        function __NJLIWorldTouchCancelled(touches)
        print('__NJLIWorldTouchCancelled')
        end
        
        function __NJLIWorldMouseDown(mouse)
        print('__NJLIWorldMouseDown')
        end
        
        function __NJLIWorldMouseUp(mouse)
        print('__NJLIWorldMouseUp')
        end
        
        function __NJLIWorldMouseMove(mouse)
        print('__NJLIWorldMouseMove')
        end
        
        function __NJLIWorldWillResignActive()
        print('__NJLIWorldWillResignActive')
        end
        
        function __NJLIWorldDidBecomeActive()
        print('__NJLIWorldDidBecomeActive')
        end
        
        function __NJLIWorldDidEnterBackground()
        print('__NJLIWorldDidEnterBackground')
        end
        
        function __NJLIWorldWillEnterForeground()
        print('__NJLIWorldWillEnterForeground')
        end
        
        function __NJLIWorldWillTerminate()
        print('__NJLIWorldWillTerminate')
        end
        
        function __NJLIWorldInterrupt()
        print('__NJLIWorldInterrupt')
        end
        
        function __NJLIWorldResumeInterrupt()
        print('__NJLIWorldResumeInterrupt')
        end
        
        --#############################################################################
        --Scene State Functions
        --#############################################################################
        
        function __NJLISceneEnterState(scene)
        print('__NJLISceneEnterState')
        end
        
        function __NJLISceneUpdateState(scene, timeStep)
        print('__NJLISceneUpdateState')
        end
        
        function __NJLISceneExitState(scene)
        print('__NJLISceneExitState')
        end
        
        function __NJLISceneOnMessage(scene, message)
        print('__NJLISceneOnMessage')
        end
        
        function __NJLISceneKeyboardShow(scene)
        print('__NJLISceneKeyboardShow')
        end
        
        function __NJLISceneKeyboardCancel(scene)
        print('__NJLISceneKeyboardCancel')
        end
        
        function __NJLISceneKeyboardReturn(scene, text)
        print('__NJLISceneKeyboardReturn')
        end
        
        function __NJLISceneRenderHUD(scene)
        print('__NJLISceneRenderHUD')
        end
        
        function __NJLISceneGamePause(scene)
        print('__NJLISceneGamePause')
        end
        
        function __NJLISceneGameUnPause(scene)
        print('__NJLISceneGameUnPause')
        end
        
        function __NJLISceneTouchesDown(scene, touches)
        print('__NJLISceneTouchesDown')
        end
        
        function __NJLISceneTouchesUp(scene, touches)
        print('__NJLISceneTouchesUp')
        end
        
        function __NJLISceneTouchesMove(scene, touches)
        print('__NJLISceneTouchesMove')
        end
        
        function __NJLISceneTouchesCancelled(scene, touches)
        print('__NJLISceneTouchesCancelled')
        end
        
        function __NJLISceneTouchDown(scene, touches)
        print('__NJLISceneTouchDown')
        end
        
        function __NJLISceneTouchUp(scene, touches)
        print('__NJLISceneTouchUp')
        end
        
        function __NJLISceneTouchMove(scene, touches)
        print('__NJLISceneTouchMove')
        end
        
        function __NJLISceneTouchCancelled(scene, touches)
        print('__NJLISceneTouchCancelled')
        end
        
        function __NJLISceneMouseDown(scene, mouse)
        print('__NJLISceneMouseDown')
        end
        
        function __NJLISceneMouseUp(scene, mouse)
        print('__NJLISceneMouseUp')
        end
        
        function __NJLISceneMouseMove(scene, mouse)
        print('__NJLISceneMouseMove')
        end
        
        function __NJLISceneReceivedMemoryWarning(scene)
        print('__NJLISceneReceivedMemoryWarning')
        end
        
        function __NJLISceneWillResignActive(scene)
        print('__NJLISceneWillResignActive')
        end
        
        function __NJLISceneDidBecomeActive(scene)
        print('__NJLISceneDidBecomeActive')
        end
        
        function __NJLISceneDidEnterBackground(scene)
        print('__NJLISceneDidEnterBackground')
        end
        
        function __NJLISceneWillEnterForeground(scene)
        print('__NJLISceneWillEnterForeground')
        end
        
        function __NJLISceneWillTerminate(scene)
        print('__NJLISceneWillTerminate')
        end
        
        function __NJLISceneInterrupt(scene)
        print('__NJLISceneInterrupt')
        end
        
        function __NJLISceneResumeInterrupt(scene)
        print('__NJLISceneResumeInterrupt')
        end
        
        --#############################################################################
        --Node State Functions
        --#############################################################################
        
        function __NJLINodeEnterState(node)
        print('__NJLINodeEnterState')
        end
        
        function __NJLINodeUpdateState(node, timeStep)
        print('__NJLINodeUpdateState')
        end
        
        function __NJLINodeExitState(node)
        print('__NJLINodeExitState')
        end
        
        function __NJLINodeOnMessage(node, message)
        print('__NJLINodeOnMessage')
        end
        
        function __NJLINodeCollide(node, otherNode, collisionPoint)
        print('__NJLINodeCollide')
        end
        
        function __NJLINodeNear(node, otherNode)
        print('__NJLINodeNear')
        end
        
        function __NJLINodeActionUpdate(action, timeStep)
        print('__NJLINodeActionUpdate')
        end
        
        function __NJLINodeActionComplete(action)
        print('__NJLINodeActionComplete')
        end
        
        function __NJLINodeRayTouchesDown(rayContact)
        print('__NJLINodeRayTouchesDown')
        end
        
        function __NJLINodeRayTouchesUp(rayContact)
        print('__NJLINodeRayTouchesUp')
        end
        
        function __NJLINodeRayTouchesMove(rayContact)
        print('__NJLINodeRayTouchesMove')
        end
        
        function __NJLINodeRayTouchesCancelled(rayContact)
        print('__NJLINodeRayTouchesCancelled')
        end
        
        function __NJLINodeRayTouchesMissed(node)
        print('__NJLINodeRayTouchesMissed')
        end
        
        function __NJLINodeRayTouchDown(rayContact)
        print('__NJLINodeRayTouchDown')
        end
        
        function __NJLINodeRayTouchUp(rayContact)
        print('__NJLINodeRayTouchUp')
        end
        
        function __NJLINodeRayTouchMove(rayContact)
        print('__NJLINodeRayTouchMove')
        end
        
        function __NJLINodeRayTouchCancelled(rayContact)
        print('__NJLINodeRayTouchCancelled')
        end
        
        function __NJLINodeRayMouseDown(rayContact)
        print('__NJLINodeRayMouseDown')
        end
        
        function __NJLINodeRayMouseUp(rayContact)
        print('__NJLINodeRayMouseUp')
        end
        
        function __NJLINodeRayMouseMove(rayContact)
        print('__NJLINodeRayMouseMove')
        end
        
        function __NJLINodeRayTouchMissed(node)
        print('__NJLINodeRayTouchMissed')
        end
        
        function __NJLINodeRayMouseMissed(node)
        print('__NJLINodeRayMouseMissed')
        end
        
        function __NJLINodeKeyboardShow(node)
        print('__NJLINodeKeyboardShow')
        end
        
        function __NJLINodeKeyboardCancel(node)
        print('__NJLINodeKeyboardCancel')
        end
        
        function __NJLINodeKeyboardReturn(node)
        print('__NJLINodeKeyboardReturn')
        end
        
        function __NJLINodeRenderHUD(node)
        print('__NJLINodeRenderHUD')
        end
        
        function __NJLINodeGamePause(node)
        print('__NJLINodeGamePause')
        end
        
        function __NJLINodeGameUnPause(node)
        print('__NJLINodeGameUnPause')
        end
        
        function __NJLINodeTouchesDown(node, touches)
        print('__NJLINodeTouchesDown')
        end
        
        function __NJLINodeTouchesUp(node, touches)
        print('__NJLINodeTouchesUp')
        end
        
        function __NJLINodeTouchesMove(node, touches)
        print('__NJLINodeTouchesMove')
        end
        
        function __NJLINodeTouchesCancelled(node, touches)
        print('__NJLINodeTouchesCancelled')
        end
        
        function __NJLINodeTouchDown(node, touches)
        print('__NJLINodeTouchDown')
        end
        
        function __NJLINodeTouchUp(node, touches)
        print('__NJLINodeTouchUp')
        end
        
        function __NJLINodeTouchMove(node, touches)
        print('__NJLINodeTouchMove')
        end
        
        function __NJLINodeTouchCancelled(node, touches)
        print('__NJLINodeTouchCancelled')
        end
        
        function __NJLINodeMouseDown(node, mouse)
        print('__NJLINodeMouseDown')
        end
        
        function __NJLINodeMouseUp(node, mouse)
        print('__NJLINodeMouseUp')
        end
        
        function __NJLINodeMouseMove(node, mouse)
        print('__NJLINodeMouseMove')
        end
        
        --#############################################################################
        --Device Functions
        --#############################################################################
        
        function __NJLIUpdate(timeStep)
        print('__NJLIUpdate(' .. timeStep .. ')')
        end
        
        function __NJLIRender()
        print('__NJLIRender()')
        end
        
        function __NJLIResize(width, height, orientation)
        print('__NJLIResize(' .. width .. ', ' .. height .. ', ' .. orientation .. ')')
        end
        
        function __NJLITouchesDown(touches)
        print('__NJLITouchesDown(' .. #touches .. ')')
        end
        
        function __NJLITouchesUp(touches)
        print('__NJLITouchesUp(' .. #touches .. ')')
        end
        
        function __NJLITouchesMove(touches)
        print('__NJLITouchesMove(' .. #touches .. ')')
        end
        
        function __NJLITouchesCancelled(touches)
        print('__NJLITouchesCancelled(' .. #touches .. ')')
        end
        
        function __NJLITouchDown(touches)
        print('__NJLITouchDown(' .. #touches .. ')')
        end
        
        function __NJLITouchUp(touches)
        print('__NJLITouchUp(' .. #touches .. ')')
        end
        
        function __NJLITouchMove(touches)
        print('__NJLITouchMove(' .. #touches .. ')')
        end
        
        function __NJLITouchCancelled(touches)
        print('__NJLITouchCancelled(' .. #touches .. ')')
        end
        
        function __NJLIMouseDown(mouse)
        print('__NJLIMouseDown()')
        end
        
        function __NJLIMouseUp(mouse)
        print('__NJLIMouseUp()')
        end
        
        function __NJLIMouseMove(mouse)
        print('__NJLIMouseMove()')
        end
        )";
        
//        return (World::getInstance()->getWorldLuaVirtualMachine()->compileString(source.c_str()) && World::getInstance()->getWorldLuaVirtualMachine()->compileFile("scripts/main.lua"));
        return World::getInstance()->getWorldLuaVirtualMachine()->compileFile("scripts/main.lua");
        
    }
void NJLIGameEngine::update(float step)
{
    BT_PROFILE("Game update");
    njli::World::getInstance()->update(step, 3);
}

void NJLIGameEngine::render() { njli::World::getInstance()->render(); }

void NJLIGameEngine::destroy() { njli::World::destroyInstance(); }

//void NJLIGameEngine::setTouch(const void* touch, const int index,
//    const unsigned long num_touches)
//{
//    //    SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "set_touch(%s)\n", "?");
//    njli::World::getInstance()->getWorldInput()->setTouch(touch,
//                                                          index,
//                                                          num_touches);
//}
//    void NJLIGameEngine::setTouch(int deviceIndex, int touchIndex, int num_touches)
//    {
//        njli::World::getInstance()->getWorldInput()->setTouch(deviceIndex, touchIndex, num_touches);
//    }
//    void NJLIGameEngine::setTouch(const int x, const int y)
//    {
//        njli::World::getInstance()->getWorldInput()->setTouch(x, y, 0, 1, 1.0);
//    }
//    
//    void NJLIGameEngine::setTouch(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure)
//    {
//        
//    }
    
//    void NJLIGameEngine::finger(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure)
//    {
//        
//    }
//    
//    void NJLIGameEngine::fingers()
//    {
//        
//    }
//    
//    void NJLIGameEngine::resetFingers()
//    {
//        
//    }
    
    void NJLIGameEngine::handleFinger(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure)
    {
        njli::World::getInstance()->getWorldInput()->handleFinger(touchDevId, pointerFingerId, eventType, x, y, dx, dy, pressure);
    }
    
    void NJLIGameEngine::handleFingers()
    {
        njli::World::getInstance()->getWorldInput()->handleFingers();
    }
    
//    void NJLIGameEngine::startHandleFingers()
//    {
//        njli::World::getInstance()->getWorldInput()->startHandleFingers();
//    }
    
    void NJLIGameEngine::mouse(int button, int eventType, float x, float y, int clicks)
    {
        njli::World::getInstance()->getWorldInput()->handleMouse(button, eventType, x, y, clicks);
    }
    
//void NJLIGameEngine::setTouch(const int x, const int y, const int index,
//    const unsigned long num_touches, float scaleFactor)
//{
//    //    SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "set_touch(%d, %d, %d, %d, %f)\n", x, y, index,
//    //    num_touches, scaleFactor);
//    int xx = (x < 0)
//        ? 0
//        : ((x > njli::World::getInstance()->getViewportDimensions().x())
//                  ? njli::World::getInstance()->getViewportDimensions().x()
//                  : x);
//    int yy = (y < 0)
//        ? 0
//        : ((y > njli::World::getInstance()->getViewportDimensions().y())
//                  ? njli::World::getInstance()->getViewportDimensions().y()
//                  : y);
//
//    njli::World::getInstance()->getWorldInput()->setTouch(
//        xx, yy, index, num_touches, scaleFactor);
//}

//void NJLIGameEngine::clearNodeTouches()
//{
//    njli::World::getInstance()->getWorldInput()->clearNodeTouches();
//}
//
//void NJLIGameEngine::touchDown()
//{
//    //    SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "touch_down(%s)\n", "");
//    njli::World::getInstance()->getWorldInput()->touchDown();
//}
//void NJLIGameEngine::touchUp()
//{
//    //    SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "touch_up(%s)\n", "");
//    njli::World::getInstance()->getWorldInput()->touchUp();
//}
//void NJLIGameEngine::touchMove()
//{
//    //    SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "touch_move(%s)\n", "");
//    njli::World::getInstance()->getWorldInput()->touchMove();
//}
//void NJLIGameEngine::touchCancelled()
//{
//    njli::World::getInstance()->getWorldInput()->touchCancelled();
//}

    void NJLIGameEngine::willResignActive()
    {
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldWillResignActive");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->willResignActive();
        
        
    }
    void NJLIGameEngine::didBecomeActive()
    {
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldDidBecomeActive");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->didBecomeActive();
    }
    
    void NJLIGameEngine::didEnterBackground()
    {
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldDidEnterBackground");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->didEnterBackground();
    }
    
    void NJLIGameEngine::willEnterForeground()
    {
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldWillEnterForeground");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->willEnterForeground();
    }
    
    void NJLIGameEngine::willTerminate()
    {
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldWillTerminate");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->willTerminate();
    }
    
    void NJLIGameEngine::interrupt()
    {
        njli::World::getInstance()->getWorldSound()->enablePause();
        
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldInterrupt");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->interrupt();
    }
    
    void NJLIGameEngine::resumeInterrupt()
    {
        njli::World::getInstance()->getWorldSound()->enablePause(false);
        
        char buffer[256];
        sprintf(buffer, "%s", "__NJLIWorldResumeInterrupt");
        njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
        
        if(njli::World::getInstance()->getScene())
            njli::World::getInstance()->getScene()->resumeInterrupt();
    }
    
//void NJLIGameEngine::pauseGame()
//{
//    njli::World::getInstance()->enablePauseGame();
//}
//
//void NJLIGameEngine::unpauseGame()
//{
//    njli::World::getInstance()->enablePauseGame(false);
//}

//void NJLIGameEngine::pauseSound()
//{
//    njli::World::getInstance()->getWorldSound()->enablePause();
//}
//
//void NJLIGameEngine::unpauseSound()
//{
//    njli::World::getInstance()->getWorldSound()->enablePause(false);
//}

void NJLIGameEngine::keyboardShow()
{
    njli::World::getInstance()->getWorldInput()->keyboardShow();
//    char buffer[256];
//    sprintf(buffer, "%s", "__NJLIWorldKeyboardShow");
//    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
}

void NJLIGameEngine::keyboardCancel()
{
    njli::World::getInstance()->getWorldInput()->keyboardCancel();
//    char buffer[256];
//    sprintf(buffer, "%s", "__NJLIWorldKeyboardCancel");
//    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer);
}

void NJLIGameEngine::keyboardReturn(const char* text)
{
    njli::World::getInstance()->getWorldInput()->keyboardReturn(text);
//    char buffer[256];
//    sprintf(buffer, "%s", "__NJLIWorldKeyboardReturn");
//
//    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute(buffer, text);
}
    
void NJLIGameEngine::receivedMemoryWarning()
{
//    njli::World::getInstance()->getWorldResourceLoader()->unLoadAll();
//    njli::World::getInstance()->getWorldFactory()->collectGarbage();
    njli::World::getInstance()->getWorldLuaVirtualMachine()->execute("__NJLIWorldReceivedMemoryWarning");
    
    if(njli::World::getInstance()->getScene())
        njli::World::getInstance()->getScene()->receivedMemoryWarning();
}
}
