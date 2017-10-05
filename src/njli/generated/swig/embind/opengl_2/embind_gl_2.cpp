/* ----------------------------------------------------------------------------
 * This file was automatically generated by SWIG (http://www.swig.org).
 * Version 3.0.11
 *
 * This file is not intended to be easily readable and contains a number of
 * coding conventions designed to improve portability and efficiency. Do not make
 * changes to this file unless you know what you are doing--modify the SWIG
 * interface file instead.
 * ----------------------------------------------------------------------------- */
#include <emscripten/bind.h>
using namespace emscripten;


#ifndef SWIGEMBIND
#define SWIGEMBIND
#endif


#ifdef __cplusplus
/* SwigValueWrapper is described in swig.swg */
template<typename T> class SwigValueWrapper {
  struct SwigMovePointer {
    T *ptr;
    SwigMovePointer(T *p) : ptr(p) { }
    ~SwigMovePointer() { delete ptr; }
    SwigMovePointer& operator=(SwigMovePointer& rhs) { T* oldptr = ptr; ptr = 0; delete oldptr; ptr = rhs.ptr; rhs.ptr = 0; return *this; }
  } pointer;
  SwigValueWrapper& operator=(const SwigValueWrapper<T>& rhs);
  SwigValueWrapper(const SwigValueWrapper<T>& rhs);
public:
  SwigValueWrapper() : pointer(0) { }
  SwigValueWrapper& operator=(const T& t) { SwigMovePointer tmp(new T(t)); pointer = tmp; return *this; }
  operator T&() const { return *pointer.ptr; }
  T *operator&() { return pointer.ptr; }
};

template <typename T> T SwigValueInit() {
  return T();
}
#endif

/* -----------------------------------------------------------------------------
 *  This section contains generic SWIG labels for method/variable
 *  declarations/attributes, and other compiler dependent labels.
 * ----------------------------------------------------------------------------- */

/* template workaround for compilers that cannot correctly implement the C++ standard */
#ifndef SWIGTEMPLATEDISAMBIGUATOR
# if defined(__SUNPRO_CC) && (__SUNPRO_CC <= 0x560)
#  define SWIGTEMPLATEDISAMBIGUATOR template
# elif defined(__HP_aCC)
/* Needed even with `aCC -AA' when `aCC -V' reports HP ANSI C++ B3910B A.03.55 */
/* If we find a maximum version that requires this, the test would be __HP_aCC <= 35500 for A.03.55 */
#  define SWIGTEMPLATEDISAMBIGUATOR template
# else
#  define SWIGTEMPLATEDISAMBIGUATOR
# endif
#endif

/* inline attribute */
#ifndef SWIGINLINE
# if defined(__cplusplus) || (defined(__GNUC__) && !defined(__STRICT_ANSI__))
#   define SWIGINLINE inline
# else
#   define SWIGINLINE
# endif
#endif

/* attribute recognised by some compilers to avoid 'unused' warnings */
#ifndef SWIGUNUSED
# if defined(__GNUC__)
#   if !(defined(__cplusplus)) || (__GNUC__ > 3 || (__GNUC__ == 3 && __GNUC_MINOR__ >= 4))
#     define SWIGUNUSED __attribute__ ((__unused__))
#   else
#     define SWIGUNUSED
#   endif
# elif defined(__ICC)
#   define SWIGUNUSED __attribute__ ((__unused__))
# else
#   define SWIGUNUSED
# endif
#endif

#ifndef SWIG_MSC_UNSUPPRESS_4505
# if defined(_MSC_VER)
#   pragma warning(disable : 4505) /* unreferenced local function has been removed */
# endif
#endif

#ifndef SWIGUNUSEDPARM
# ifdef __cplusplus
#   define SWIGUNUSEDPARM(p)
# else
#   define SWIGUNUSEDPARM(p) p SWIGUNUSED
# endif
#endif

/* internal SWIG method */
#ifndef SWIGINTERN
# define SWIGINTERN static SWIGUNUSED
#endif

/* internal inline SWIG method */
#ifndef SWIGINTERNINLINE
# define SWIGINTERNINLINE SWIGINTERN SWIGINLINE
#endif

/* exporting methods */
#if defined(__GNUC__)
#  if (__GNUC__ >= 4) || (__GNUC__ == 3 && __GNUC_MINOR__ >= 4)
#    ifndef GCC_HASCLASSVISIBILITY
#      define GCC_HASCLASSVISIBILITY
#    endif
#  endif
#endif

#ifndef SWIGEXPORT
# if defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
#   if defined(STATIC_LINKED)
#     define SWIGEXPORT
#   else
#     define SWIGEXPORT __declspec(dllexport)
#   endif
# else
#   if defined(__GNUC__) && defined(GCC_HASCLASSVISIBILITY)
#     define SWIGEXPORT __attribute__ ((visibility("default")))
#   else
#     define SWIGEXPORT
#   endif
# endif
#endif

