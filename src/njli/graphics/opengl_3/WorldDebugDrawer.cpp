//
//  WorldDebugDrawer.cpp
//  macOS
//
//  Created by James Folk on 6/1/17.
//
//

#define DEBUG_DRAW_IMPLEMENTATION
#include "WorldDebugDrawer.h"
#include "SDL.h"
#include "glm/gtc/type_ptr.hpp"
#include "Camera.h"
#include "World.h"
#define FORMATSTRING "{\"njli::WorldDebugDrawer\":[]}"
#include "JsonJLI.h"

glm::vec3 bulletToGlm(const btVector3& v) { return glm::vec3(v.getX(), v.getY(), v.getZ()); }

btVector3 glmToBullet(const glm::vec3& v) { return btVector3(v.x, v.y, v.z); }

glm::quat bulletToGlm(const btQuaternion& q) { return glm::quat(q.getW(), q.getX(), q.getY(), q.getZ()); }

btQuaternion glmToBullet(const glm::quat& q) { return btQuaternion(q.x, q.y, q.z, q.w); }

btMatrix3x3 glmToBullet(const glm::mat3& m) { return btMatrix3x3(m[0][0], m[1][0], m[2][0], m[0][1], m[1][1], m[2][1], m[0][2], m[1][2], m[2][2]); }

// btTransform does not contain a full 4x4 matrix, so this transform is lossy.
// Affine transformations are OK but perspective transformations are not.
btTransform glmToBullet(const glm::mat4& m)
{
    glm::mat3 m3(m);
    return btTransform(glmToBullet(m3), glmToBullet(glm::vec3(m[3][0], m[3][1], m[3][2])));
}

glm::mat4 bulletToGlm(const btTransform& t)
{
    glm::mat4 m(0);
    const btMatrix3x3& basis = t.getBasis();
    // rotation
    for (int r = 0; r < 3; r++)
    {
        for (int c = 0; c < 3; c++)
        {
            m[c][r] = basis[r][c];
        }
    }
    // traslation
    btVector3 origin = t.getOrigin();
    m[3][0] = origin.getX();
    m[3][1] = origin.getY();
    m[3][2] = origin.getZ();
    // unit scale
    m[0][3] = 0.0f;
    m[1][3] = 0.0f;
    m[2][3] = 0.0f;
    m[3][3] = 1.0f;
    return m;
}

namespace njli
{
    static const std::string linePointVertShaderSource=R"(
    
    attribute vec3 in_Position;
    attribute vec4 in_ColorPointSize;
    
    uniform mat4 u_MvpMatrix;
    
    varying vec4 v_Color;
    
    void main()
    {
        gl_Position  = u_MvpMatrix * vec4(in_Position, 1.0);
        gl_PointSize = in_ColorPointSize.w;
        v_Color      = vec4(in_ColorPointSize.xyz, 1.0);
    }
    
    )";
    
    static const std::string linePointFragShaderSource=R"(
    
#ifdef GL_ES
    precision mediump float;
