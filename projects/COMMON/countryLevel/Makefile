MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

TILED := /Applications/Developer/Tiled.app/Contents/MacOS/Tiled
TILED_SRCDIR              := .
TILED_SRCFILES := $(addsuffix /*, $(TILED_SRCDIR))
TILED_SRCFILES := $(wildcard $(TILED_SRCFILES))
TILED_SRCFILES := $(filter %.tmx, $(TILED_SRCFILES))
TILED_OBJDIR              := ../gameplay_scripts/yappybirds_game/scripts/generated/tiled/country

TILED_OBJFILES := $(subst $(TILED_SRCDIR)/, $(TILED_OBJDIR)/, $(TILED_SRCFILES:%.tmx=%.lua))

$(TILED_OBJDIR)/%.lua: $(addprefix $(TILED_SRCDIR)/, %.tmx)
	@$(TILED) --export-map $< $@
	@echo "Generated: $@"



TEXTUREPACKER := /Applications/Developer/TexturePacker.app/Contents/MacOS/TexturePacker
TEXTUREPACKER_OPTIONS := --format corona-imagesheet --texture-format "png" --opt RGBA8888  --reduce-border-artifacts  --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode None --force-publish

TEXTUREPACKER_SRCDIR              := ./TexturePacker
TEXTUREPACKER_SRCFILES := $(addsuffix /*, $(TEXTUREPACKER_SRCDIR))
TEXTUREPACKER_SRCFILES := $(wildcard $(TEXTUREPACKER_SRCFILES))

TEXTUREPACKER_LUA_OBJDIR   := ../gameplay_scripts/yappybirds_game/scripts/generated/texturepacker
TEXTUREPACKER_PNG_OBJDIR   := ../assets/images/generated

TEXTUREPACKER_OBJECTS := $(TEXTUREPACKER_PNG_OBJDIR)/country0.png

countryLevel: $(TILED_OBJDIR) $(TEXTUREPACKER_PNG_OBJDIR) $(TEXTUREPACKER_PNG_OBJDIR) $(TILED_OBJFILES) $(TEXTUREPACKER_OBJECTS)

$(TEXTUREPACKER_OBJECTS): $(TEXTUREPACKER_SRCFILES)
	@$(TEXTUREPACKER) $(TEXTUREPACKER_OPTIONS) --data $(TEXTUREPACKER_LUA_OBJDIR)/country{n}.lua --sheet $(TEXTUREPACKER_PNG_OBJDIR)/country{n}.png $(TEXTUREPACKER_SRCDIR)

$(TILED_OBJDIR):
	mkdir -p $(TILED_OBJDIR)

$(TEXTUREPACKER_LUA_OBJDIR):
	mkdir -p $(TEXTUREPACKER_LUA_OBJDIR)

$(TEXTUREPACKER_PNG_OBJDIR):
	mkdir -p $(TEXTUREPACKER_PNG_OBJDIR)

clean:
	@rm -rf $(TEXTUREPACKER_PNG_OBJDIR)
	@rm -rf $(TEXTUREPACKER_LUA_OBJDIR)
	@rm -rf $(TILED_OBJDIR)
	@rm -f $(TILED_OBJFILES)
	@rm -f $(TEXTUREPACKER_PNG_OBJDIR)/country*.png
	@rm -f $(TEXTUREPACKER_LUA_OBJDIR)/country*.lua

echo:
	@echo "TILED_SRCFILES=$(TILED_SRCFILES)\n"
	@echo "TILED_OBJFILES=$(TILED_OBJFILES)\n"
	@echo "TEXTUREPACKER_SRCFILES=$(TEXTUREPACKER_SRCFILES)\n"
	@echo "TEXTUREPACKER_OBJECTS=$(TEXTUREPACKER_OBJECTS)"

.PHONY: countryLevel clean echo

