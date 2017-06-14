//
//  Sound.cpp
//  JLIGameEngineTest
//
//  Created by James Folk on 11/22/14.
//  Copyright (c) 2014 James Folk. All rights reserved.
//

#include "Sound.h"
#include "JLIFactoryTypes.h"
#include "World.h"
#include "SoundBuilder.h"
#include "Log.h"
#define TAG "Sound.cpp"
#include "PhysicsBody.h"



static const char * GetOpenALErrorString(int errID)
{
    if (errID == AL_NO_ERROR) return "";
    if (errID == AL_INVALID_NAME) return "Invalid name";
    if (errID == AL_INVALID_ENUM) return " Invalid enum ";
    if (errID == AL_INVALID_VALUE) return " Invalid value ";
    if (errID == AL_INVALID_OPERATION) return " Invalid operation ";
    if (errID == AL_OUT_OF_MEMORY) return " Out of memory like! ";
    
    return " Don't know ";
}

static inline void CheckOpenALError(const char* stmt, const char* fname, int line)
{
    
    ALenum err = alGetError();
    if (err != AL_NO_ERROR)
    {
        SDL_Log("OpenAL error %08x, (%s) at %s:%i - for %s", err, GetOpenALErrorString(err), fname, line, stmt);
    }
};

#ifndef AL_CHECK
//#ifdef DEBUG
#define AL_CHECK(stmt) do { \
stmt; \
CheckOpenALError(#stmt, __FILE__, __LINE__); \
} while (0);
#else
#define AL_CHECK(stmt) stmt
//#endif
#endif


//http://kcat.strangesoft.net/openal-tutorial.html

/*
#define AL_INVALID_NAME                           0xA001
#define AL_INVALID_ENUM                           0xA002
#define AL_INVALID_VALUE                          0xA003
#define AL_INVALID_OPERATION                      0xA004
#define AL_OUT_OF_MEMORY                          0xA005
 */
//#define TEST_ERROR(_msg) \
//do{\
//ALenum error = alGetError(); \
//switch(error){\
//case AL_INVALID_NAME:SDL_Log("%s - AL_INVALID_NAME", _msg);break;\
//case AL_INVALID_ENUM:SDL_Log("%s - AL_INVALID_ENUM", _msg);break;\
//case AL_INVALID_VALUE:SDL_Log("%s - AL_INVALID_VALUE", _msg);break;\
//case AL_INVALID_OPERATION:SDL_Log("%s - AL_INVALID_OPERATION", _msg);break;\
//case AL_OUT_OF_MEMORY:SDL_Log("%s - AL_OUT_OF_MEMORY", _msg);break;\
//}\
//}while(0)

namespace njli
{
    Sound::Sound():
    AbstractFactoryObject(this),
    mAudioStream(new AudioStream())
    {
        AudioStreamInit(mAudioStream);
    }
    
    Sound::Sound(const AbstractBuilder &builder):
    AbstractFactoryObject(this)
    {
        SDL_assert(false);
    }
    
    Sound::Sound(const Sound &copy):
    AbstractFactoryObject(this)
    {
        SDL_assert(false);
    }
    
    Sound::~Sound()
    {
        AudioStreamDeinit(mAudioStream);
        delete mAudioStream;
    }
    
    Sound &Sound::operator=(const Sound &rhs)
    {
        SDL_assert(false);
        if(this != &rhs)
        {
            
        }
        return *this;
    }
    
    s32 Sound::calculateSerializeBufferSize() const
    {
        //TODO: calculateSerializeBufferSize
        return 0;
    }
    
    void Sound::serialize(void* dataBuffer, btSerializer* serializer) const
    {
        //TODO: serialize
    }
    
    const char *Sound::getClassName()const
    {
        return "Sound";
    }
    
    s32 Sound::getType()const
    {
        return Sound::type();
    }
    
    Sound::operator std::string() const
    {
        return "TODO";
    }
    
    Sound **Sound::createArray(const u32 size)
    {
        return (Sound**)World::getInstance()->getWorldFactory()->createArray(Sound::type(), size);
    }
    
    void Sound::destroyArray(Sound **array, const u32 size)
    {
        World::getInstance()->getWorldFactory()->destroyArray((AbstractFactoryObject**)array, size);
    }
    
    Sound *Sound::create()
    {
        return dynamic_cast<Sound*>(World::getInstance()->getWorldFactory()->create(Sound::type()));
    }
    
    Sound *Sound::create(const SoundBuilder &builder)
    {
        AbstractBuilder *b = (AbstractBuilder *)&builder;
        
        return dynamic_cast<Sound*>(World::getInstance()->getWorldFactory()->create(*b));
    }
    
