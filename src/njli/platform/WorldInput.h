//
//  WorldInput.h
//  JLIGameEngineTest
//
//  Created by James Folk on 1/30/15.
//  Copyright (c) 2015 James Folk. All rights reserved.
//

#ifndef __JLIGameEngineTest__WorldInput__
#define __JLIGameEngineTest__WorldInput__

#include "AbstractObject.h"
#include <string>
#include "DeviceTouch.h"

namespace njli {
class DeviceTouch;

class WorldInput : public AbstractObject {
public:
    using AbstractDecorator::setName;
    using AbstractDecorator::getName;

    WorldInput();
    virtual ~WorldInput();

    virtual const char* getClassName() const;
    virtual s32 getType() const;
    operator std::string() const;

public:
    //TODO: fill in specific methods for WorldInput

    const DeviceTouch &finger(int eventType, const size_t index)const;
    u32 numberOfFingers(int eventType)const;
    
    void startHandleFingers();
    void addFinger(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure);
    void finishHandleFingers();
    
    void mouse(int button, int eventType, float x, float y, int clicks);
    
    void keyboardShow();
    void keyboardCancel();
    void keyboardReturn(const char* text);
    
    void setOrientation(const s32 orientation);
    bool isPortraitOrientation() const;
    bool isLandscapeOrientation() const;
    s32 getOrientation() const;

    void showKeyboard(const char* currentText);

protected:
    void clearTouches();

private:
    WorldInput(const WorldInput&);
    WorldInput& operator=(const WorldInput&);
    
    std::vector<DeviceTouch*> m_DeviceTouches;

    DeviceTouch** m_FingerDownTouches;
    DeviceTouch** m_FingerUpTouches;
    DeviceTouch** m_FingerMoveTouches;
    
    DeviceTouch** m_CurrentFingerDownTouches;
    DeviceTouch** m_CurrentFingerUpTouches;
    DeviceTouch** m_CurrentFingerMoveTouches;
    
    s32 m_NumDownTouches;
    s32 m_NumUpTouches;
    s32 m_NumMoveTouches;
    
    s32 m_Orientation;
};
}

#endif /* defined(__JLIGameEngineTest__WorldInput__) */
