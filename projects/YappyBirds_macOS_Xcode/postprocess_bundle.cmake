
      #SET(FIXUP_BUNDLE_PATH build/$(EFFECTIVE_PLATFORM_NAME)-macosx/NJLIGameEngine.app)
      include(BundleUtilities)
      fixup_bundle("/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_macOS_Xcode/build/Release/NJLIGameEngine.app" "" "/Users/jamesfolk/Documents/NJLI/Engine/cmake.in/Platform.in/common/assets" )
      message("Signing application bundle: /Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_macOS_Xcode/build/Release/NJLIGameEngine.app $(EFFECTIVE_PLATFORM_NAME)")
      # https://www.slicer.org/wiki/Documentation/Nightly/Developers/Mac_OS_X_Code_Signing
      execute_process(
        COMMAND codesign --deep --force --sign "SRBQ5SCF5X" -i "com.njligames.engine.macOS.source" "/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_macOS_Xcode/build/Release/NJLIGameEngine.app"
      )
      execute_process(
        COMMAND codesign -dv "/Users/jamesfolk/Documents/NJLI/Engine/projects/YappyBirds_macOS_Xcode/build/Release/NJLIGameEngine.app"
      )
    