    Sound *Sound::clone(const Sound &object)
    {
        return dynamic_cast<Sound*>(World::getInstance()->getWorldFactory()->clone(object, false));
    }
    
    Sound *Sound::copy(const Sound &object)
    {
        return dynamic_cast<Sound*>(World::getInstance()->getWorldFactory()->clone(object, true));
    }
    
    void Sound::destroy(Sound *object)
    {
        World::getInstance()->getWorldFactory()->destroy(object);
    }
    
    void Sound::load(Sound &object, lua_State *L, int index)
    {
        // Push another reference to the table on top of the stack (so we know
        // where it is, and this function can work for negative, positive and
        // pseudo indices
        lua_pushvalue(L, index);
        // stack now contains: -1 => table
        lua_pushnil(L);
        // stack now contains: -1 => nil; -2 => table
        while (lua_next(L, -2))
        {
            // stack now contains: -1 => value; -2 => key; -3 => table
            // copy the key so that lua_tostring does not modify the original
            lua_pushvalue(L, -2);
            // stack now contains: -1 => key; -2 => value; -3 => key; -4 => table
            const char *key = lua_tostring(L, -1);
            //const char *value = lua_tostring(L, -2);
            if(lua_istable(L, -2))
            {
                Sound::load(object, L, -2);
            }
            else
            {
                if(lua_isnumber(L, index))
                {
                    double number = lua_tonumber(L, index);
                    printf("%s => %f\n", key, number);
                }
                else if(lua_isstring(L, index))
                {
                    const char *v = lua_tostring(L, index);
                    printf("%s => %s\n", key, v);
                }
                else if(lua_isboolean(L, index))
                {
                    bool v = lua_toboolean(L, index);
                    printf("%s => %d\n", key, v);
                }
                else if(lua_isuserdata(L, index))
                {
//                    swig_lua_userdata *usr;
//                    swig_type_info *type;
//                    assert(lua_isuserdata(L,index));
//                    usr=(swig_lua_userdata*)lua_touserdata(L,index);  /* get data */
//                    type = usr->type;
//                    njli::AbstractFactoryObject *object = static_cast<njli::AbstractFactoryObject*>(usr->ptr);
//                    printf("%s => %d:%s\n", key, object->getType(), object->getClassName());
                    
                }
            }
            // pop value + copy of key, leaving original key
            lua_pop(L, 2);
            // stack now contains: -1 => key; -2 => table
        }
        // stack now contains: -1 => table (when lua_next returns 0 it pops the key
        // but does not push anything.)
        // Pop table
        lua_pop(L, 1);
        // Stack is now the same as it was on entry to this function
    }
    
    u32 Sound::type()
    {
        return JLI_OBJECT_TYPE_Sound;
    }
    
    f32 Sound::getTimePosition()
    {
        u32 _pos = 0;
        // FMOD::Channel *channel = getChannel();
        // if(channel)
        //     channel->getPosition(&_pos, FMOD_TIMEUNIT_MS);
        return (f32)_pos/1000.0f;
    }
    
    void Sound::setTimePosition(f32 pos)
    {
        //u32 _pos = (u32)pos * 1000.0f;
        // FMOD::Channel *channel = getChannel();
        // if(channel)
        //     channel->setPosition(_pos, FMOD_TIMEUNIT_MS);
    }
    
    f32 Sound::getTimeLength()
    {
        u32 length = 0;
        // m_Sound->getLength(&length, FMOD_TIMEUNIT_MS);
        return (f32)length/1000.0f;
    }
    
    bool Sound::isPlaying()
    {
        ALint val;
        AL_CHECK(alGetSourcei(mAudioStream->source, AL_SOURCE_STATE, &val));
        return (val == AL_PLAYING);
    }
    
    void Sound::play(bool isPaused)
    {
        AudioStreamPlay(mAudioStream);
        njli::World::getInstance()->getWorldSound()->playSound(*this, isPaused);
    }
    
    void Sound::stop()
    {
        
    }
    
    bool Sound::isPaused()
    {
        bool paused = false;
        
        return paused;
    }
    
    void Sound::pause()
    {
        
    }
    
    void Sound::unPause()
    {
        
    }
    
    bool Sound::isMuted()
    {
        bool muted = false;
        
        return muted;
    }
    
    void Sound::mute()
    {
        
    }
    
    void Sound::unMute()
    {
        
    }
    
    f32 Sound::getVolume()
    {
        f32 volume = 1.0f;
        
        return volume;
    }
    
    void Sound::setVolume(f32 vol)
    {
        
    }
    
