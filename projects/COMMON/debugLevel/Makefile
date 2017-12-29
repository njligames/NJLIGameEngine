MAKEFILE_PATH := $(shell dirname $(realpath $(lastword $(MAKEFILE_LIST))))

TILED := /Applications/Developer/Tiled.app/Contents/MacOS/Tiled
TILED_SRCDIR   := .
TILED_SRCFILES := $(addsuffix /*, $(TILED_SRCDIR))
TILED_SRCFILES := $(wildcard $(TILED_SRCFILES))
TILED_SRCFILES := $(filter %.tmx, $(TILED_SRCFILES))
TILED_OBJDIR   := ../gameplay_scripts/yappybirds_game/scripts/generated/tiled

TILED_OBJFILES := $(subst $(TILED_SRCDIR)/, $(TILED_OBJDIR)/, $(TILED_SRCFILES:%.tmx=%.lua))

$(TILED_OBJDIR)/%.lua: $(addprefix $(TILED_SRCDIR)/, %.tmx)
	@$(TILED) --export-map $< $@
	@echo "Generated: $@"

level: $(TILED_OBJDIR) $(TILED_OBJFILES)

$(TILED_OBJDIR):
	mkdir -p $(TILED_OBJDIR)

clean:
	@rm -rf $(TILED_OBJDIR)
	@rm -f $(TILED_OBJFILES)

echo:
	@echo "TILED_SRCFILES=$(TILED_SRCFILES)\n"
	@echo "TILED_OBJFILES=$(TILED_OBJFILES)\n"

.PHONY: level clean echo

