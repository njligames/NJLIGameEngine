# This file was automatically generated by SWIG (http://www.swig.org).
# Version 3.0.11
#
# Do not make changes to this file unless you know what you are doing--modify
# the SWIG interface file instead.

from sys import version_info as _swig_python_version_info
if _swig_python_version_info >= (2, 7, 0):
    def swig_import_helper():
        import importlib
        pkg = __name__.rpartition('.')[0]
        mname = '.'.join((pkg, '_gl')).lstrip('.')
        try:
            return importlib.import_module(mname)
        except ImportError:
            return importlib.import_module('_gl')
    _gl = swig_import_helper()
    del swig_import_helper
elif _swig_python_version_info >= (2, 6, 0):
    def swig_import_helper():
        from os.path import dirname
        import imp
        fp = None
        try:
            fp, pathname, description = imp.find_module('_gl', [dirname(__file__)])
        except ImportError:
            import _gl
            return _gl
        try:
            _mod = imp.load_module('_gl', fp, pathname, description)
        finally:
            if fp is not None:
                fp.close()
        return _mod
    _gl = swig_import_helper()
    del swig_import_helper
else:
    import _gl
del _swig_python_version_info

try:
    _swig_property = property
except NameError:
    pass  # Python < 2.2 doesn't have 'property'.

try:
    import builtins as __builtin__
except ImportError:
    import __builtin__

def _swig_setattr_nondynamic(self, class_type, name, value, static=1):
    if (name == "thisown"):
        return self.this.own(value)
    if (name == "this"):
        if type(value).__name__ == 'SwigPyObject':
            self.__dict__[name] = value
            return
    method = class_type.__swig_setmethods__.get(name, None)
    if method:
        return method(self, value)
    if (not static):
        if _newclass:
            object.__setattr__(self, name, value)
        else:
            self.__dict__[name] = value
    else:
        raise AttributeError("You cannot add attributes to %s" % self)


def _swig_setattr(self, class_type, name, value):
    return _swig_setattr_nondynamic(self, class_type, name, value, 0)


def _swig_getattr(self, class_type, name):
    if (name == "thisown"):
        return self.this.own()
    method = class_type.__swig_getmethods__.get(name, None)
    if method:
        return method(self)
    raise AttributeError("'%s' object has no attribute '%s'" % (class_type.__name__, name))


def _swig_repr(self):
    try:
        strthis = "proxy of " + self.this.__repr__()
    except __builtin__.Exception:
        strthis = ""
    return "<%s.%s; %s >" % (self.__class__.__module__, self.__class__.__name__, strthis,)

try:
    _object = object
    _newclass = 1
except __builtin__.Exception:
    class _object:
        pass
    _newclass = 0


def newfv4(a, b, c, d):
    """newfv4(GLfloat a, GLfloat b, GLfloat c, GLfloat d) -> GLfloat *"""
    return _gl.newfv4(a, b, c, d)

def delfv(m):
    """delfv(void * m)"""
    return _gl.delfv(m)
