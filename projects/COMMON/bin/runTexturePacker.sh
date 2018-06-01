#!/bin/bash

NAME=$1
TEXTUREPACKER_SHEET_DIR=$2
TEXTUREPACKER_DATA_DIR=$3
TEXTUREPACKER_IMAGES_SOURCE=$4

[[ -z "$1" ]] && { echo "Error: The first parameter is the name of the texture packer export file."; exit 1;}
[[ -z "$2" ]] && { echo "Error: The second parameter is the directory to export the generated lua source."; exit 1;}
[[ -z "$3" ]] && { echo "Error: The third parameter is the directory to export the generated image file."; exit 1;}
[[ -z "$4" ]] && { echo "Error: The fourth parameter is the directory that has the images that will be used to generate the sprite atlas."; exit 1;}


TEXTUREPACKER=/Applications/TexturePacker.app/Contents/MacOS/TexturePacker
TEXTUREPACKER_OPTIONS="--format corona-imagesheet --texture-format "png" --opt RGBA8888  --reduce-border-artifacts  --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode None --force-publish"

${TEXTUREPACKER} ${TEXTUREPACKER_OPTIONS} --data ${TEXTUREPACKER_DATA_DIR}/${NAME}{n}.lua --sheet ${TEXTUREPACKER_SHEET_DIR}/${NAME}{n}.png ${TEXTUREPACKER_IMAGES_SOURCE}


