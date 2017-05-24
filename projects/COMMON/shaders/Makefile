BIN := ./../bin/glslopt
#Usage: glslopt <-f|-v> <input shader> [<output shader>]
#	-f : fragment shader (default)
#	-v : vertex shader
#	-1 : target OpenGL (default)
#	-2 : target OpenGL ES 2.0
#	-3 : target OpenGL ES 3.0
#
#If no output specified, output is to [input].out.

OBJDIR := $(ASSET_DIR)/assets/shaders
SRCDIR := .

SRCFILES := $(addsuffix /*, $(SRCDIR))
SRCFILES := $(wildcard $(SRCFILES))
SRCFILES := $(filter %.vsh, $(SRCFILES))

OBJFILES_VERTEX := $(subst $(SRCDIR)/, $(OBJDIR)/, $(SRCFILES:%.vsh=%.vsh))

SRCFILES := $(addsuffix /*, $(SRCDIR))
SRCFILES := $(wildcard $(SRCFILES))
SRCFILES := $(filter %.fsh, $(SRCFILES))

OBJFILES_FRAGMENT := $(subst $(SRCDIR)/, $(OBJDIR)/, $(SRCFILES:%.fsh=%.fsh))

shaders_opengl: $(OBJFILES_VERTEX) $(OBJFILES_FRAGMENT)

$(OBJDIR)/%.vsh: $(addprefix $(SRCDIR)/, %.vsh)
	@$(BIN) -v $^ $@
	@$(BIN) -v -1 $^ $@.gl
	@$(BIN) -v -2 $^ $@.gles2
	@$(BIN) -v -3 $^ $@.gles3

$(OBJDIR)/%.fsh: $(addprefix $(SRCDIR)/, %.fsh)
	@$(BIN) -f $^ $@
	@$(BIN) -f -1 $^ $@.gl
	@$(BIN) -f -2 $^ $@.gles2
	@$(BIN) -f -3 $^ $@.gles3

clean:
	@rm -rf $(OBJDIR)/*

echo:
	@echo "OBJDIR/* = $(OBJDIR)/*"
	@echo "SRCFILES=$(SRCFILES)\n"
	@echo "OBJFILES_VERTEX=$(OBJFILES_VERTEX)\n"
	@echo "OBJFILES_FRAGMENT=$(OBJFILES_FRAGMENT)\n"

.PHONY: shaders clean echo
