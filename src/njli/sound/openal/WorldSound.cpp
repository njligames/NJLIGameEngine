#include "WorldSound.h"
#include "Log.h"
#define TAG "WorldSound.mm"
#include "JLIFactoryTypes.h"
#include "Sound.h"

#include "File.h"

#define MAXCHANNELS (32)

//https://www.gamedev.net/resources/_/technical/game-programming/basic-openal-sound-manager-for-your-project-r3791
//https://www.pcworld.idg.com.au/article/62412/audio_compression_formats_compared/
//https://ffainelli.github.io/openal-example/

#define TEST_ERROR(_msg) \
if (alGetError() != AL_NO_ERROR) {	\
SDL_Log("%s", _msg); \
}

static inline ALenum to_al_format(short channels, short samples)
{
    bool stereo = (channels > 1);
    
    switch (samples) {
        case 16:
            if (stereo)
                return AL_FORMAT_STEREO16;
            else
                return AL_FORMAT_MONO16;
        case 8:
            if (stereo)
                return AL_FORMAT_STEREO8;
            else
                return AL_FORMAT_MONO8;
        default:
            return -1;
    }
}

static void list_audio_devices(const ALCchar *devices)
{
    const ALCchar *device = devices, *next = devices + 1;
    size_t len = 0;
    
    SDL_Log("%s", "Devices list:\n");
    SDL_Log("%s", "----------\n");
    while (device && *device != '\0' && next && *next != '\0') {
        SDL_Log("%s", device);
        len = strlen(device);
        device += (len + 1);
        next += (len + 2);
    }
    SDL_Log("%s", "----------\n");
}

namespace njli
{
    WorldSound::WorldSound()
    {
        
        ALboolean enumeration = alcIsExtensionPresent(NULL, "ALC_ENUMERATION_EXT");
        if (enumeration == AL_FALSE)
            fprintf(stderr, "enumeration extension not available\n");
        
        list_audio_devices(alcGetString(NULL, ALC_DEVICE_SPECIFIER));
        
        const ALCchar *defaultDeviceName = alcGetString(NULL, ALC_DEFAULT_DEVICE_SPECIFIER);
        
        m_ALCdevice = alcOpenDevice(defaultDeviceName);
        if (!m_ALCdevice)
        {
            SDL_LogError(SDL_LOG_CATEGORY_TEST, "%s", "unable to open default device\n");
        }
        
        SDL_LogVerbose(SDL_LOG_CATEGORY_TEST, "Device: %s\n", alcGetString(m_ALCdevice, ALC_DEVICE_SPECIFIER));
        
        TEST_ERROR("make default device");
        
        m_ALCcontext = alcCreateContext(m_ALCdevice, NULL);
        if (!alcMakeContextCurrent(m_ALCcontext)) {
            SDL_LogError(SDL_LOG_CATEGORY_TEST, "%s", "failed to make default context\n");
        }
        TEST_ERROR("make default context");
        
        ALfloat listenerOri[] = { 0.0f, 0.0f, 1.0f, 0.0f, 1.0f, 0.0f };
        /* set orientation */
        alListener3f(AL_POSITION, 0, 0, 1.0f);
        TEST_ERROR("listener position");
        alListener3f(AL_VELOCITY, 0, 0, 0);
        TEST_ERROR("listener velocity");
        alListenerfv(AL_ORIENTATION, listenerOri);
        TEST_ERROR("listener orientation");
        
    }
    WorldSound::~WorldSound()
    {
        alcMakeContextCurrent(NULL);
        alcDestroyContext(m_ALCcontext);
        alcCloseDevice(m_ALCdevice);
    }
    
    const s8 *WorldSound::getClassName()const
    {
        return "WorldSound";
    }
    
    s32 WorldSound::getType()const
    {
        return JLI_OBJECT_TYPE_WorldSound;
    }
    
    WorldSound::operator std::string() const
    {
        return std::string("TODO");
    }
    
    void WorldSound::update()
    {
        for (std::vector<Sound*>::iterator i = mPlayingSounds.begin(); i != mPlayingSounds.end(); )
        {
            Sound *sound = *i;
            
            sound->update();
            
            if(sound->isPlaying())
            {
                i++;
            }
            else
            {
                i = mPlayingSounds.erase(i);
            }
        }
    }
    
    
    void WorldSound::playSound(Sound &sound, bool isPaused)
    {
        mPlayingSounds.push_back(&sound);
    }
    
    bool WorldSound::loadSound(const char *path, Sound& sound)
    {
        if(sound.load(NULL, path))
        {
            mSounds.push_back(&sound);
            return true;
        }
        return false;
    }
    
    bool WorldSound::loadSound(const char* fileContent, u32 size, Sound& sound)
    {
        return sound.load(NULL, fileContent, size);
    }
    
    bool WorldSound::unLoadSound(const Sound &sound)
    {
        return true;
    }
    
    void WorldSound::enablePause(bool enable)
    {
        if (enable)
        {
            
        }
        else
        {
            
        }
    }
}