GL_ES_VERSION_2_0 = _gl.GL_ES_VERSION_2_0
GL_DEPTH_BUFFER_BIT = _gl.GL_DEPTH_BUFFER_BIT
GL_STENCIL_BUFFER_BIT = _gl.GL_STENCIL_BUFFER_BIT
GL_COLOR_BUFFER_BIT = _gl.GL_COLOR_BUFFER_BIT
GL_FALSE = _gl.GL_FALSE
GL_TRUE = _gl.GL_TRUE
GL_POINTS = _gl.GL_POINTS
GL_LINES = _gl.GL_LINES
GL_LINE_LOOP = _gl.GL_LINE_LOOP
GL_LINE_STRIP = _gl.GL_LINE_STRIP
GL_TRIANGLES = _gl.GL_TRIANGLES
GL_TRIANGLE_STRIP = _gl.GL_TRIANGLE_STRIP
GL_TRIANGLE_FAN = _gl.GL_TRIANGLE_FAN
GL_ZERO = _gl.GL_ZERO
GL_ONE = _gl.GL_ONE
GL_SRC_COLOR = _gl.GL_SRC_COLOR
GL_ONE_MINUS_SRC_COLOR = _gl.GL_ONE_MINUS_SRC_COLOR
GL_SRC_ALPHA = _gl.GL_SRC_ALPHA
GL_ONE_MINUS_SRC_ALPHA = _gl.GL_ONE_MINUS_SRC_ALPHA
GL_DST_ALPHA = _gl.GL_DST_ALPHA
GL_ONE_MINUS_DST_ALPHA = _gl.GL_ONE_MINUS_DST_ALPHA
GL_DST_COLOR = _gl.GL_DST_COLOR
GL_ONE_MINUS_DST_COLOR = _gl.GL_ONE_MINUS_DST_COLOR
GL_SRC_ALPHA_SATURATE = _gl.GL_SRC_ALPHA_SATURATE
GL_FUNC_ADD = _gl.GL_FUNC_ADD
GL_BLEND_EQUATION = _gl.GL_BLEND_EQUATION
GL_BLEND_EQUATION_RGB = _gl.GL_BLEND_EQUATION_RGB
GL_BLEND_EQUATION_ALPHA = _gl.GL_BLEND_EQUATION_ALPHA
GL_FUNC_SUBTRACT = _gl.GL_FUNC_SUBTRACT
GL_FUNC_REVERSE_SUBTRACT = _gl.GL_FUNC_REVERSE_SUBTRACT
GL_BLEND_DST_RGB = _gl.GL_BLEND_DST_RGB
GL_BLEND_SRC_RGB = _gl.GL_BLEND_SRC_RGB
GL_BLEND_DST_ALPHA = _gl.GL_BLEND_DST_ALPHA
GL_BLEND_SRC_ALPHA = _gl.GL_BLEND_SRC_ALPHA
GL_CONSTANT_COLOR = _gl.GL_CONSTANT_COLOR
GL_ONE_MINUS_CONSTANT_COLOR = _gl.GL_ONE_MINUS_CONSTANT_COLOR
GL_CONSTANT_ALPHA = _gl.GL_CONSTANT_ALPHA
GL_ONE_MINUS_CONSTANT_ALPHA = _gl.GL_ONE_MINUS_CONSTANT_ALPHA
GL_BLEND_COLOR = _gl.GL_BLEND_COLOR
GL_ARRAY_BUFFER = _gl.GL_ARRAY_BUFFER
GL_ELEMENT_ARRAY_BUFFER = _gl.GL_ELEMENT_ARRAY_BUFFER
GL_ARRAY_BUFFER_BINDING = _gl.GL_ARRAY_BUFFER_BINDING
GL_ELEMENT_ARRAY_BUFFER_BINDING = _gl.GL_ELEMENT_ARRAY_BUFFER_BINDING
GL_STREAM_DRAW = _gl.GL_STREAM_DRAW
GL_STATIC_DRAW = _gl.GL_STATIC_DRAW
GL_DYNAMIC_DRAW = _gl.GL_DYNAMIC_DRAW
GL_BUFFER_SIZE = _gl.GL_BUFFER_SIZE
GL_BUFFER_USAGE = _gl.GL_BUFFER_USAGE
GL_CURRENT_VERTEX_ATTRIB = _gl.GL_CURRENT_VERTEX_ATTRIB
GL_FRONT = _gl.GL_FRONT
GL_BACK = _gl.GL_BACK
GL_FRONT_AND_BACK = _gl.GL_FRONT_AND_BACK
GL_TEXTURE_2D = _gl.GL_TEXTURE_2D
GL_CULL_FACE = _gl.GL_CULL_FACE
GL_BLEND = _gl.GL_BLEND
GL_DITHER = _gl.GL_DITHER
GL_STENCIL_TEST = _gl.GL_STENCIL_TEST
GL_DEPTH_TEST = _gl.GL_DEPTH_TEST
GL_SCISSOR_TEST = _gl.GL_SCISSOR_TEST
GL_POLYGON_OFFSET_FILL = _gl.GL_POLYGON_OFFSET_FILL
GL_SAMPLE_ALPHA_TO_COVERAGE = _gl.GL_SAMPLE_ALPHA_TO_COVERAGE
GL_SAMPLE_COVERAGE = _gl.GL_SAMPLE_COVERAGE
GL_NO_ERROR = _gl.GL_NO_ERROR
GL_INVALID_ENUM = _gl.GL_INVALID_ENUM
GL_INVALID_VALUE = _gl.GL_INVALID_VALUE
GL_INVALID_OPERATION = _gl.GL_INVALID_OPERATION
GL_OUT_OF_MEMORY = _gl.GL_OUT_OF_MEMORY
GL_CW = _gl.GL_CW
GL_CCW = _gl.GL_CCW
GL_LINE_WIDTH = _gl.GL_LINE_WIDTH
GL_ALIASED_POINT_SIZE_RANGE = _gl.GL_ALIASED_POINT_SIZE_RANGE
GL_ALIASED_LINE_WIDTH_RANGE = _gl.GL_ALIASED_LINE_WIDTH_RANGE
GL_CULL_FACE_MODE = _gl.GL_CULL_FACE_MODE
GL_FRONT_FACE = _gl.GL_FRONT_FACE
GL_DEPTH_RANGE = _gl.GL_DEPTH_RANGE
GL_DEPTH_WRITEMASK = _gl.GL_DEPTH_WRITEMASK
GL_DEPTH_CLEAR_VALUE = _gl.GL_DEPTH_CLEAR_VALUE
GL_DEPTH_FUNC = _gl.GL_DEPTH_FUNC
GL_STENCIL_CLEAR_VALUE = _gl.GL_STENCIL_CLEAR_VALUE
GL_STENCIL_FUNC = _gl.GL_STENCIL_FUNC
GL_STENCIL_FAIL = _gl.GL_STENCIL_FAIL
GL_STENCIL_PASS_DEPTH_FAIL = _gl.GL_STENCIL_PASS_DEPTH_FAIL
GL_STENCIL_PASS_DEPTH_PASS = _gl.GL_STENCIL_PASS_DEPTH_PASS
GL_STENCIL_REF = _gl.GL_STENCIL_REF
GL_STENCIL_VALUE_MASK = _gl.GL_STENCIL_VALUE_MASK
GL_STENCIL_WRITEMASK = _gl.GL_STENCIL_WRITEMASK
GL_STENCIL_BACK_FUNC = _gl.GL_STENCIL_BACK_FUNC
GL_STENCIL_BACK_FAIL = _gl.GL_STENCIL_BACK_FAIL
GL_STENCIL_BACK_PASS_DEPTH_FAIL = _gl.GL_STENCIL_BACK_PASS_DEPTH_FAIL
GL_STENCIL_BACK_PASS_DEPTH_PASS = _gl.GL_STENCIL_BACK_PASS_DEPTH_PASS
GL_STENCIL_BACK_REF = _gl.GL_STENCIL_BACK_REF
GL_STENCIL_BACK_VALUE_MASK = _gl.GL_STENCIL_BACK_VALUE_MASK
GL_STENCIL_BACK_WRITEMASK = _gl.GL_STENCIL_BACK_WRITEMASK
GL_VIEWPORT = _gl.GL_VIEWPORT
GL_SCISSOR_BOX = _gl.GL_SCISSOR_BOX
GL_COLOR_CLEAR_VALUE = _gl.GL_COLOR_CLEAR_VALUE
GL_COLOR_WRITEMASK = _gl.GL_COLOR_WRITEMASK
GL_UNPACK_ALIGNMENT = _gl.GL_UNPACK_ALIGNMENT
GL_PACK_ALIGNMENT = _gl.GL_PACK_ALIGNMENT
GL_MAX_TEXTURE_SIZE = _gl.GL_MAX_TEXTURE_SIZE
GL_MAX_VIEWPORT_DIMS = _gl.GL_MAX_VIEWPORT_DIMS
GL_SUBPIXEL_BITS = _gl.GL_SUBPIXEL_BITS
GL_RED_BITS = _gl.GL_RED_BITS
GL_GREEN_BITS = _gl.GL_GREEN_BITS
GL_BLUE_BITS = _gl.GL_BLUE_BITS
GL_ALPHA_BITS = _gl.GL_ALPHA_BITS
GL_DEPTH_BITS = _gl.GL_DEPTH_BITS
GL_STENCIL_BITS = _gl.GL_STENCIL_BITS
GL_POLYGON_OFFSET_UNITS = _gl.GL_POLYGON_OFFSET_UNITS
GL_POLYGON_OFFSET_FACTOR = _gl.GL_POLYGON_OFFSET_FACTOR
GL_TEXTURE_BINDING_2D = _gl.GL_TEXTURE_BINDING_2D
GL_SAMPLE_BUFFERS = _gl.GL_SAMPLE_BUFFERS
GL_SAMPLES = _gl.GL_SAMPLES
GL_SAMPLE_COVERAGE_VALUE = _gl.GL_SAMPLE_COVERAGE_VALUE
GL_SAMPLE_COVERAGE_INVERT = _gl.GL_SAMPLE_COVERAGE_INVERT
GL_NUM_COMPRESSED_TEXTURE_FORMATS = _gl.GL_NUM_COMPRESSED_TEXTURE_FORMATS
GL_COMPRESSED_TEXTURE_FORMATS = _gl.GL_COMPRESSED_TEXTURE_FORMATS
GL_DONT_CARE = _gl.GL_DONT_CARE
GL_FASTEST = _gl.GL_FASTEST
GL_NICEST = _gl.GL_NICEST
GL_GENERATE_MIPMAP_HINT = _gl.GL_GENERATE_MIPMAP_HINT
GL_BYTE = _gl.GL_BYTE
GL_UNSIGNED_BYTE = _gl.GL_UNSIGNED_BYTE
GL_SHORT = _gl.GL_SHORT
GL_UNSIGNED_SHORT = _gl.GL_UNSIGNED_SHORT
GL_INT = _gl.GL_INT
GL_UNSIGNED_INT = _gl.GL_UNSIGNED_INT
GL_FLOAT = _gl.GL_FLOAT
GL_FIXED = _gl.GL_FIXED
GL_DEPTH_COMPONENT = _gl.GL_DEPTH_COMPONENT
GL_ALPHA = _gl.GL_ALPHA
GL_RGB = _gl.GL_RGB
GL_RGBA = _gl.GL_RGBA
GL_LUMINANCE = _gl.GL_LUMINANCE
GL_LUMINANCE_ALPHA = _gl.GL_LUMINANCE_ALPHA
GL_UNSIGNED_SHORT_4_4_4_4 = _gl.GL_UNSIGNED_SHORT_4_4_4_4
GL_UNSIGNED_SHORT_5_5_5_1 = _gl.GL_UNSIGNED_SHORT_5_5_5_1
GL_UNSIGNED_SHORT_5_6_5 = _gl.GL_UNSIGNED_SHORT_5_6_5
GL_FRAGMENT_SHADER = _gl.GL_FRAGMENT_SHADER
GL_VERTEX_SHADER = _gl.GL_VERTEX_SHADER
GL_MAX_VERTEX_ATTRIBS = _gl.GL_MAX_VERTEX_ATTRIBS
GL_MAX_VERTEX_UNIFORM_VECTORS = _gl.GL_MAX_VERTEX_UNIFORM_VECTORS
GL_MAX_VARYING_VECTORS = _gl.GL_MAX_VARYING_VECTORS
GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = _gl.GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS
GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = _gl.GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS
GL_MAX_TEXTURE_IMAGE_UNITS = _gl.GL_MAX_TEXTURE_IMAGE_UNITS
GL_MAX_FRAGMENT_UNIFORM_VECTORS = _gl.GL_MAX_FRAGMENT_UNIFORM_VECTORS
GL_SHADER_TYPE = _gl.GL_SHADER_TYPE
GL_DELETE_STATUS = _gl.GL_DELETE_STATUS
GL_LINK_STATUS = _gl.GL_LINK_STATUS
GL_VALIDATE_STATUS = _gl.GL_VALIDATE_STATUS
GL_ATTACHED_SHADERS = _gl.GL_ATTACHED_SHADERS
GL_ACTIVE_UNIFORMS = _gl.GL_ACTIVE_UNIFORMS
GL_ACTIVE_UNIFORM_MAX_LENGTH = _gl.GL_ACTIVE_UNIFORM_MAX_LENGTH
GL_ACTIVE_ATTRIBUTES = _gl.GL_ACTIVE_ATTRIBUTES
GL_ACTIVE_ATTRIBUTE_MAX_LENGTH = _gl.GL_ACTIVE_ATTRIBUTE_MAX_LENGTH
GL_SHADING_LANGUAGE_VERSION = _gl.GL_SHADING_LANGUAGE_VERSION
GL_CURRENT_PROGRAM = _gl.GL_CURRENT_PROGRAM
GL_NEVER = _gl.GL_NEVER
GL_LESS = _gl.GL_LESS
GL_EQUAL = _gl.GL_EQUAL
GL_LEQUAL = _gl.GL_LEQUAL
GL_GREATER = _gl.GL_GREATER
GL_NOTEQUAL = _gl.GL_NOTEQUAL
GL_GEQUAL = _gl.GL_GEQUAL
GL_ALWAYS = _gl.GL_ALWAYS
GL_KEEP = _gl.GL_KEEP
GL_REPLACE = _gl.GL_REPLACE
GL_INCR = _gl.GL_INCR
GL_DECR = _gl.GL_DECR
GL_INVERT = _gl.GL_INVERT
GL_INCR_WRAP = _gl.GL_INCR_WRAP
GL_DECR_WRAP = _gl.GL_DECR_WRAP
GL_VENDOR = _gl.GL_VENDOR
GL_RENDERER = _gl.GL_RENDERER
GL_VERSION = _gl.GL_VERSION
GL_EXTENSIONS = _gl.GL_EXTENSIONS
GL_NEAREST = _gl.GL_NEAREST
GL_LINEAR = _gl.GL_LINEAR
GL_NEAREST_MIPMAP_NEAREST = _gl.GL_NEAREST_MIPMAP_NEAREST
GL_LINEAR_MIPMAP_NEAREST = _gl.GL_LINEAR_MIPMAP_NEAREST
GL_NEAREST_MIPMAP_LINEAR = _gl.GL_NEAREST_MIPMAP_LINEAR
GL_LINEAR_MIPMAP_LINEAR = _gl.GL_LINEAR_MIPMAP_LINEAR
GL_TEXTURE_MAG_FILTER = _gl.GL_TEXTURE_MAG_FILTER
GL_TEXTURE_MIN_FILTER = _gl.GL_TEXTURE_MIN_FILTER
GL_TEXTURE_WRAP_S = _gl.GL_TEXTURE_WRAP_S
GL_TEXTURE_WRAP_T = _gl.GL_TEXTURE_WRAP_T
GL_TEXTURE = _gl.GL_TEXTURE
GL_TEXTURE_CUBE_MAP = _gl.GL_TEXTURE_CUBE_MAP
GL_TEXTURE_BINDING_CUBE_MAP = _gl.GL_TEXTURE_BINDING_CUBE_MAP
GL_TEXTURE_CUBE_MAP_POSITIVE_X = _gl.GL_TEXTURE_CUBE_MAP_POSITIVE_X
GL_TEXTURE_CUBE_MAP_NEGATIVE_X = _gl.GL_TEXTURE_CUBE_MAP_NEGATIVE_X
GL_TEXTURE_CUBE_MAP_POSITIVE_Y = _gl.GL_TEXTURE_CUBE_MAP_POSITIVE_Y
GL_TEXTURE_CUBE_MAP_NEGATIVE_Y = _gl.GL_TEXTURE_CUBE_MAP_NEGATIVE_Y
GL_TEXTURE_CUBE_MAP_POSITIVE_Z = _gl.GL_TEXTURE_CUBE_MAP_POSITIVE_Z
GL_TEXTURE_CUBE_MAP_NEGATIVE_Z = _gl.GL_TEXTURE_CUBE_MAP_NEGATIVE_Z
GL_MAX_CUBE_MAP_TEXTURE_SIZE = _gl.GL_MAX_CUBE_MAP_TEXTURE_SIZE
GL_TEXTURE0 = _gl.GL_TEXTURE0
GL_TEXTURE1 = _gl.GL_TEXTURE1
GL_TEXTURE2 = _gl.GL_TEXTURE2
GL_TEXTURE3 = _gl.GL_TEXTURE3
GL_TEXTURE4 = _gl.GL_TEXTURE4
GL_TEXTURE5 = _gl.GL_TEXTURE5
GL_TEXTURE6 = _gl.GL_TEXTURE6
GL_TEXTURE7 = _gl.GL_TEXTURE7
GL_TEXTURE8 = _gl.GL_TEXTURE8
GL_TEXTURE9 = _gl.GL_TEXTURE9
GL_TEXTURE10 = _gl.GL_TEXTURE10
GL_TEXTURE11 = _gl.GL_TEXTURE11
GL_TEXTURE12 = _gl.GL_TEXTURE12
GL_TEXTURE13 = _gl.GL_TEXTURE13
GL_TEXTURE14 = _gl.GL_TEXTURE14
GL_TEXTURE15 = _gl.GL_TEXTURE15
GL_TEXTURE16 = _gl.GL_TEXTURE16
GL_TEXTURE17 = _gl.GL_TEXTURE17
GL_TEXTURE18 = _gl.GL_TEXTURE18
GL_TEXTURE19 = _gl.GL_TEXTURE19
GL_TEXTURE20 = _gl.GL_TEXTURE20
GL_TEXTURE21 = _gl.GL_TEXTURE21
GL_TEXTURE22 = _gl.GL_TEXTURE22
GL_TEXTURE23 = _gl.GL_TEXTURE23
GL_TEXTURE24 = _gl.GL_TEXTURE24
GL_TEXTURE25 = _gl.GL_TEXTURE25
GL_TEXTURE26 = _gl.GL_TEXTURE26
GL_TEXTURE27 = _gl.GL_TEXTURE27
GL_TEXTURE28 = _gl.GL_TEXTURE28
GL_TEXTURE29 = _gl.GL_TEXTURE29
GL_TEXTURE30 = _gl.GL_TEXTURE30
GL_TEXTURE31 = _gl.GL_TEXTURE31
GL_ACTIVE_TEXTURE = _gl.GL_ACTIVE_TEXTURE
GL_REPEAT = _gl.GL_REPEAT
GL_CLAMP_TO_EDGE = _gl.GL_CLAMP_TO_EDGE
GL_MIRRORED_REPEAT = _gl.GL_MIRRORED_REPEAT
GL_FLOAT_VEC2 = _gl.GL_FLOAT_VEC2
GL_FLOAT_VEC3 = _gl.GL_FLOAT_VEC3
GL_FLOAT_VEC4 = _gl.GL_FLOAT_VEC4
GL_INT_VEC2 = _gl.GL_INT_VEC2
GL_INT_VEC3 = _gl.GL_INT_VEC3
GL_INT_VEC4 = _gl.GL_INT_VEC4
GL_BOOL = _gl.GL_BOOL
GL_BOOL_VEC2 = _gl.GL_BOOL_VEC2
GL_BOOL_VEC3 = _gl.GL_BOOL_VEC3
GL_BOOL_VEC4 = _gl.GL_BOOL_VEC4
GL_FLOAT_MAT2 = _gl.GL_FLOAT_MAT2
GL_FLOAT_MAT3 = _gl.GL_FLOAT_MAT3
GL_FLOAT_MAT4 = _gl.GL_FLOAT_MAT4
GL_SAMPLER_2D = _gl.GL_SAMPLER_2D
GL_SAMPLER_CUBE = _gl.GL_SAMPLER_CUBE
GL_VERTEX_ATTRIB_ARRAY_ENABLED = _gl.GL_VERTEX_ATTRIB_ARRAY_ENABLED
GL_VERTEX_ATTRIB_ARRAY_SIZE = _gl.GL_VERTEX_ATTRIB_ARRAY_SIZE
GL_VERTEX_ATTRIB_ARRAY_STRIDE = _gl.GL_VERTEX_ATTRIB_ARRAY_STRIDE
GL_VERTEX_ATTRIB_ARRAY_TYPE = _gl.GL_VERTEX_ATTRIB_ARRAY_TYPE
GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = _gl.GL_VERTEX_ATTRIB_ARRAY_NORMALIZED
GL_VERTEX_ATTRIB_ARRAY_POINTER = _gl.GL_VERTEX_ATTRIB_ARRAY_POINTER
GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = _gl.GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING
GL_IMPLEMENTATION_COLOR_READ_TYPE = _gl.GL_IMPLEMENTATION_COLOR_READ_TYPE
GL_IMPLEMENTATION_COLOR_READ_FORMAT = _gl.GL_IMPLEMENTATION_COLOR_READ_FORMAT
GL_COMPILE_STATUS = _gl.GL_COMPILE_STATUS
GL_INFO_LOG_LENGTH = _gl.GL_INFO_LOG_LENGTH
GL_SHADER_SOURCE_LENGTH = _gl.GL_SHADER_SOURCE_LENGTH
GL_SHADER_COMPILER = _gl.GL_SHADER_COMPILER
GL_SHADER_BINARY_FORMATS = _gl.GL_SHADER_BINARY_FORMATS
GL_NUM_SHADER_BINARY_FORMATS = _gl.GL_NUM_SHADER_BINARY_FORMATS
GL_LOW_FLOAT = _gl.GL_LOW_FLOAT
GL_MEDIUM_FLOAT = _gl.GL_MEDIUM_FLOAT
GL_HIGH_FLOAT = _gl.GL_HIGH_FLOAT
GL_LOW_INT = _gl.GL_LOW_INT
GL_MEDIUM_INT = _gl.GL_MEDIUM_INT
GL_HIGH_INT = _gl.GL_HIGH_INT
GL_FRAMEBUFFER = _gl.GL_FRAMEBUFFER
GL_RENDERBUFFER = _gl.GL_RENDERBUFFER
GL_RGBA4 = _gl.GL_RGBA4
GL_RGB5_A1 = _gl.GL_RGB5_A1
GL_RGB565 = _gl.GL_RGB565
GL_DEPTH_COMPONENT16 = _gl.GL_DEPTH_COMPONENT16
GL_STENCIL_INDEX8 = _gl.GL_STENCIL_INDEX8
GL_RENDERBUFFER_WIDTH = _gl.GL_RENDERBUFFER_WIDTH
GL_RENDERBUFFER_HEIGHT = _gl.GL_RENDERBUFFER_HEIGHT
GL_RENDERBUFFER_INTERNAL_FORMAT = _gl.GL_RENDERBUFFER_INTERNAL_FORMAT
GL_RENDERBUFFER_RED_SIZE = _gl.GL_RENDERBUFFER_RED_SIZE
GL_RENDERBUFFER_GREEN_SIZE = _gl.GL_RENDERBUFFER_GREEN_SIZE
GL_RENDERBUFFER_BLUE_SIZE = _gl.GL_RENDERBUFFER_BLUE_SIZE
GL_RENDERBUFFER_ALPHA_SIZE = _gl.GL_RENDERBUFFER_ALPHA_SIZE
GL_RENDERBUFFER_DEPTH_SIZE = _gl.GL_RENDERBUFFER_DEPTH_SIZE
GL_RENDERBUFFER_STENCIL_SIZE = _gl.GL_RENDERBUFFER_STENCIL_SIZE
GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = _gl.GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE
GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = _gl.GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME
GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = _gl.GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL
GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = _gl.GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE
GL_COLOR_ATTACHMENT0 = _gl.GL_COLOR_ATTACHMENT0
GL_DEPTH_ATTACHMENT = _gl.GL_DEPTH_ATTACHMENT
GL_STENCIL_ATTACHMENT = _gl.GL_STENCIL_ATTACHMENT
GL_NONE = _gl.GL_NONE
GL_FRAMEBUFFER_COMPLETE = _gl.GL_FRAMEBUFFER_COMPLETE
GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = _gl.GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT
GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = _gl.GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT
GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS = _gl.GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS
GL_FRAMEBUFFER_UNSUPPORTED = _gl.GL_FRAMEBUFFER_UNSUPPORTED
GL_FRAMEBUFFER_BINDING = _gl.GL_FRAMEBUFFER_BINDING
GL_RENDERBUFFER_BINDING = _gl.GL_RENDERBUFFER_BINDING
GL_MAX_RENDERBUFFER_SIZE = _gl.GL_MAX_RENDERBUFFER_SIZE
GL_INVALID_FRAMEBUFFER_OPERATION = _gl.GL_INVALID_FRAMEBUFFER_OPERATION

