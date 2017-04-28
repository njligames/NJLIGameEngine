#GDCL RetroFont ./out/RetroFont -fo PlainText-fnt -v -ol
FONT := GDCL
OPT := -fo PlainText-fnt -v -ol

RM := rm
MV := mv
ECHO := echo


OUT_FORMAT := fnt

FNT_OBJDIR := ../assets/fonts
FNT_SRCDIR := .

FNT_SRCFILES := $(addsuffix /*, $(FNT_SRCDIR))
FNT_SRCFILES := $(wildcard $(FNT_SRCFILES))
FNT_SRCFILES := $(filter %.GlyphProject, $(FNT_SRCFILES))

FNT_OBJFILES := $(subst $(FNT_SRCDIR)/, $(FNT_OBJDIR)/, $(FNT_SRCFILES:%.GlyphProject=%.$(OUT_FORMAT)))

IMG_OBJDIR := ../assets/images/generated

fonts: $(FNT_OBJFILES)

$(FNT_OBJDIR)/%.fnt: $(addprefix $(FNT_SRCDIR)/, %.GlyphProject)
	$(FONT) $(basename $^) $(basename $@) $(OPT)
	$(MV) $(basename $@)*.png $(IMG_OBJDIR)

clean:
	@$(RM) -rf $(FNT_OBJFILES)

echo:
	@$(ECHO) "FNT_SRCFILES=$(FNT_SRCFILES)\n"
	@$(ECHO) "FNT_OBJFILES=$(FNT_OBJFILES)\n"

.PHONY: fonts clean echo

