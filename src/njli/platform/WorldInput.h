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
#include <unordered_map>

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
    void handleFinger(int touchDevId, int pointerFingerId, int eventType, float x, float y, float dx, float dy, float pressure);
    void handleFingers();
    
    void handleMouse(int button, int eventType, float x, float y, int clicks);
    
    void keyboardShow();
    void keyboardCancel();
    void keyboardReturn(const char* text);
    
    void setOrientation(const s32 orientation);
    bool isPortraitOrientation() const;
    bool isLandscapeOrientation() const;
    s32 getOrientation() const;

    void showKeyboard(const char* currentText);

protected:
//    void clearTouches();
    DeviceTouch *popNextTouch();
    void recycleTouch(DeviceTouch *touch);

private:
    WorldInput(const WorldInput&);
    WorldInput& operator=(const WorldInput&);
    
    std::unordered_map<int, DeviceTouch*> m_FingerDownMap;
    std::unordered_map<int, DeviceTouch*> m_FingerUpMap;
    std::unordered_map<int, DeviceTouch*> m_FingerMoveMap;
    
    DeviceTouch **m_TouchBuffer;
    
    s32 m_Orientation;
};
}

#endif /* defined(__JLIGameEngineTest__WorldInput__) */