def glActiveTexture(texture):
    """glActiveTexture(GLenum texture)"""
    return _gl.glActiveTexture(texture)

def glAttachShader(program, shader):
    """glAttachShader(GLuint program, GLuint shader)"""
    return _gl.glAttachShader(program, shader)

def glBindAttribLocation(program, index, name):
    """glBindAttribLocation(GLuint program, GLuint index, GLchar const * name)"""
    return _gl.glBindAttribLocation(program, index, name)

def glBindBuffer(target, buffer):
    """glBindBuffer(GLenum target, GLuint buffer)"""
    return _gl.glBindBuffer(target, buffer)

def glBindFramebuffer(target, framebuffer):
    """glBindFramebuffer(GLenum target, GLuint framebuffer)"""
    return _gl.glBindFramebuffer(target, framebuffer)

def glBindRenderbuffer(target, renderbuffer):
    """glBindRenderbuffer(GLenum target, GLuint renderbuffer)"""
    return _gl.glBindRenderbuffer(target, renderbuffer)

def glBindTexture(target, texture):
    """glBindTexture(GLenum target, GLuint texture)"""
    return _gl.glBindTexture(target, texture)

def glBlendColor(red, green, blue, alpha):
    """glBlendColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)"""
    return _gl.glBlendColor(red, green, blue, alpha)

