# DO NOT EDIT
# This makefile makes sure all linkable targets are
# up-to-date with anything they link to
default:
	echo "Do not invoke directly"

# Rules to remove targets that are older than anything to which they
# link.  This forces Xcode to relink the targets from scratch.  It
# does not seem to check these dependencies itself.
PostBuild.NJLI.Debug:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLI.framework/NJLI:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLI.framework/NJLI


PostBuild.NJLIGameEngine.Debug:
PostBuild.libnjli_static.Debug: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLIGameEngine.app/NJLIGameEngine
PostBuild.libnjli_static.Debug: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLIGameEngine.app/NJLIGameEngine
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLIGameEngine.app/NJLIGameEngine:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/NJLIGameEngine.app/NJLIGameEngine


PostBuild.libnjli_shared.Debug:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.dylib:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.dylib


PostBuild.libnjli_static.Debug:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.a:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.a


PostBuild.NJLIGameEngineTest_ios.Debug:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios


PostBuild.NJLI.Release:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLI.framework/NJLI:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLI.framework/NJLI


PostBuild.NJLIGameEngine.Release:
PostBuild.libnjli_static.Release: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLIGameEngine.app/NJLIGameEngine
PostBuild.libnjli_static.Release: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLIGameEngine.app/NJLIGameEngine
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLIGameEngine.app/NJLIGameEngine:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/NJLIGameEngine.app/NJLIGameEngine


PostBuild.libnjli_shared.Release:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.dylib:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.dylib


PostBuild.libnjli_static.Release:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.a:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.a


PostBuild.NJLIGameEngineTest_ios.Release:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios


PostBuild.NJLI.MinSizeRel:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLI.framework/NJLI:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLI.framework/NJLI


PostBuild.NJLIGameEngine.MinSizeRel:
PostBuild.libnjli_static.MinSizeRel: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLIGameEngine.app/NJLIGameEngine
PostBuild.libnjli_static.MinSizeRel: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLIGameEngine.app/NJLIGameEngine
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLIGameEngine.app/NJLIGameEngine:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/NJLIGameEngine.app/NJLIGameEngine


PostBuild.libnjli_shared.MinSizeRel:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.dylib:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.dylib


PostBuild.libnjli_static.MinSizeRel:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.a:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.a


PostBuild.NJLIGameEngineTest_ios.MinSizeRel:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios


PostBuild.NJLI.RelWithDebInfo:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLI.framework/NJLI:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLI.framework/NJLI


PostBuild.NJLIGameEngine.RelWithDebInfo:
PostBuild.libnjli_static.RelWithDebInfo: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLIGameEngine.app/NJLIGameEngine
PostBuild.libnjli_static.RelWithDebInfo: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLIGameEngine.app/NJLIGameEngine
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLIGameEngine.app/NJLIGameEngine:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a\
	/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/NJLIGameEngine.app/NJLIGameEngine


PostBuild.libnjli_shared.RelWithDebInfo:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.dylib:\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a\
	/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.dylib


PostBuild.libnjli_static.RelWithDebInfo:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.a:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.a


PostBuild.NJLIGameEngineTest_ios.RelWithDebInfo:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios:
	/bin/rm -f /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/PlugIns/NJLIGameEngineTest_ios.xctest/NJLIGameEngineTest_ios




# For each target create a dummy ruleso the target does not have to exist
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Collision.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Common.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Dynamics.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3Geometry.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBullet3OpenCL_clew.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletCollision.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletDynamics.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletFileLoader.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamics.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletInverseDynamicsUtils.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletSoftBody.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletWorldImporter.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libBulletXmlWorldImporter.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libConvexDecomposition.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libGIMPACTUtils.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libHACD.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/bullet3/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/lib/libLinearMath.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/imgui/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libimgui.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/jsoncpp/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libjsoncpp.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/nanovg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libnanovg.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/ogg/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libogg.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/stb/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libstb.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/usynergy/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libuSynergy.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbis.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisenc.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/BUILD/lib/vorbis/ios/10.3/Release$(EFFECTIVE_PLATFORM_NAME)/libvorbisfile.a:
/Users/jamesfolk/Documents/NJLI/Engine/../External/thirdparty/SDL2/lib/ios/11.1/Release$(EFFECTIVE_PLATFORM_NAME)/libSDL2.a:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Debug/libnjli.a:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/MinSizeRel/libnjli.a:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/RelWithDebInfo/libnjli.a:
/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_ios_Xcode/build/Release/libnjli.a:
