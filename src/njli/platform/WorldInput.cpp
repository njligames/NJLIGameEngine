//
//  WorldInput.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 1/30/15.
//  Copyright (c) 2015 James Folk. All rights reserved.
//

#include "WorldInput.h"
#include "JLIFactoryTypes.h"
#include "DeviceTouch.h"
#include "World.h"
//#import <UIKit/UIKit.h>
//#import "GameViewController.h"

#define FORMATSTRING "{\"njli::WorldInput\":[]}"
#include "btPrint.h"
#include "JsonJLI.h"

namespace njli
{
    WorldInput::WorldInput():
    m_FingerDownTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    m_FingerUpTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    m_FingerMoveTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    
    m_CurrentFingerDownTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    m_CurrentFingerUpTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    m_CurrentFingerMoveTouches(new njli::DeviceTouch*[njli::DeviceTouch::MAX_TOUCHES]),
    
    m_NumDownTouches(0),
    m_NumUpTouches(0),
    m_NumMoveTouches(0),
    
    m_Orientation(0)
    {
        for (u32 i = 0; i < njli::DeviceTouch::MAX_TOUCHES; ++i)
        {
            m_FingerDownTouches[i] = new njli::DeviceTouch();
            m_FingerUpTouches[i] = new njli::DeviceTouch();
            m_FingerMoveTouches[i] = new njli::DeviceTouch();
            
            m_CurrentFingerDownTouches[i] = NULL;
            m_CurrentFingerUpTouches[i] = NULL;
            m_CurrentFingerMoveTouches[i] = NULL;
        }
    }
    
    WorldInput::~WorldInput()
    {
        for (u32 i = 0; i < njli::DeviceTouch::MAX_TOUCHES; ++i)
        {
            delete m_FingerDownTouches[i];
            delete m_FingerUpTouches[i];
            delete m_FingerMoveTouches[i];
        }
        
        delete [] m_FingerDownTouches;
        delete [] m_FingerUpTouches;
        delete [] m_FingerMoveTouches;
        
        delete [] m_CurrentFingerDownTouches;
        delete [] m_CurrentFingerUpTouches;
        delete [] m_CurrentFingerMoveTouches;
        
    }
    
    const char *WorldInput::getClassName()const
    {
        return "WorldInput";
    }
    
    s32 WorldInput::getType()const
    {
        return JLI_OBJECT_TYPE_WorldInput;
    }
    
    WorldInput::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING));
    }
    
//    DeviceTouch * WorldInput::getTouch(const s32 index)
//    {
//        if (index >= 0 && index < DeviceTouch::MAX_TOUCHES)
//        {
//            return m_CurrentTouches[index];
//        }
//        return NULL;
//    }
//    
//    const DeviceTouch * WorldInput::getTouch(const s32 index)const
//    {
//        if (index >= 0 && index < DeviceTouch::MAX_TOUCHES)
//        {
//            return m_CurrentTouches[index];
//        }
//        return NULL;
//    }
//    
//    s32 WorldInput::numberOfTouches()const
//    {
//        return m_NumTouches;
//    }
    
//    void WorldInput::resetTouches()
//    {
//        m_NumTouches = 0;
//    }
    
//    void WorldInput::setTouch(const void *touch, const int index, const int num_touches)
//    {
//        m_CurrentTouches[index] = m_AllTouches[index];
//        m_CurrentTouches[index]->set(touch, index, num_touches);
//        m_NumTouches = num_touches;
//    }
//    void WorldInput::setTouch(const int x, const int y, const int index, const int num_touches, float scaleFactor)
//    {
//        m_CurrentTouches[index] = m_AllTouches[index];
//        m_CurrentTouches[index]->set(x, y, index, num_touches, scaleFactor);
//        m_NumTouches = num_touches;
//    }
    
//    void WorldInput::setTouch(int deviceIndex, int touchIndex, int num_touches)
//    {
//        m_CurrentTouches[touchIndex] = m_AllTouches[touchIndex];
////        m_CurrentTouches[touchIndex]->set(x, y, index, num_touches, scaleFactor);
//        m_CurrentTouches[touchIndex]->set(SDL_GetTouchFinger(deviceIndex, touchIndex));
//        m_NumTouches = num_touches;
//    }
    