def glBlendEquation(mode):
    """glBlendEquation(GLenum mode)"""
    return _gl.glBlendEquation(mode)

def glBlendEquationSeparate(modeRGB, modeAlpha):
    """glBlendEquationSeparate(GLenum modeRGB, GLenum modeAlpha)"""
    return _gl.glBlendEquationSeparate(modeRGB, modeAlpha)

def glBlendFunc(sfactor, dfactor):
    """glBlendFunc(GLenum sfactor, GLenum dfactor)"""
    return _gl.glBlendFunc(sfactor, dfactor)

def glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha):
    """glBlendFuncSeparate(GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha)"""
    return _gl.glBlendFuncSeparate(srcRGB, dstRGB, srcAlpha, dstAlpha)

def glBufferData(target, size, data, usage):
    """glBufferData(GLenum target, GLsizeiptr size, GLvoid const * data, GLenum usage)"""
    return _gl.glBufferData(target, size, data, usage)

def glBufferSubData(target, offset, size, data):
    """glBufferSubData(GLenum target, GLintptr offset, GLsizeiptr size, GLvoid const * data)"""
    return _gl.glBufferSubData(target, offset, size, data)

def glCheckFramebufferStatus(target):
    """glCheckFramebufferStatus(GLenum target) -> GLenum"""
    return _gl.glCheckFramebufferStatus(target)

