CP=cp

OBJDIR=../../assets/scripts
SRCDIR=scripts

STRUCTURE := $(shell find $(SRCDIR) -type d)
CODEFILES := $(addsuffix /*, $(STRUCTURE))
CODEFILES := $(wildcard $(CODEFILES))

SRCFILES := $(filter %.lua, $(CODEFILES))
OBJFILES := $(subst $(SRCDIR), $(OBJDIR), $(SRCFILES:%.lua=%.lua))

OUTDIRS := $(addprefix $(OBJDIR)/../, $(STRUCTURE))

#COMPILED_LUA := $(OBJDIR)/luac.out

yappybirds_game: $(OUTDIRS) $(OBJFILES) $(COMPILED_LUA)

$(OBJDIR)/%.lua: $(addprefix $(SRCDIR)/, %.lua)
	@$(CP) $^ $@

$(OUTDIRS):
	@mkdir -p $@

$(COMPILED_LUA):
	@luac -s $(SRCFILES)
	@mv luac.out $(COMPILED_LUA)

clean:
	@rm -rf $(OBJDIR)/*

echo:
	@echo "SRCFILES=$(SRCFILES)\n"
	@echo "OBJFILES=$(OBJFILES)\n"
	@echo "OUTDIRS=$(OUTDIRS)\n"
	@echo "OBJDIR=$(OBJDIR)\n"
	@echo "COMPILED_LUA=$(COMPILED_LUA)\n"

.PHONY: yappybirds_game clean echo