#endif
    
    varying vec4 v_Color;
    
    void main()
    {
        gl_FragColor = v_Color;
    }
    
    )";
    
    WorldDebugDrawer::WorldDebugDrawer() :
    m_DebugMode(btIDebugDraw::DBG_MAX_DEBUG_DRAW_MODE),
    m_mvpMatrix(glm::mat4(1.0f)),
    linePointProgram(0),
    linePointProgram_MvpMatrixLocation(-1),
    textProgram(0),
    textProgram_GlyphTextureLocation(-1),
    textProgram_ScreenDimensions(-1),
    linePointVAO(0),
    linePointVBO(0),
    textVAO(0),
    textVBO(0)
    {
        
    }
    
    WorldDebugDrawer::~WorldDebugDrawer()
    {
        glDeleteProgram(linePointProgram);
        glDeleteProgram(textProgram);
        
        glDeleteVertexArrays(1, &linePointVAO);
        
        glDeleteBuffers(1, &linePointVBO);
        
        glDeleteVertexArrays(1, &textVAO);
        
        glDeleteBuffers(1, &textVBO);
    }

    const char *WorldDebugDrawer::getClassName()const
    {
        return "WorldDebugDrawer";
    }
    
    s32 WorldDebugDrawer::getType()const
    {
        return JLI_OBJECT_TYPE_WorldDebugDrawer;
    }
    
    WorldDebugDrawer::operator std::string() const
    {
        return njli::JsonJLI::parse(string_format("%s", FORMATSTRING));
    }
    
    void WorldDebugDrawer::beginDraw()
    {
    }
    
    void WorldDebugDrawer::endDraw() { }
    
    void WorldDebugDrawer::drawPointList(const dd::DrawVertex * points, int count, bool depthEnabled)
    {
        SDL_assert(points != nullptr);
        SDL_assert(count > 0 && count <= DEBUG_DRAW_VERTEX_BUFFER_SIZE);
        
        glBindVertexArray(linePointVAO);
        glUseProgram(linePointProgram);
        
        glUniformMatrix4fv(linePointProgram_MvpMatrixLocation,
                           1, GL_FALSE, glm::value_ptr(m_mvpMatrix));
        
        if (depthEnabled)
        {
            glEnable(GL_DEPTH_TEST);
        }
        else
        {
            glDisable(GL_DEPTH_TEST);
        }
        
        // NOTE: Could also use glBufferData to take advantage of the buffer orphaning trick...
        glBindBuffer(GL_ARRAY_BUFFER, linePointVBO);
        glBufferSubData(GL_ARRAY_BUFFER, 0, count * sizeof(dd::DrawVertex), points);
        
        // Issue the draw call:
        glDrawArrays(GL_POINTS, 0, count);
        
        glUseProgram(0);
        
        glBindVertexArray(0);
        
        glBindBuffer(GL_ARRAY_BUFFER, 0);
    }
    
    void WorldDebugDrawer::drawLineList(const dd::DrawVertex * lines, int count, bool depthEnabled)
    {
        assert(lines != nullptr);
        assert(count > 0 && count <= DEBUG_DRAW_VERTEX_BUFFER_SIZE);
        
        glBindVertexArray(linePointVAO);
        
        glUseProgram(linePointProgram);
        
        glUniformMatrix4fv(linePointProgram_MvpMatrixLocation,
                           1, GL_FALSE, glm::value_ptr(m_mvpMatrix));
        
        if (depthEnabled)
        {
            glEnable(GL_DEPTH_TEST);
        }
        else
        {
            glDisable(GL_DEPTH_TEST);
        }
        
        // NOTE: Could also use glBufferData to take advantage of the buffer orphaning trick...
        glBindBuffer(GL_ARRAY_BUFFER, linePointVBO);
        glBufferSubData(GL_ARRAY_BUFFER, 0, count * sizeof(dd::DrawVertex), lines);
        
        // Issue the draw call:
        glDrawArrays(GL_LINES, 0, count);
        
        glUseProgram(0);
        
        glBindVertexArray(0);
        
        glBindBuffer(GL_ARRAY_BUFFER, 0);
        
    }
    void WorldDebugDrawer::drawGlyphList(const dd::DrawVertex *, int, dd::GlyphTextureHandle) { }
    void WorldDebugDrawer::destroyGlyphTexture(dd::GlyphTextureHandle) { }
    dd::GlyphTextureHandle WorldDebugDrawer::createGlyphTexture(int, int, const void *) { return NULL; }

    void WorldDebugDrawer::drawLine(const btVector3& from, const btVector3& to, const btVector3& color)
    {
        const float _from[] = {from.x(), from.y(), from.z()};
        const float _to[] = {to.x(), to.y(), to.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::line(_from, _to, _color);
    }
    
    void WorldDebugDrawer::drawContactPoint(const btVector3& PointOnB, const btVector3& normalOnB, btScalar distance, int lifeTime, const btVector3& color)
    {
        const float _pos[] = {PointOnB.x(), PointOnB.y(), PointOnB.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        dd::point(_pos, _color, 1.0, lifeTime);
        
        btVector3 from(PointOnB);
        btVector3 to(PointOnB + (normalOnB.normalized() * normalOnB.length()));
        const float _from[] = {from.x(), from.y(), from.z()};
        const float _to[] = {to.x(), to.y(), to.z()};
        
        dd::line(_from, _to, _color, lifeTime);
    }
    
    void WorldDebugDrawer::reportErrorWarning(const char* warningString)
    {
        SDL_LogError(SDL_LOG_CATEGORY_TEST, "%s", warningString);
    }
    
    void WorldDebugDrawer::draw3dText(const btVector3& location, const char* textString)
    {
        btVector3 color(1.0, 1.0, 1.0);
        
        const float _pos[] = {location.x(), location.y(), location.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::projectedText(std::string(textString), _pos, _color, glm::value_ptr(m_mvpMatrix),
                          0, 0,
                          njli::World::getInstance()->getViewportDimensions().x(),
                          njli::World::getInstance()->getViewportDimensions().y());
    }
    
    void WorldDebugDrawer::setDebugMode(int debugMode)
    {
        m_DebugMode = debugMode;
    }
    
    int WorldDebugDrawer::getDebugMode() const
    {
        return m_DebugMode;
    }
    
    void WorldDebugDrawer::init()
    {
        dd::initialize(this);
        
        glEnable(GL_CULL_FACE);
        glEnable(GL_DEPTH_TEST);
        glDisable(GL_BLEND);
        
        // This has to be enabled since the point drawing shader will use gl_PointSize.

//        glEnable(GL_PROGRAM_POINT_SIZE);
        
        setupShaderPrograms();
        setupVertexBuffers();
    }
    
    void WorldDebugDrawer::unInit()
    {
        dd::shutdown();
    }
    
    void WorldDebugDrawer::draw(Camera *camera)
    {
        glm::mat4 viewMatrix = bulletToGlm(camera->getModelView());
        glm::mat4 perspectiveMatrix = bulletToGlm(camera->getProjection());
        
        m_mvpMatrix = perspectiveMatrix * viewMatrix;
        
        if (dd::hasPendingDraws())
        {
            dd::flush(0);
        }
    }
    
    void WorldDebugDrawer::point(const btVector3 &pos,
                                 const btVector3 &color,
                                 float size,
                                 int durationMillis,
                                 bool depthEnabled)
    {
        const float _pos[] = {pos.x(), pos.y(), pos.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::point(_pos, _color, size, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::line(const btVector3 &from,
              const btVector3 &to,
              const btVector3 &color,
              int durationMillis,
              bool depthEnabled)
    {
        const float _from[] = {from.x(), from.y(), from.z()};
        const float _to[] = {to.x(), to.y(), to.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::line(_from, _to, _color, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::screenText(ddStrParam str,
                    const btVector3 &pos,
                    const btVector3 &color,
                    float scaling,
                    int durationMillis)
    {
        const float _pos[] = {pos.x(), pos.y(), pos.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::screenText(str, _pos, _color);
    }
    
    void WorldDebugDrawer::projectedText(ddStrParam str,
                       const btVector3 &pos,
                       const btVector3 &color,
                       float scaling,
                       int durationMillis)
    {
        const float _pos[] = {pos.x(), pos.y(), pos.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::projectedText(str, _pos, _color, glm::value_ptr(m_mvpMatrix),
                          0, 0,
                          njli::World::getInstance()->getViewportDimensions().x(),
                          njli::World::getInstance()->getViewportDimensions().y());

    }
    
//    void WorldDebugDrawer::axisTriad(ddMat4x4Param transform,
//                   float size, float length,
//                   int durationMillis,
//                   bool depthEnabled)
//    {
//        const float _from[] = {from.x(), from.y(), from.z()};
//        const float _to[] = {to.x(), to.y(), to.z()};
//        const float _color[] = {color.x(), color.y(), color.z()};
//    }
    
    void WorldDebugDrawer::arrow(const btVector3 &from,
               const btVector3 &to,
               const btVector3 &color,
               float size,
               int durationMillis,
               bool depthEnabled)
    {
        const float _from[] = {from.x(), from.y(), from.z()};
        const float _to[] = {to.x(), to.y(), to.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::arrow(_from, _to, _color, size, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::cross(const btVector3 &center,
               float length,
               int durationMillis,
               bool depthEnabled)
    {
        const float _center[] = {center.x(), center.y(), center.z()};
        
        dd::cross(_center, length, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::circle(const btVector3 &center,
                const btVector3 &planeNormal,
                const btVector3 &color,
                float radius,
                float numSteps,
                int durationMillis,
                bool depthEnabled)
    {
        const float _center[] = {center.x(), center.y(), center.z()};
        const float _planeNormal[] = {planeNormal.x(), planeNormal.y(), planeNormal.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::circle(_center, _planeNormal, _color, radius, numSteps, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::plane(const btVector3 &center,
               const btVector3 &planeNormal,
               const btVector3 &planeColor,
               const btVector3 &normalVecColor,
               float planeScale,
               float normalVecScale,
               int durationMillis,
               bool depthEnabled)
    {
        const float _center[] = {center.x(), center.y(), center.z()};
        const float _planeNormal[] = {planeNormal.x(), planeNormal.y(), planeNormal.z()};
        const float _planeColor[] = {planeColor.x(), planeColor.y(), planeColor.z()};
        const float _normalVecColor[] = {normalVecColor.x(), normalVecColor.y(), normalVecColor.z()};
        
        dd::plane(_center, _planeNormal, _planeColor, _normalVecColor, planeScale, normalVecScale, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::sphere(const btVector3 &center,
                const btVector3 &color,
                float radius,
                int durationMillis,
                bool depthEnabled)
    {
        const float _center[] = {center.x(), center.y(), center.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::sphere(_center, _color, radius, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::cone(const btVector3 &apex,
              const btVector3 &dir,
              const btVector3 &color,
              float baseRadius,
              float apexRadius,
              int durationMillis,
              bool depthEnabled)
    {
        const float _apex[] = {apex.x(), apex.y(), apex.z()};
        const float _dir[] = {dir.x(), dir.y(), dir.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::cone(_apex, _dir, _color, baseRadius, apexRadius, durationMillis, depthEnabled);
    }
    
//    void WorldDebugDrawer::box(const ddVec3 points[8],
//             const btVector3 &color,
//             int durationMillis,
//             bool depthEnabled)
//    {
//        const float _from[] = {from.x(), from.y(), from.z()};
//        const float _to[] = {to.x(), to.y(), to.z()};
//        const float _color[] = {color.x(), color.y(), color.z()};
//    }
    
    void WorldDebugDrawer::box(const btVector3 &center,
             const btVector3 &color,
             float width,
             float height,
             float depth,
             int durationMillis,
             bool depthEnabled)
    {
        const float _center[] = {center.x(), center.y(), center.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::box(_center, _color, width, height, depth, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::aabb(const btVector3 &mins,
              const btVector3 &maxs,
              const btVector3 &color,
              int durationMillis,
              bool depthEnabled)
    {
        const float _mins[] = {mins.x(), mins.y(), mins.z()};
        const float _maxs[] = {maxs.x(), maxs.y(), maxs.z()};
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::aabb(_mins, _maxs, _color, durationMillis, depthEnabled);
    }
    
//    void WorldDebugDrawer::frustum(ddMat4x4Param invClipMatrix,
//                 const btVector3 &color,
//                 int durationMillis,
//                 bool depthEnabled)
//    {
//        const float _mins[] = {mins.x(), mins.y(), mins.z()};
//        const float _maxs[] = {maxs.x(), maxs.y(), maxs.z()};
//        const float _color[] = {color.x(), color.y(), color.z()};
//    }
    
    void WorldDebugDrawer::vertexNormal(const btVector3 &origin,
                      const btVector3 &normal,
                      float length,
                      int durationMillis,
                      bool depthEnabled)
    {
        const float _origin[] = {origin.x(), origin.y(), origin.z()};
        const float _normal[] = {normal.x(), normal.y(), normal.z()};
        
        dd::vertexNormal(_origin, _normal, length, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::tangentBasis(const btVector3 &origin,
                      const btVector3 &normal,
                      const btVector3 &tangent,
                      const btVector3 &bitangent,
                      float lengths,
                      int durationMillis,
                      bool depthEnabled)
    {
        const float _origin[] = {origin.x(), origin.y(), origin.z()};
        const float _normal[] = {normal.x(), normal.y(), normal.z()};
        const float _tangent[] = {tangent.x(), tangent.y(), tangent.z()};
        const float _bitangent[] = {bitangent.x(), bitangent.y(), bitangent.z()};
        
        dd::tangentBasis(_origin, _normal, _tangent, _bitangent, lengths, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::xzSquareGrid(float mins, float maxs,
                      float y,    float step,
                      const btVector3 &color,
                      int durationMillis,
                      bool depthEnabled)
    {
        const float _color[] = {color.x(), color.y(), color.z()};
        
        dd::xzSquareGrid(mins, maxs, y, step, _color, durationMillis, depthEnabled);
    }
    
    void WorldDebugDrawer::setupShaderPrograms()
    {
        std::cout << "> DDRenderInterfaceCoreGL::setupShaderPrograms()" << std::endl;
        
        const char *_linePointVertShaderSource = linePointVertShaderSource.c_str();
        const char *_linePointFragShaderSource = linePointFragShaderSource.c_str();
        
        GLuint linePointVS = glCreateShader(GL_VERTEX_SHADER);
        glShaderSource(linePointVS, 1, &_linePointVertShaderSource, nullptr);
        compileShader(linePointVS);
        
        GLint linePointFS = glCreateShader(GL_FRAGMENT_SHADER);
        glShaderSource(linePointFS, 1, &_linePointFragShaderSource, nullptr);
        compileShader(linePointFS);
        
        linePointProgram = glCreateProgram();
        glAttachShader(linePointProgram, linePointVS);
        glAttachShader(linePointProgram, linePointFS);
        
        glBindAttribLocation(linePointProgram, 0, "in_Position");
        glBindAttribLocation(linePointProgram, 1, "in_ColorPointSize");
        linkProgram(linePointProgram);
        
        linePointProgram_MvpMatrixLocation = glGetUniformLocation(linePointProgram, "u_MvpMatrix");
        if (linePointProgram_MvpMatrixLocation < 0)
        {
            std::cerr << "Unable to get u_MvpMatrix uniform location!" << std::endl;
        }
        
        
        ////
        //// Text rendering shader:
        ////
        //{
        //	GLuint textVS = glCreateShader(GL_VERTEX_SHADER);
        //	glShaderSource(textVS, 1, &textVertShaderSrc, nullptr);
        //	compileShader(textVS);
        
        //	GLint textFS = glCreateShader(GL_FRAGMENT_SHADER);
        //	glShaderSource(textFS, 1, &textFragShaderSrc, nullptr);
        //	compileShader(textFS);
        
        //	textProgram = glCreateProgram();
        //	glAttachShader(textProgram, textVS);
        //	glAttachShader(textProgram, textFS);
        
        //	glBindAttribLocation(textProgram, 0, "in_Position");
        //	glBindAttribLocation(textProgram, 1, "in_TexCoords");
        //	glBindAttribLocation(textProgram, 2, "in_Color");
        //	linkProgram(textProgram);
        
        //	textProgram_GlyphTextureLocation = glGetUniformLocation(textProgram, "u_glyphTexture");
        //	if (textProgram_GlyphTextureLocation < 0)
        //	{
        //		std::cerr << "Unable to get u_glyphTexture uniform location!" << std::endl;
        //	}
        
        //	textProgram_ScreenDimensions = glGetUniformLocation(textProgram, "u_screenDimensions");
        //	if (textProgram_ScreenDimensions < 0)
        //	{
        //		std::cerr << "Unable to get u_screenDimensions uniform location!" << std::endl;
        //	}
        
        //	checkGLError(__FILE__, __LINE__);
        //}
    }
    
    void WorldDebugDrawer::setupVertexBuffers()
    {
        std::cout << "> DDRenderInterfaceCoreGL::setupVertexBuffers()" << std::endl;
        
        //
        // Lines/points vertex buffer:
        //
        {
            glGenVertexArrays(1, &linePointVAO);
            
            glGenBuffers(1, &linePointVBO);
            
            glBindVertexArray(linePointVAO);
            
            glBindBuffer(GL_ARRAY_BUFFER, linePointVBO);
            
            // RenderInterface will never be called with a batch larger than
            // DEBUG_DRAW_VERTEX_BUFFER_SIZE vertexes, so we can allocate the same amount here.
            glBufferData(GL_ARRAY_BUFFER, DEBUG_DRAW_VERTEX_BUFFER_SIZE * sizeof(dd::DrawVertex), nullptr, GL_STREAM_DRAW);
            
            // Set the vertex format expected by 3D points and lines:
            std::size_t offset = 0;
            
            glEnableVertexAttribArray(0); // in_Position (vec3)
            glVertexAttribPointer(
                                  /* index     = */ 0,
                                  /* size      = */ 3,
                                  /* type      = */ GL_FLOAT,
                                  /* normalize = */ GL_FALSE,
                                  /* stride    = */ sizeof(dd::DrawVertex),
                                  /* offset    = */ reinterpret_cast<void *>(offset));
            offset += sizeof(float) * 3;
            
            glEnableVertexAttribArray(1); // in_ColorPointSize (vec4)
            glVertexAttribPointer(
                                  /* index     = */ 1,
                                  /* size      = */ 4,
                                  /* type      = */ GL_FLOAT,
                                  /* normalize = */ GL_FALSE,
                                  /* stride    = */ sizeof(dd::DrawVertex),
                                  /* offset    = */ reinterpret_cast<void *>(offset));
            
            glBindVertexArray(0);
            
            glBindBuffer(GL_ARRAY_BUFFER, 0);
        }
        
        //
        // Text rendering vertex buffer:
        //
        {
            glGenVertexArrays(1, &textVAO);
            
            glGenBuffers(1, &textVBO);
            
            glBindVertexArray(textVAO);
            
            glBindBuffer(GL_ARRAY_BUFFER, textVBO);
            
            // NOTE: A more optimized implementation might consider combining
            // both the lines/points and text buffers to save some memory!
            glBufferData(GL_ARRAY_BUFFER, DEBUG_DRAW_VERTEX_BUFFER_SIZE * sizeof(dd::DrawVertex), nullptr, GL_STREAM_DRAW);
            
            // Set the vertex format expected by the 2D text:
            std::size_t offset = 0;
            
            glEnableVertexAttribArray(0); // in_Position (vec2)
            glVertexAttribPointer(
                                  /* index     = */ 0,
                                  /* size      = */ 2,
                                  /* type      = */ GL_FLOAT,
                                  /* normalize = */ GL_FALSE,
                                  /* stride    = */ sizeof(dd::DrawVertex),
                                  /* offset    = */ reinterpret_cast<void *>(offset));
            offset += sizeof(float) * 2;
            
            glEnableVertexAttribArray(1); // in_TexCoords (vec2)
            glVertexAttribPointer(
                                  /* index     = */ 1,
                                  /* size      = */ 2,
                                  /* type      = */ GL_FLOAT,
                                  /* normalize = */ GL_FALSE,
                                  /* stride    = */ sizeof(dd::DrawVertex),
                                  /* offset    = */ reinterpret_cast<void *>(offset));
            offset += sizeof(float) * 2;
            
            glEnableVertexAttribArray(2); // in_Color (vec4)
            glVertexAttribPointer(
                                  /* index     = */ 2,
                                  /* size      = */ 4,
                                  /* type      = */ GL_FLOAT,
                                  /* normalize = */ GL_FALSE,
                                  /* stride    = */ sizeof(dd::DrawVertex),
                                  /* offset    = */ reinterpret_cast<void *>(offset));
            
            glBindVertexArray(0);
            
            glBindBuffer(GL_ARRAY_BUFFER, 0);
        }
    }
    
    void WorldDebugDrawer::compileShader(const GLuint shader)
    {
        glCompileShader(shader);
        
        GLint status;
        glGetShaderiv(shader, GL_COMPILE_STATUS, &status);
        
        if (status == GL_FALSE)
        {
            GLchar strInfoLog[1024] = { 0 };
            glGetShaderInfoLog(shader, sizeof(strInfoLog) - 1, nullptr, strInfoLog);
            std::cerr << "\n>>> Shader compiler errors: \n" << strInfoLog << std::endl;
        }
    }
    
    void WorldDebugDrawer::linkProgram(const GLuint program)
    {
        glLinkProgram(program);
        
        GLint status;
        glGetProgramiv(program, GL_LINK_STATUS, &status);
        
        if (status == GL_FALSE)
        {
            GLchar strInfoLog[1024] = { 0 };
            glGetProgramInfoLog(program, sizeof(strInfoLog) - 1, nullptr, strInfoLog);
            std::cerr << "\n>>> Program linker errors: \n" << strInfoLog << std::endl;
        }
    }

}