def glClear(mask):
    """glClear(GLbitfield mask)"""
    return _gl.glClear(mask)

def glClearColor(red, green, blue, alpha):
    """glClearColor(GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha)"""
    return _gl.glClearColor(red, green, blue, alpha)

def glClearDepthf(depth):
    """glClearDepthf(GLclampf depth)"""
    return _gl.glClearDepthf(depth)

def glClearStencil(s):
    """glClearStencil(GLint s)"""
    return _gl.glClearStencil(s)

def glColorMask(red, green, blue, alpha):
    """glColorMask(GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha)"""
    return _gl.glColorMask(red, green, blue, alpha)

def glCompileShader(shader):
    """glCompileShader(GLuint shader)"""
    return _gl.glCompileShader(shader)

def glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data):
    """glCompressedTexImage2D(GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, GLvoid const * data)"""
    return _gl.glCompressedTexImage2D(target, level, internalformat, width, height, border, imageSize, data)

def glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data):
    """glCompressedTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, GLvoid const * data)"""
    return _gl.glCompressedTexSubImage2D(target, level, xoffset, yoffset, width, height, format, imageSize, data)

def glCopyTexImage2D(target, level, internalformat, x, y, width, height, border):
    """glCopyTexImage2D(GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border)"""
    return _gl.glCopyTexImage2D(target, level, internalformat, x, y, width, height, border)

def glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height):
    """glCopyTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height)"""
    return _gl.glCopyTexSubImage2D(target, level, xoffset, yoffset, x, y, width, height)

def glCreateProgram():
    """glCreateProgram() -> GLuint"""
    return _gl.glCreateProgram()

def glCreateShader(type):
    """glCreateShader(GLenum type) -> GLuint"""
    return _gl.glCreateShader(type)

def glCullFace(mode):
    """glCullFace(GLenum mode)"""
    return _gl.glCullFace(mode)

def glDeleteBuffers(n, buffers):
    """glDeleteBuffers(GLsizei n, GLuint const * buffers)"""
    return _gl.glDeleteBuffers(n, buffers)

def glDeleteFramebuffers(n, framebuffers):
    """glDeleteFramebuffers(GLsizei n, GLuint const * framebuffers)"""
    return _gl.glDeleteFramebuffers(n, framebuffers)