/* calling conventions for Windows */
#ifndef SWIGSTDCALL
# if defined(_WIN32) || defined(__WIN32__) || defined(__CYGWIN__)
#   define SWIGSTDCALL __stdcall
# else
#   define SWIGSTDCALL
# endif
#endif

/* Deal with Microsoft's attempt at deprecating C standard runtime functions */
#if !defined(SWIG_NO_CRT_SECURE_NO_DEPRECATE) && defined(_MSC_VER) && !defined(_CRT_SECURE_NO_DEPRECATE)
# define _CRT_SECURE_NO_DEPRECATE
#endif

/* Deal with Microsoft's attempt at deprecating methods in the standard C++ library */
#if !defined(SWIG_NO_SCL_SECURE_NO_DEPRECATE) && defined(_MSC_VER) && !defined(_SCL_SECURE_NO_DEPRECATE)
# define _SCL_SECURE_NO_DEPRECATE
#endif

/* Deal with Apple's deprecated 'AssertMacros.h' from Carbon-framework */
#if defined(__APPLE__) && !defined(__ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES)
# define __ASSERT_MACROS_DEFINE_VERSIONS_WITHOUT_UNDERSCORES 0
#endif

/* Intel's compiler complains if a variable which was never initialised is
 * cast to void, which is a common idiom which we use to indicate that we
 * are aware a variable isn't used.  So we just silence that warning.
 * See: https://github.com/swig/swig/issues/192 for more discussion.
 */
#ifdef __INTEL_COMPILER
# pragma warning disable 592
#endif


#define SWIGVERSION 0x030011 
#define SWIG_VERSION SWIGVERSION


#define SWIG_as_voidptr(a) (void *)((const void *)(a)) 
#define SWIG_as_voidptrptr(a) ((void)SWIG_as_voidptr(*a),(void**)(a)) 


#ifdef __cplusplus	/* generic alloc/dealloc fns*/
#define SWIG_ALLOC_ARRAY(TYPE,LEN) 	new TYPE[LEN]
#define SWIG_FREE_ARRAY(PTR)		delete[] PTR
#else
#define SWIG_ALLOC_ARRAY(TYPE,LEN) 	(TYPE *)malloc(LEN*sizeof(TYPE))
#define SWIG_FREE_ARRAY(PTR)		free(PTR)
#endif
/* counting the size of arrays:*/
SWIGINTERN int SWIG_itable_size(lua_State* L, int index)
{
	int n=0;
	while(1){
		lua_rawgeti(L,index,n+1);
		if (lua_isnil(L,-1))break;
		++n;
		lua_pop(L,1);
	}
	lua_pop(L,1);
	return n;
}

SWIGINTERN int SWIG_table_size(lua_State* L, int index)
{
	int n=0;
	lua_pushnil(L);  /* first key*/
	while (lua_next(L, index) != 0) {
		++n;
		lua_pop(L, 1);  /* removes `value'; keeps `key' for next iteration*/
	}
	return n;
}

/* super macro to declare array typemap helper fns */
#define SWIG_DECLARE_TYPEMAP_ARR_FN(NAME,TYPE)\
	SWIGINTERN int SWIG_read_##NAME##_num_array(lua_State* L,int index,TYPE *array,int size){\
		int i;\
		for (i = 0; i < size; i++) {\
			lua_rawgeti(L,index,i+1);\
			if (lua_isnumber(L,-1)){\
				array[i] = (TYPE)lua_tonumber(L,-1);\
			} else {\
				lua_pop(L,1);\
				return 0;\
			}\
			lua_pop(L,1);\
		}\
		return 1;\
	}\
	SWIGINTERN TYPE* SWIG_get_##NAME##_num_array_fixed(lua_State* L, int index, int size){\
		TYPE *array;\
		if (!lua_istable(L,index) || SWIG_itable_size(L,index) != size) {\
			SWIG_Lua_pushferrstring(L,"expected a table of size %d",size);\
			return 0;\
		}\
		array=SWIG_ALLOC_ARRAY(TYPE,size);\
		if (!SWIG_read_##NAME##_num_array(L,index,array,size)){\
			SWIG_Lua_pusherrstring(L,"table must contain numbers");\
			SWIG_FREE_ARRAY(array);\
			return 0;\
		}\
		return array;\
	}\
	SWIGINTERN TYPE* SWIG_get_##NAME##_num_array_var(lua_State* L, int index, int* size)\
	{\
		TYPE *array;\
		if (!lua_istable(L,index)) {\
			SWIG_Lua_pusherrstring(L,"expected a table");\
			return 0;\
		}\
		*size=SWIG_itable_size(L,index);\
		if (*size<1){\
			SWIG_Lua_pusherrstring(L,"table appears to be empty");\
			return 0;\
		}\
		array=SWIG_ALLOC_ARRAY(TYPE,*size);\
		if (!SWIG_read_##NAME##_num_array(L,index,array,*size)){\
			SWIG_Lua_pusherrstring(L,"table must contain numbers");\
			SWIG_FREE_ARRAY(array);\
			return 0;\
		}\
		return array;\
	}\
	SWIGINTERN void SWIG_write_##NAME##_num_array(lua_State* L,TYPE *array,int size){\
		int i;\
		lua_newtable(L);\
		for (i = 0; i < size; i++){\
			lua_pushnumber(L,(lua_Number)array[i]);\
			lua_rawseti(L,-2,i+1);/* -1 is the number, -2 is the table*/ \
		}\
	}