//    void WorldInput::clearNodeTouches()
//    {
//        clearTouches();
//        if(njli::World::getInstance()->getScene())
//            njli::World::getInstance()->getScene()->clearNodeTouches();
//    }
//    
//    void WorldInput::touchDown()
//    {
//        njli::World::getInstance()->touchDown(m_CurrentTouches);
////        clearTouches();
//    }
//    void WorldInput::touchUp()
//    {
//        njli::World::getInstance()->touchUp(m_CurrentTouches);
////        clearTouches();
//    }
//    void WorldInput::touchMove()
//    {
//        njli::World::getInstance()->touchMove(m_CurrentTouches);
////        clearTouches();
//    }
//    void WorldInput::touchCancelled()
//    {
//        njli::World::getInstance()->touchCancelled(m_CurrentTouches);
////        clearTouches();
//    }
    
    
    const DeviceTouch &WorldInput::finger(int eventType, const size_t index)const
    {
        static DeviceTouch _t = DeviceTouch();
        switch(eventType)
        {
            case SDL_FINGERDOWN:
                if(index < m_NumDownTouches)
                    return *m_CurrentFingerDownTouches[index];
            case SDL_FINGERUP:
                if(index < m_NumUpTouches)
                    return *m_CurrentFingerUpTouches[index];
            case SDL_FINGERMOTION:
                if(index < m_NumMoveTouches)
                    return *m_CurrentFingerMoveTouches[index];
            default:
                SDL_assertPrint(false, "%s", "Wrong event type");
        }
        return _t;
    }
    
    u32 WorldInput::numberOfFingers(int eventType)const
    {
        switch(eventType)
        {
            case SDL_FINGERDOWN:
                return m_NumDownTouches;
            case SDL_FINGERUP:
                return m_NumUpTouches;
            case SDL_FINGERMOTION:
                return m_NumMoveTouches;
        }
        return 0;
    }
    
    void WorldInput::startHandleFingers()
    {
        m_NumDownTouches = 0;
        m_NumUpTouches = 0;
        m_NumMoveTouches = 0;
        clearTouches();
    }
    
    void WorldInput::addFinger(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure)
    {
        switch(eventType)
        {
            case SDL_FINGERDOWN:
            {
                m_CurrentFingerDownTouches[m_NumDownTouches] = m_FingerDownTouches[m_NumDownTouches];
                m_CurrentFingerDownTouches[m_NumDownTouches]->set(touchDevId, pointerFingerId, eventType, x, y, dx, dy, pressure);
                njli::World::getInstance()->touchDown(*(m_CurrentFingerDownTouches[m_NumDownTouches]));
                m_NumDownTouches++;
            }
                break;
            case SDL_FINGERUP:
            {
                m_CurrentFingerUpTouches[m_NumUpTouches] = m_FingerUpTouches[m_NumUpTouches];
                m_CurrentFingerUpTouches[m_NumUpTouches]->set(touchDevId, pointerFingerId, eventType, x, y, dx, dy, pressure);
                njli::World::getInstance()->touchDown(*(m_CurrentFingerUpTouches[m_NumDownTouches]));
                m_NumUpTouches++;
            }
                break;
            case SDL_FINGERMOTION:
            {
                m_CurrentFingerMoveTouches[m_NumMoveTouches] = m_FingerMoveTouches[m_NumMoveTouches];
                m_CurrentFingerMoveTouches[m_NumMoveTouches]->set(touchDevId, pointerFingerId, eventType, x, y, dx, dy, pressure);
                njli::World::getInstance()->touchDown(*(m_CurrentFingerMoveTouches[m_NumDownTouches]));
                m_NumMoveTouches++;
            }
                break;
            default:
                return;
        }
    }
    
    void WorldInput::finishHandleFingers()
    {
        if(m_NumDownTouches > 0)
            njli::World::getInstance()->touchDown(m_CurrentFingerDownTouches);
        
        if(m_NumUpTouches > 0)
            njli::World::getInstance()->touchUp(m_CurrentFingerUpTouches);
        
        if(m_NumMoveTouches > 0)
            njli::World::getInstance()->touchMove(m_CurrentFingerMoveTouches);
    }
    
    void WorldInput::mouse(int button, int eventType, float x, float y, int clicks)
    {
        
    }
    
    void WorldInput::keyboardShow()
    {
        njli::World::getInstance()->keyboardShow();
    }
    
    void WorldInput::keyboardCancel()
    {
        njli::World::getInstance()->keyboardCancel();
    }
    
    void WorldInput::keyboardReturn(const char* text)
    {
        njli::World::getInstance()->keyboardReturn(text);
    }
    
    void WorldInput::setOrientation(const s32 orientation)
    {
        m_Orientation = orientation;
    }
    
    bool WorldInput::isPortraitOrientation()const
    {
//        return (((UIInterfaceOrientation)m_Orientation == UIInterfaceOrientationPortrait) || ((UIInterfaceOrientation)m_Orientation == UIInterfaceOrientationPortraitUpsideDown));
    }
    
    bool WorldInput::isLandscapeOrientation()const
    {
//        return (((UIInterfaceOrientation)m_Orientation == UIInterfaceOrientationLandscapeLeft) || ((UIInterfaceOrientation)m_Orientation == UIInterfaceOrientationLandscapeRight));
    }
    
    s32 WorldInput::getOrientation()const
    {
        return m_Orientation;
    }
    
    void WorldInput::showKeyboard(const char *currentText)
    {
//        id<UIApplicationDelegate> appDelegate = [[UIApplication sharedApplication] delegate];
//        GameViewController *viewController = (GameViewController*)appDelegate.window.rootViewController;
//        [viewController showKeyboard:[NSString stringWithCString:currentText encoding:NSUTF8StringEncoding]];
    }
    
    void WorldInput::clearTouches()
    {
        for (u32 i = 0; i < njli::DeviceTouch::MAX_TOUCHES; ++i)
        {
            m_CurrentFingerDownTouches[i] = NULL;
            m_CurrentFingerUpTouches[i] = NULL;
            m_CurrentFingerMoveTouches[i] = NULL;
        }
    }
}