def glDeleteProgram(program):
    """glDeleteProgram(GLuint program)"""
    return _gl.glDeleteProgram(program)

def glDeleteRenderbuffers(n, renderbuffers):
    """glDeleteRenderbuffers(GLsizei n, GLuint const * renderbuffers)"""
    return _gl.glDeleteRenderbuffers(n, renderbuffers)

def glDeleteShader(shader):
    """glDeleteShader(GLuint shader)"""
    return _gl.glDeleteShader(shader)

def glDeleteTextures(n, textures):
    """glDeleteTextures(GLsizei n, GLuint const * textures)"""
    return _gl.glDeleteTextures(n, textures)

def glDepthFunc(func):
    """glDepthFunc(GLenum func)"""
    return _gl.glDepthFunc(func)

def glDepthMask(flag):
    """glDepthMask(GLboolean flag)"""
    return _gl.glDepthMask(flag)

def glDepthRangef(zNear, zFar):
    """glDepthRangef(GLclampf zNear, GLclampf zFar)"""
    return _gl.glDepthRangef(zNear, zFar)

def glDetachShader(program, shader):
    """glDetachShader(GLuint program, GLuint shader)"""
    return _gl.glDetachShader(program, shader)

def glDisable(cap):
    """glDisable(GLenum cap)"""
    return _gl.glDisable(cap)

def glDisableVertexAttribArray(index):
    """glDisableVertexAttribArray(GLuint index)"""
    return _gl.glDisableVertexAttribArray(index)

def glDrawArrays(mode, first, count):
    """glDrawArrays(GLenum mode, GLint first, GLsizei count)"""
    return _gl.glDrawArrays(mode, first, count)

def glDrawElements(mode, count, type, indices):
    """glDrawElements(GLenum mode, GLsizei count, GLenum type, GLvoid const * indices)"""
    return _gl.glDrawElements(mode, count, type, indices)

def glEnable(cap):
    """glEnable(GLenum cap)"""
    return _gl.glEnable(cap)

def glEnableVertexAttribArray(index):
    """glEnableVertexAttribArray(GLuint index)"""
    return _gl.glEnableVertexAttribArray(index)

def glFinish():
    """glFinish()"""
    return _gl.glFinish()

def glFlush():
    """glFlush()"""
    return _gl.glFlush()

def glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer):
    """glFramebufferRenderbuffer(GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer)"""
    return _gl.glFramebufferRenderbuffer(target, attachment, renderbuffertarget, renderbuffer)

def glFramebufferTexture2D(target, attachment, textarget, texture, level):
    """glFramebufferTexture2D(GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level)"""
    return _gl.glFramebufferTexture2D(target, attachment, textarget, texture, level)

def glFrontFace(mode):
    """glFrontFace(GLenum mode)"""
    return _gl.glFrontFace(mode)

def glGenBuffers(n, buffers):
    """glGenBuffers(GLsizei n, GLuint * buffers)"""
    return _gl.glGenBuffers(n, buffers)

def glGenerateMipmap(target):
    """glGenerateMipmap(GLenum target)"""
    return _gl.glGenerateMipmap(target)

def glGenFramebuffers(n, framebuffers):
    """glGenFramebuffers(GLsizei n, GLuint * framebuffers)"""
    return _gl.glGenFramebuffers(n, framebuffers)

def glGenRenderbuffers(n, renderbuffers):
    """glGenRenderbuffers(GLsizei n, GLuint * renderbuffers)"""
    return _gl.glGenRenderbuffers(n, renderbuffers)

def glGenTextures(n, textures):
    """glGenTextures(GLsizei n, GLuint * textures)"""
    return _gl.glGenTextures(n, textures)

def glGetActiveAttrib(program, index, bufsize, length, size, type, name):
    """glGetActiveAttrib(GLuint program, GLuint index, GLsizei bufsize, GLsizei * length, GLint * size, GLenum * type, GLchar * name)"""
    return _gl.glGetActiveAttrib(program, index, bufsize, length, size, type, name)

def glGetActiveUniform(program, index, bufsize, length, size, type, name):
    """glGetActiveUniform(GLuint program, GLuint index, GLsizei bufsize, GLsizei * length, GLint * size, GLenum * type, GLchar * name)"""
    return _gl.glGetActiveUniform(program, index, bufsize, length, size, type, name)

def glGetAttachedShaders(program, maxcount, count, shaders):
    """glGetAttachedShaders(GLuint program, GLsizei maxcount, GLsizei * count, GLuint * shaders)"""
    return _gl.glGetAttachedShaders(program, maxcount, count, shaders)

def glGetAttribLocation(program, name):
    """glGetAttribLocation(GLuint program, GLchar const * name) -> int"""
    return _gl.glGetAttribLocation(program, name)

def glGetBooleanv(pname, params):
    """glGetBooleanv(GLenum pname, GLboolean * params)"""
    return _gl.glGetBooleanv(pname, params)

def glGetBufferParameteriv(target, pname, params):
    """glGetBufferParameteriv(GLenum target, GLenum pname, GLint * params)"""
    return _gl.glGetBufferParameteriv(target, pname, params)

def glGetError():
    """glGetError() -> GLenum"""
    return _gl.glGetError()

def glGetFloatv(pname, params):
    """glGetFloatv(GLenum pname, GLfloat * params)"""
    return _gl.glGetFloatv(pname, params)

def glGetFramebufferAttachmentParameteriv(target, attachment, pname, params):
    """glGetFramebufferAttachmentParameteriv(GLenum target, GLenum attachment, GLenum pname, GLint * params)"""
    return _gl.glGetFramebufferAttachmentParameteriv(target, attachment, pname, params)

def glGetIntegerv(pname, params):
    """glGetIntegerv(GLenum pname, GLint * params)"""
    return _gl.glGetIntegerv(pname, params)

def glGetProgramiv(program, pname, params):
    """glGetProgramiv(GLuint program, GLenum pname, GLint * params)"""
    return _gl.glGetProgramiv(program, pname, params)

def glGetProgramInfoLog(program, bufsize, length, infolog):
    """glGetProgramInfoLog(GLuint program, GLsizei bufsize, GLsizei * length, GLchar * infolog)"""
    return _gl.glGetProgramInfoLog(program, bufsize, length, infolog)

def glGetRenderbufferParameteriv(target, pname, params):
    """glGetRenderbufferParameteriv(GLenum target, GLenum pname, GLint * params)"""
    return _gl.glGetRenderbufferParameteriv(target, pname, params)

def glGetShaderiv(shader, pname, params):
    """glGetShaderiv(GLuint shader, GLenum pname, GLint * params)"""
    return _gl.glGetShaderiv(shader, pname, params)

def glGetShaderInfoLog(shader, bufsize, length, infolog):
    """glGetShaderInfoLog(GLuint shader, GLsizei bufsize, GLsizei * length, GLchar * infolog)"""
    return _gl.glGetShaderInfoLog(shader, bufsize, length, infolog)