SWIG_DECLARE_TYPEMAP_ARR_FN(schar,signed char)
SWIG_DECLARE_TYPEMAP_ARR_FN(uchar,unsigned char)
SWIG_DECLARE_TYPEMAP_ARR_FN(int,int)
SWIG_DECLARE_TYPEMAP_ARR_FN(uint,unsigned int)
SWIG_DECLARE_TYPEMAP_ARR_FN(short,short)
SWIG_DECLARE_TYPEMAP_ARR_FN(ushort,unsigned short)
SWIG_DECLARE_TYPEMAP_ARR_FN(long,long)
SWIG_DECLARE_TYPEMAP_ARR_FN(ulong,unsigned long)
SWIG_DECLARE_TYPEMAP_ARR_FN(float,float)
SWIG_DECLARE_TYPEMAP_ARR_FN(double,double)

SWIGINTERN int SWIG_read_ptr_array(lua_State* L,int index,void **array,int size,swig_type_info *type){
	int i;
	for (i = 0; i < size; i++) {
		lua_rawgeti(L,index,i+1);
		if (!lua_isuserdata(L,-1) || SWIG_ConvertPtr(L,-1,&array[i],type,0)==-1){
			lua_pop(L,1);
			return 0;
		}
		lua_pop(L,1);
	}
	return 1;
}
SWIGINTERN void** SWIG_get_ptr_array_fixed(lua_State* L, int index, int size,swig_type_info *type){
	void **array;
	if (!lua_istable(L,index) || SWIG_itable_size(L,index) != size) {
		SWIG_Lua_pushferrstring(L,"expected a table of size %d",size);
		return 0;
	}
	array=SWIG_ALLOC_ARRAY(void*,size);
	if (!SWIG_read_ptr_array(L,index,array,size,type)){
		SWIG_Lua_pushferrstring(L,"table must contain pointers of type %s",type->name);
		SWIG_FREE_ARRAY(array);
		return 0;
	}
	return array;
}
SWIGINTERN void** SWIG_get_ptr_array_var(lua_State* L, int index, int* size,swig_type_info *type){
	void **array;
	if (!lua_istable(L,index)) {
		SWIG_Lua_pusherrstring(L,"expected a table");
		return 0;
	}
	*size=SWIG_itable_size(L,index);
	if (*size<1){
		SWIG_Lua_pusherrstring(L,"table appears to be empty");
		return 0;
	}
	array=SWIG_ALLOC_ARRAY(void*,*size);
	if (!SWIG_read_ptr_array(L,index,array,*size,type)){
		SWIG_Lua_pushferrstring(L,"table must contain pointers of type %s",type->name);
		SWIG_FREE_ARRAY(array);
		return 0;
	}
	return array;
}
SWIGINTERN void SWIG_write_ptr_array(lua_State* L,void **array,int size,swig_type_info *type,int own){
	int i;
	lua_newtable(L);
	for (i = 0; i < size; i++){
		SWIG_NewPointerObj(L,array[i],type,own);
		lua_rawseti(L,-2,i+1);/* -1 is the number, -2 is the table*/
	}
}


#include <string>


#undef SWIG_fail_arg
#define SWIG_fail_arg(func_name,argnum,type) \
{lua_Debug ar;\
lua_getstack(L, 1, &ar);\
lua_getinfo(L, "nSl", &ar);\
lua_pushfstring(L,"Error (%s:%d) in %s (arg %d), expected '%s' got '%s'",\
ar.source,ar.currentline,func_name,argnum,type,SWIG_Lua_typename(L,argnum));\
goto fail;}
    

#undef SWIG_check_num_args
#define SWIG_check_num_args(func_name,a,b) \
if(LUA_WRAPPER_LOGGING){\
lua_Debug ar;\
lua_getstack(L, 1, &ar);\
lua_getinfo(L, "nSl", &ar);\
printf("(%s:%d) in %s",\
ar.short_src,ar.currentline,ar.name); \
}\
if (lua_gettop(L)<a || lua_gettop(L)>b) \
{SWIG_Lua_pushferrstring(L,"Error in %s expected %d..%d args, got %d",func_name,a,b,lua_gettop(L));\
goto fail;}
    

    #include "GraphicsPlatform.h"


GLfloat *newfv4(GLfloat a, GLfloat b, GLfloat c, GLfloat d)
{
  GLfloat *f = (GLfloat*) malloc(4 * sizeof(GLfloat));
  f[0] = a;
  f[1] = b;
  f[2] = c;
  f[3] = d;
  return f;
}


void delfv(void *m)
{
    free(m);
}

EMSCRIPTEN_BINDINGS(gl) {
	function("newfv4", &newfv4, allow_raw_pointers());
	function("delfv", &delfv);
}

