//#include "AbstractSingleton.h"
#ifndef __JLIGameEngineTest__WorldSound__
#define __JLIGameEngineTest__WorldSound__

//#include "SoundPlatform.h"

#include "GraphicsPlatform.h"
#include "SoundPlatform.h"

#include "AbstractObject.h"
#include "Util.h"
#include <string>

//#if defined(DEBUG) || defined (_DEBUG)
//#define FMOD_LOGGING_ON 1
//#else
//#define FMOD_LOGGING_ON 0
//#endif

//http://www.ogre3d.org/tikiwiki/tiki-index.php?page=FMOD+SoundManager

namespace njli {
class Sound;

class WorldSound : public AbstractObject {
//    friend class WorldResourceLoader;
    friend class Sound;
    friend class World;

public:
    using AbstractDecorator::setName;
    using AbstractDecorator::getName;

    WorldSound();
    ~WorldSound();

    virtual const s8* getClassName() const;
    virtual s32 getType() const;
    virtual operator std::string() const;

    void enablePause(bool enable = true);

//    bool createSound(const char* fileContent, size_t file_size, Sound& sound);
//    bool createSound(const char *path, Sound& sound);
    
    bool loadSound(const char *path, Sound& sound);
    bool loadSound(const char* fileContent, u32 file_size, Sound& sound);
protected:
    void update();

    void playSound(Sound& sound, bool isPaused = false);

    

#if defined(NJLI_SOUND_OPENAL)
    // // OpenAL context for playing sounds
    // ALCcontext* m_ALCcontext;

    // // The device we are going to use to play sounds
    // ALCdevice* m_ALCdevice;

    // std::vector<u32> m_Sources;
#endif

#if defined(NJLI_SOUND_FMOD)
protected:
    FMOD::Channel* getChannel(s32 channelindex);

private:
    FMOD::System* m_System;
    FMOD::ChannelGroup* m_MasterChannel;
    int* m_ChannelsPlaying;
#endif
};
}

#endif
