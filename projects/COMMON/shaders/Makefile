BIN := ./../bin/glslopt
CP := cp

#Usage: glslopt <-f|-v> <input shader> [<output shader>]
#	-f : fragment shader (default)
#	-v : vertex shader
#	-1 : target OpenGL (default)
#	-2 : target OpenGL ES 2.0
#	-3 : target OpenGL ES 3.0
#
#If no output specified, output is to [input].out.

#$(NJLI_BUILD_PLATFORM)
GL_TARGET := -1

ifeq ($(NJLI_GRAPHICS_PLATFORM),opengl_es_2)
	GL_TARGET := -2
else ifeq ($(NJLI_GRAPHICS_PLATFORM),opengl_es_3)
	GL_TARGET := -3
else ifeq ($(NJLI_GRAPHICS_PLATFORM),opengl_2)
	GL_TARGET := -1
else ifeq ($(NJLI_GRAPHICS_PLATFORM),opengl_3)
	GL_TARGET := -1
else
	GL_TARGET := -1
endif

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
	$(BIN) -v $(GL_TARGET) $^ $@
	@$(CP) $^ $@_DEBUG

$(OBJDIR)/%.fsh: $(addprefix $(SRCDIR)/, %.fsh)
	$(BIN) -f $(GL_TARGET) $^ $@
	@$(CP) $^ $@_DEBUG

clean:
	@rm -rf $(OBJDIR)/*

echo:
	@echo "OBJDIR/* = $(OBJDIR)/*"
	@echo "SRCFILES=$(SRCFILES)\n"
	@echo "OBJFILES_VERTEX=$(OBJFILES_VERTEX)\n"
	@echo "OBJFILES_FRAGMENT=$(OBJFILES_FRAGMENT)\n"

.PHONY: shaders clean echo
