
      message("Signing application bundle: /Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_ios_Xcode/build/Release/NJLIGameEngine.app $(EFFECTIVE_PLATFORM_NAME)")
      # https://www.slicer.org/wiki/Documentation/Nightly/Developers/Mac_OS_X_Code_Signing
      execute_process(
        COMMAND codesign --deep --force --sign "SRBQ5SCF5X" -i "com.njligames.engine.ios.source" "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_ios_Xcode/build/Release/NJLIGameEngine.app"
      )
      execute_process(
        COMMAND codesign -dv "/Users/jamesfolk/Documents/NJLI/Engine/projects/ELIA_ios_Xcode/build/Release/NJLIGameEngine.app"
      )
    