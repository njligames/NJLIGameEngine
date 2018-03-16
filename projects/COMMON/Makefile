MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

#export ASSET_DIR = /Users/jamesfolk/Dropbox/Developer/NJLI/Engine/cmake.in/Platform.in/common
#export ASSET_DIR=/Users/jamesfolk/Documents/NJLI/Engine/cmake.in/Platform.in/common

all: 
	echo ${MAKEFILE_PATH}
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/cameras
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/curves
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/fonts
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/images
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/materials
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/meshes
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/particles
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/scripts
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/shaders
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/sounds
	@mkdir -p $(NJLI_GAME_ENGINE_ASSET_DIR)/assets/strings

	# @cd $(MAKEFILE_PATH)/debugLevel && make
	# @cd $(MAKEFILE_PATH)/countryLevel && make
	# @cd $(MAKEFILE_PATH)/gameplay && make
	@cd $(MAKEFILE_PATH)/elia_hud && make
	# @cd $(MAKEFILE_PATH)/interface && make
	@cd $(MAKEFILE_PATH)/audio && make
	@cd $(MAKEFILE_PATH)/gameplay_scripts/yappybirds_game && make
	# @cd $(MAKEFILE_PATH)/fonts && make
	cd $(MAKEFILE_PATH)/shaders && make clean && make

clean: 
	@cd $(MAKEFILE_PATH)/gameplay_scripts/yappybirds_game && make clean
	@cd $(MAKEFILE_PATH)/audio && make clean
	# @cd $(MAKEFILE_PATH)/interface && make clean
	# @cd $(MAKEFILE_PATH)/gameplay && make clean
	@cd $(MAKEFILE_PATH)/elia_hud && make clean
	# @cd $(MAKEFILE_PATH)/countryLevel && make clean
	# @cd $(MAKEFILE_PATH)/debugLevel && make clean
	# @cd $(MAKEFILE_PATH)/fonts && make clean
	@cd $(MAKEFILE_PATH)/shaders && make clean
	@rm -rf $(MAKEFILE_PATH)/assets/images/generated
