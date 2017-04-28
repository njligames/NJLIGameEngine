BIN := ./../bin/packAudio.sh
OUT_FORMAT := caf

OBJDIR := ../assets/sounds
SRCDIR := .

SRCFILES := $(addsuffix /*, $(SRCDIR))
SRCFILES := $(wildcard $(SRCFILES))
SRCFILES := $(filter %.wav, $(SRCFILES))
SRCFILES := $(filter-out $(wildcard ./audacity/*), $(SRCFILES))
SRCFILES := $(filter-out $(wildcard ./_archive/*), $(SRCFILES))

OBJFILES := $(subst $(SRCDIR)/, $(OBJDIR)/, $(SRCFILES:%.wav=%.$(OUT_FORMAT)))

audio: $(OBJFILES)

$(OBJDIR)/%.$(OUT_FORMAT): $(addprefix $(SRCDIR)/, %.wav)
	@$(BIN) $^ $@

clean:
	@rm -rf $(OBJDIR)/*

echo:
	@echo "OBJDIR/* = $(OBJDIR)/*"
	@echo "SRCFILES=$(SRCFILES)\n"
	@echo "OBJFILES=$(OBJFILES)\n"

.PHONY: audio clean echo
