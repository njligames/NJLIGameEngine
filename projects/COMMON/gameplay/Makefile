TEXTUREPACKER := /Applications/Developer/TexturePacker.app/Contents/MacOS/TexturePacker
TEXTUREPACKER_OPTIONS := --format corona-imagesheet --texture-format "png" --opt RGBA8888  --reduce-border-artifacts  --max-size 4096 --size-constraints POT --force-squared --multipack --disable-rotation --trim-mode None --force-publish

TEXTUREPACKER_SRCDIR              := ./TexturePacker
TEXTUREPACKER_SRCFILES := $(addsuffix /*, $(TEXTUREPACKER_SRCDIR))
TEXTUREPACKER_SRCFILES := $(wildcard $(TEXTUREPACKER_SRCFILES))

TEXTUREPACKER_LUA_OBJDIR   := ../gameplay_scripts/yappybirds_game/scripts/generated/texturepacker
TEXTUREPACKER_PNG_OBJDIR   := ../assets/images/generated

TEXTUREPACKER_OBJECTS := $(TEXTUREPACKER_PNG_OBJDIR)/gameplay0.png

gameplay: $(TEXTUREPACKER_LUA_OBJDIR) $(TEXTUREPACKER_PNG_OBJDIR) $(TEXTUREPACKER_OBJECTS)

$(TEXTUREPACKER_OBJECTS): $(TEXTUREPACKER_SRCFILES)
	@$(TEXTUREPACKER) $(TEXTUREPACKER_OPTIONS) --data $(TEXTUREPACKER_LUA_OBJDIR)/gameplay{n}.lua --sheet $(TEXTUREPACKER_PNG_OBJDIR)/gameplay{n}.png $(TEXTUREPACKER_SRCDIR)

$(TEXTUREPACKER_LUA_OBJDIR):
	mkdir -p $(TEXTUREPACKER_LUA_OBJDIR)

$(TEXTUREPACKER_PNG_OBJDIR):
	mkdir -p $(TEXTUREPACKER_PNG_OBJDIR)

clean:
	@rm -rf $(TEXTUREPACKER_PNG_OBJDIR)
	@rm -rf $(TEXTUREPACKER_LUA_OBJDIR)

echo:
	@echo "TEXTUREPACKER_SRCFILES=$(TEXTUREPACKER_SRCFILES)\n"
	@echo "TEXTUREPACKER_OBJECTS=$(TEXTUREPACKER_OBJECTS)\n"

.PHONY: gameplay clean echo
