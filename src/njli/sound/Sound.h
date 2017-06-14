//
//  Sound.h
//  JLIGameEngineTest
//
//  Created by James Folk on 11/22/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#ifndef __JLIGameEngineTest__Sound__
#define __JLIGameEngineTest__Sound__

#include "GraphicsPlatform.h"

#include "AbstractBuilder.h"
#include "AbstractFactoryObject.h"
#include "AbstractTransform.h"
#include "lua.hpp"

#include "SoundPlatform.h"

#if defined(NJLI_SOUND_OPENAL)
#define STB_VORBIS_HEADER_ONLY
#include "stb_vorbis.c"
#endif

namespace njli {
class SoundBuilder;
class Node;

ATTRIBUTE_ALIGNED16(class)
Sound :
    //    class Sound:
    public AbstractFactoryObject,
    public AbstractTransform
{
    friend class WorldFactory;
    friend class WorldSound;

protected:
    Sound();
    Sound(const AbstractBuilder&);
    Sound(const Sound&);
    BT_DECLARE_ALIGNED_ALLOCATOR();
    virtual ~Sound();
    Sound& operator=(const Sound&);

public:
    using AbstractDecorator::setName;
    using AbstractDecorator::getName;
    using AbstractFactoryObject::create;
//    using AbstractFactoryObject::clone;
    using AbstractFactoryObject::getPointer;
    using AbstractFactoryObject::getPointerValue;
    using AbstractFactoryObject::serializeObject;

    virtual s32 calculateSerializeBufferSize() const;
    virtual void serialize(void*, btSerializer*) const;

    virtual const char* getClassName() const;
    virtual s32 getType() const;
    operator std::string() const;

    static Sound** createArray(const u32 size);
    static void destroyArray(Sound * *array, const u32 size = 0);
    static Sound* create();
    static Sound* create(const SoundBuilder& builder);
    static Sound* clone(const Sound& object);
    static Sound* copy(const Sound& object);
    static void destroy(Sound * object);
    static void load(Sound & object, lua_State * L, int stack_index);
    static u32 type();

public:
    //TODO: fill in specific methods for Sound
    f32 getTimePosition();
    void setTimePosition(f32 pos);
    f32 getTimeLength();

    bool isPlaying();
    void play(bool isPaused = false);
    void stop();

    bool isPaused();
    void pause();
    void unPause();

    bool isMuted();
    void mute();
    void unMute();

    f32 getVolume();
    void setVolume(f32 vol = 1.0f);

    s32 getLoopCount();
    void setLoopCount(s32 count);

    virtual btTransform getWorldTransform() const;
    
    bool load(void *system, const char *path);
    bool load(void *system, const char* fileContent, u32 size);

#if defined(NJLI_SOUND_OPENAL)
    
    void update();
private:
    typedef struct{
        ALuint ID;
        
        stb_vorbis* stream;
        stb_vorbis_info info;
        
        ALuint buffers[2];
        ALuint source;
        ALenum format;
        
        size_t bufferSize;
        
        size_t totalSamplesLeft;
        
        bool shouldLoop;
    }AudioStream;
    
    void AudioStreamInit(AudioStream* self);
    void AudioStreamDeinit(AudioStream* self);
    bool AudioStreamStream(AudioStream* self, ALuint buffer);
    bool AudioStreamOpen(AudioStream* self, const char* filename);
    bool AudioStreamUpdate(AudioStream* self);
    bool AudioStreamPlay(AudioStream* self);
    
    AudioStream *mAudioStream;
    
    Node* getParent();
    const Node* getParent() const;
    
#elif defined(NJLI_SOUND_FMOD)
protected:
    FMOD::Channel* getChannel();
    

private:
    FMOD::Sound* m_Sound;
    s32 m_ChannelIndex;
    btTransform* m_Transform;
#elif defined(NJLI_SOUND_SDL)
#endif

    
};
}

#endif /* defined(__JLIGameEngineTest__Sound__) */