def glGetShaderPrecisionFormat(shadertype, precisiontype, range, precision):
    """glGetShaderPrecisionFormat(GLenum shadertype, GLenum precisiontype, GLint * range, GLint * precision)"""
    return _gl.glGetShaderPrecisionFormat(shadertype, precisiontype, range, precision)

def glGetShaderSource(shader, bufsize, length, source):
    """glGetShaderSource(GLuint shader, GLsizei bufsize, GLsizei * length, GLchar * source)"""
    return _gl.glGetShaderSource(shader, bufsize, length, source)

def glGetString(name):
    """glGetString(GLenum name) -> GLubyte const *"""
    return _gl.glGetString(name)

def glGetTexParameterfv(target, pname, params):
    """glGetTexParameterfv(GLenum target, GLenum pname, GLfloat * params)"""
    return _gl.glGetTexParameterfv(target, pname, params)

def glGetTexParameteriv(target, pname, params):
    """glGetTexParameteriv(GLenum target, GLenum pname, GLint * params)"""
    return _gl.glGetTexParameteriv(target, pname, params)

def glGetUniformfv(program, location, params):
    """glGetUniformfv(GLuint program, GLint location, GLfloat * params)"""
    return _gl.glGetUniformfv(program, location, params)

def glGetUniformiv(program, location, params):
    """glGetUniformiv(GLuint program, GLint location, GLint * params)"""
    return _gl.glGetUniformiv(program, location, params)

def glGetUniformLocation(program, name):
    """glGetUniformLocation(GLuint program, GLchar const * name) -> int"""
    return _gl.glGetUniformLocation(program, name)

def glGetVertexAttribfv(index, pname, params):
    """glGetVertexAttribfv(GLuint index, GLenum pname, GLfloat * params)"""
    return _gl.glGetVertexAttribfv(index, pname, params)

def glGetVertexAttribiv(index, pname, params):
    """glGetVertexAttribiv(GLuint index, GLenum pname, GLint * params)"""
    return _gl.glGetVertexAttribiv(index, pname, params)

def glGetVertexAttribPointerv(index, pname, pointer):
    """glGetVertexAttribPointerv(GLuint index, GLenum pname, GLvoid ** pointer)"""
    return _gl.glGetVertexAttribPointerv(index, pname, pointer)

def glHint(target, mode):
    """glHint(GLenum target, GLenum mode)"""
    return _gl.glHint(target, mode)

def glIsBuffer(buffer):
    """glIsBuffer(GLuint buffer) -> GLboolean"""
    return _gl.glIsBuffer(buffer)

def glIsEnabled(cap):
    """glIsEnabled(GLenum cap) -> GLboolean"""
    return _gl.glIsEnabled(cap)

def glIsFramebuffer(framebuffer):
    """glIsFramebuffer(GLuint framebuffer) -> GLboolean"""
    return _gl.glIsFramebuffer(framebuffer)

def glIsProgram(program):
    """glIsProgram(GLuint program) -> GLboolean"""
    return _gl.glIsProgram(program)

def glIsRenderbuffer(renderbuffer):
    """glIsRenderbuffer(GLuint renderbuffer) -> GLboolean"""
    return _gl.glIsRenderbuffer(renderbuffer)

def glIsShader(shader):
    """glIsShader(GLuint shader) -> GLboolean"""
    return _gl.glIsShader(shader)

def glIsTexture(texture):
    """glIsTexture(GLuint texture) -> GLboolean"""
    return _gl.glIsTexture(texture)

def glLineWidth(width):
    """glLineWidth(GLfloat width)"""
    return _gl.glLineWidth(width)

def glLinkProgram(program):
    """glLinkProgram(GLuint program)"""
    return _gl.glLinkProgram(program)

def glPixelStorei(pname, param):
    """glPixelStorei(GLenum pname, GLint param)"""
    return _gl.glPixelStorei(pname, param)

def glPolygonOffset(factor, units):
    """glPolygonOffset(GLfloat factor, GLfloat units)"""
    return _gl.glPolygonOffset(factor, units)

def glReadPixels(x, y, width, height, format, type, pixels):
    """glReadPixels(GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid * pixels)"""
    return _gl.glReadPixels(x, y, width, height, format, type, pixels)

def glReleaseShaderCompiler():
    """glReleaseShaderCompiler()"""
    return _gl.glReleaseShaderCompiler()

def glRenderbufferStorage(target, internalformat, width, height):
    """glRenderbufferStorage(GLenum target, GLenum internalformat, GLsizei width, GLsizei height)"""
    return _gl.glRenderbufferStorage(target, internalformat, width, height)

def glSampleCoverage(value, invert):
    """glSampleCoverage(GLclampf value, GLboolean invert)"""
    return _gl.glSampleCoverage(value, invert)

def glScissor(x, y, width, height):
    """glScissor(GLint x, GLint y, GLsizei width, GLsizei height)"""
    return _gl.glScissor(x, y, width, height)

def glShaderBinary(n, shaders, binaryformat, binary, length):
    """glShaderBinary(GLsizei n, GLuint const * shaders, GLenum binaryformat, GLvoid const * binary, GLsizei length)"""
    return _gl.glShaderBinary(n, shaders, binaryformat, binary, length)

def glShaderSource(shader, count, string, length):
    """glShaderSource(GLuint shader, GLsizei count, GLchar const *const * string, GLint const * length)"""
    return _gl.glShaderSource(shader, count, string, length)

def glStencilFunc(func, ref, mask):
    """glStencilFunc(GLenum func, GLint ref, GLuint mask)"""
    return _gl.glStencilFunc(func, ref, mask)

def glStencilFuncSeparate(face, func, ref, mask):
    """glStencilFuncSeparate(GLenum face, GLenum func, GLint ref, GLuint mask)"""
    return _gl.glStencilFuncSeparate(face, func, ref, mask)

def glStencilMask(mask):
    """glStencilMask(GLuint mask)"""
    return _gl.glStencilMask(mask)

def glStencilMaskSeparate(face, mask):
    """glStencilMaskSeparate(GLenum face, GLuint mask)"""
    return _gl.glStencilMaskSeparate(face, mask)

def glStencilOp(fail, zfail, zpass):
    """glStencilOp(GLenum fail, GLenum zfail, GLenum zpass)"""
    return _gl.glStencilOp(fail, zfail, zpass)

def glStencilOpSeparate(face, fail, zfail, zpass):
    """glStencilOpSeparate(GLenum face, GLenum fail, GLenum zfail, GLenum zpass)"""
    return _gl.glStencilOpSeparate(face, fail, zfail, zpass)

def glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels):
    """glTexImage2D(GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, GLvoid const * pixels)"""
    return _gl.glTexImage2D(target, level, internalformat, width, height, border, format, type, pixels)