    s32 Sound::getLoopCount()
    {
        s32 count = 0;
        
        return count;
    }
    
    void Sound::setLoopCount(s32 count)
    {
        
    }
    
    btTransform Sound::getWorldTransform()const
    {
         if(getParent())
             return getParent()->getWorldTransform() * getTransform();
        return btTransform::getIdentity();
    }
    
    bool Sound::load(void *system, const char *path)
    {
        return AudioStreamOpen(mAudioStream, path);
    }
    
    bool Sound::load(void *system, const char* fileContent, u32 size)
    {
        SDL_assert(false);
        return false;
    }
    
    void Sound::update()
    {
        if(isPlaying())
            AudioStreamUpdate(mAudioStream);
    }
    
     Node *Sound::getParent()
     {
         return dynamic_cast<Node*>(AbstractDecorator::getParent());
     }
    
     const Node *Sound::getParent()const
     {
         return dynamic_cast<const Node*>(AbstractDecorator::getParent());
     }
    
    void Sound::AudioStreamInit(AudioStream* self)
    {
        memset(self, 0, sizeof(AudioStream));
        
        AL_CHECK(alGenSources(1, & self->source));
        AL_CHECK(alGenBuffers(2, self->buffers));
        
        self->bufferSize=4096*8;
        self->shouldLoop=true;//We loop by default
    }
    
    void Sound::AudioStreamDeinit(AudioStream* self)
    {
        ALint val;
        do
        {
            AL_CHECK(alGetSourcei(self->source, AL_SOURCE_STATE, &val));
        }
        while(val == AL_PLAYING);
        
        AL_CHECK(alDeleteSources(1, & self->source));
        AL_CHECK(alDeleteBuffers(2, self->buffers));
        
        stb_vorbis_close(self->stream);
        memset(self, 0, sizeof(AudioStream));
    }
    
    bool Sound::AudioStreamStream(AudioStream* self, ALuint buffer)
    {
        //Uncomment this to avoid VLAs
        //#define BUFFER_SIZE 4096*32
#ifndef BUFFER_SIZE//VLAs ftw
#define BUFFER_SIZE (self->bufferSize)
#endif
        ALshort pcm[BUFFER_SIZE];
        int  size = 0;
        int  result = 0;
        
        while(size < BUFFER_SIZE)
        {
            result = stb_vorbis_get_samples_short_interleaved(self->stream, self->info.channels, pcm+size, BUFFER_SIZE-size);
            if(result > 0) size += result*self->info.channels;
            else break;
        }
        
        if(size == 0) return false;
        
        AL_CHECK(alBufferData(buffer, self->format, pcm, size*sizeof(ALshort), self->info.sample_rate));
        
        self->totalSamplesLeft-=size;
#undef BUFFER_SIZE
        
        return true;
    }
    
    bool Sound::AudioStreamOpen(AudioStream* self, const char* filename)
    {
        self->stream = stb_vorbis_open_filename(ASSET_PATH((char*)filename), NULL, NULL);
        if(not self->stream) return false;
        // Get file info
        self->info = stb_vorbis_get_info(self->stream);
        if(self->info.channels == 2) self->format = AL_FORMAT_STEREO16;
        else self->format = AL_FORMAT_MONO16;
        
        if(not AudioStreamStream(self, self->buffers[0])) return false;
        if(not AudioStreamStream(self, self->buffers[1])) return false;
        AL_CHECK(alSourceQueueBuffers(self->source, 2, self->buffers));
        
        self->totalSamplesLeft=stb_vorbis_stream_length_in_samples(self->stream) * self->info.channels;
        
        return true;
    }
    
    bool Sound::AudioStreamUpdate(AudioStream* self)
    {
        ALint processed=0;
        
        AL_CHECK(alGetSourcei(self->source, AL_BUFFERS_PROCESSED, &processed));
        
        while(processed--)
        {
            ALuint buffer=0;
            
            AL_CHECK(alSourceUnqueueBuffers(self->source, 1, &buffer));
            
            if(not AudioStreamStream(self, buffer)){
                bool shouldExit=true;
                
                if(self->shouldLoop){
                    stb_vorbis_seek_start(self->stream);
                    self->totalSamplesLeft=stb_vorbis_stream_length_in_samples(self->stream) * self->info.channels;
                    shouldExit=not AudioStreamStream(self, buffer);
                }
                
                if(shouldExit) return false;
            }
            AL_CHECK(alSourceQueueBuffers(self->source, 1, &buffer));
        }
        
        return true;
    }
    
    bool Sound::AudioStreamPlay(AudioStream* self)
    {
        AL_CHECK(alSourcePlay(self->source));
        
        return true;
    }
}
