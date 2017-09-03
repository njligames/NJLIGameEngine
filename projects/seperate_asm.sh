#!/bin/bash

cd emscripten_Sublime
python /Applications/Developer/emsdk_portable/emscripten/1.37.9/tools/separate_asm.py NJLIGameEngine.js the_asm.js the_rest.js
rm NJLIGameEngine.js