def glTexParameterf(target, pname, param):
    """glTexParameterf(GLenum target, GLenum pname, GLfloat param)"""
    return _gl.glTexParameterf(target, pname, param)

def glTexParameterfv(target, pname, params):
    """glTexParameterfv(GLenum target, GLenum pname, GLfloat const * params)"""
    return _gl.glTexParameterfv(target, pname, params)

def glTexParameteri(target, pname, param):
    """glTexParameteri(GLenum target, GLenum pname, GLint param)"""
    return _gl.glTexParameteri(target, pname, param)

def glTexParameteriv(target, pname, params):
    """glTexParameteriv(GLenum target, GLenum pname, GLint const * params)"""
    return _gl.glTexParameteriv(target, pname, params)

def glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels):
    """glTexSubImage2D(GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, GLvoid const * pixels)"""
    return _gl.glTexSubImage2D(target, level, xoffset, yoffset, width, height, format, type, pixels)

def glUniform1f(location, x):
    """glUniform1f(GLint location, GLfloat x)"""
    return _gl.glUniform1f(location, x)

def glUniform1fv(location, count, v):
    """glUniform1fv(GLint location, GLsizei count, GLfloat const * v)"""
    return _gl.glUniform1fv(location, count, v)

def glUniform1i(location, x):
    """glUniform1i(GLint location, GLint x)"""
    return _gl.glUniform1i(location, x)

def glUniform1iv(location, count, v):
    """glUniform1iv(GLint location, GLsizei count, GLint const * v)"""
    return _gl.glUniform1iv(location, count, v)

def glUniform2f(location, x, y):
    """glUniform2f(GLint location, GLfloat x, GLfloat y)"""
    return _gl.glUniform2f(location, x, y)

def glUniform2fv(location, count, v):
    """glUniform2fv(GLint location, GLsizei count, GLfloat const * v)"""
    return _gl.glUniform2fv(location, count, v)

def glUniform2i(location, x, y):
    """glUniform2i(GLint location, GLint x, GLint y)"""
    return _gl.glUniform2i(location, x, y)

def glUniform2iv(location, count, v):
    """glUniform2iv(GLint location, GLsizei count, GLint const * v)"""
    return _gl.glUniform2iv(location, count, v)

def glUniform3f(location, x, y, z):
    """glUniform3f(GLint location, GLfloat x, GLfloat y, GLfloat z)"""
    return _gl.glUniform3f(location, x, y, z)

def glUniform3fv(location, count, v):
    """glUniform3fv(GLint location, GLsizei count, GLfloat const * v)"""
    return _gl.glUniform3fv(location, count, v)

def glUniform3i(location, x, y, z):
    """glUniform3i(GLint location, GLint x, GLint y, GLint z)"""
    return _gl.glUniform3i(location, x, y, z)

def glUniform3iv(location, count, v):
    """glUniform3iv(GLint location, GLsizei count, GLint const * v)"""
    return _gl.glUniform3iv(location, count, v)

def glUniform4f(location, x, y, z, w):
    """glUniform4f(GLint location, GLfloat x, GLfloat y, GLfloat z, GLfloat w)"""
    return _gl.glUniform4f(location, x, y, z, w)

def glUniform4fv(location, count, v):
    """glUniform4fv(GLint location, GLsizei count, GLfloat const * v)"""
    return _gl.glUniform4fv(location, count, v)

def glUniform4i(location, x, y, z, w):
    """glUniform4i(GLint location, GLint x, GLint y, GLint z, GLint w)"""
    return _gl.glUniform4i(location, x, y, z, w)

def glUniform4iv(location, count, v):
    """glUniform4iv(GLint location, GLsizei count, GLint const * v)"""
    return _gl.glUniform4iv(location, count, v)

def glUniformMatrix2fv(location, count, transpose, value):
    """glUniformMatrix2fv(GLint location, GLsizei count, GLboolean transpose, GLfloat const * value)"""
    return _gl.glUniformMatrix2fv(location, count, transpose, value)

def glUniformMatrix3fv(location, count, transpose, value):
    """glUniformMatrix3fv(GLint location, GLsizei count, GLboolean transpose, GLfloat const * value)"""
    return _gl.glUniformMatrix3fv(location, count, transpose, value)

def glUniformMatrix4fv(location, count, transpose, value):
    """glUniformMatrix4fv(GLint location, GLsizei count, GLboolean transpose, GLfloat const * value)"""
    return _gl.glUniformMatrix4fv(location, count, transpose, value)

def glUseProgram(program):
    """glUseProgram(GLuint program)"""
    return _gl.glUseProgram(program)

def glValidateProgram(program):
    """glValidateProgram(GLuint program)"""
    return _gl.glValidateProgram(program)

def glVertexAttrib1f(indx, x):
    """glVertexAttrib1f(GLuint indx, GLfloat x)"""
    return _gl.glVertexAttrib1f(indx, x)

def glVertexAttrib1fv(indx, values):
    """glVertexAttrib1fv(GLuint indx, GLfloat const * values)"""
    return _gl.glVertexAttrib1fv(indx, values)

def glVertexAttrib2f(indx, x, y):
    """glVertexAttrib2f(GLuint indx, GLfloat x, GLfloat y)"""
    return _gl.glVertexAttrib2f(indx, x, y)

def glVertexAttrib2fv(indx, values):
    """glVertexAttrib2fv(GLuint indx, GLfloat const * values)"""
    return _gl.glVertexAttrib2fv(indx, values)

def glVertexAttrib3f(indx, x, y, z):
    """glVertexAttrib3f(GLuint indx, GLfloat x, GLfloat y, GLfloat z)"""
    return _gl.glVertexAttrib3f(indx, x, y, z)

def glVertexAttrib3fv(indx, values):
    """glVertexAttrib3fv(GLuint indx, GLfloat const * values)"""
    return _gl.glVertexAttrib3fv(indx, values)

def glVertexAttrib4f(indx, x, y, z, w):
    """glVertexAttrib4f(GLuint indx, GLfloat x, GLfloat y, GLfloat z, GLfloat w)"""
    return _gl.glVertexAttrib4f(indx, x, y, z, w)

def glVertexAttrib4fv(indx, values):
    """glVertexAttrib4fv(GLuint indx, GLfloat const * values)"""
    return _gl.glVertexAttrib4fv(indx, values)

def glVertexAttribPointer(indx, size, type, normalized, stride, ptr):
    """glVertexAttribPointer(GLuint indx, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLvoid const * ptr)"""
    return _gl.glVertexAttribPointer(indx, size, type, normalized, stride, ptr)

def glViewport(x, y, width, height):
    """glViewport(GLint x, GLint y, GLsizei width, GLsizei height)"""
    return _gl.glViewport(x, y, width, height)
# This file is compatible with both classic and new-style classes.

