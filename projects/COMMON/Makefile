MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

all: 
	@mkdir -p $(MAKEFILE_PATH)/assets
	@mkdir -p $(MAKEFILE_PATH)/assets/cameras
	@mkdir -p $(MAKEFILE_PATH)/assets/curves
	@mkdir -p $(MAKEFILE_PATH)/assets/fonts
	@mkdir -p $(MAKEFILE_PATH)/assets/images
	@mkdir -p $(MAKEFILE_PATH)/assets/materials
	@mkdir -p $(MAKEFILE_PATH)/assets/meshes
	@mkdir -p $(MAKEFILE_PATH)/assets/particles
	@mkdir -p $(MAKEFILE_PATH)/assets/scripts
	@mkdir -p $(MAKEFILE_PATH)/assets/shaders
	@mkdir -p $(MAKEFILE_PATH)/assets/sounds
	@mkdir -p $(MAKEFILE_PATH)/assets/strings
	@cd $(MAKEFILE_PATH)/countryLevel && make
	@cd $(MAKEFILE_PATH)/gameplay && make
	@cd $(MAKEFILE_PATH)/interface && make
	@cd $(MAKEFILE_PATH)/audio && make
	@cd $(MAKEFILE_PATH)/gameplay_scripts/yappybirds_game && make
	@cd $(MAKEFILE_PATH)/fonts && make

clean: 
	@cd $(MAKEFILE_PATH)/gameplay_scripts/yappybirds_game && make clean
	@cd $(MAKEFILE_PATH)/audio && make clean
	@cd $(MAKEFILE_PATH)/interface && make clean
	@cd $(MAKEFILE_PATH)/gameplay && make clean
	@cd $(MAKEFILE_PATH)/countryLevel && make clean
	@cd $(MAKEFILE_PATH)/fonts && make clean
	@rm -rf $(MAKEFILE_PATH)/assets/images/generated
