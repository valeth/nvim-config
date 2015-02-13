SUBMODULES = bundle/*

.PHONY: $(SUBMODULES)

all: $(SUBMODULES)

$(SUBMODULES):
	$(info updating submodule $@)
	@cd $@
	@git pull origin master 1>/dev/null 2>/dev/null

bundle/youcompleteme:	
	$(info updating submodule $@)
	@cd $@
	@git pull origin master 1>/dev/null 2>/dev/null
	@git submodule update --init --recursive
	@bash ./install.sh --clang-completer
