SUBMODULES = bundle/*

CO_INFO  = \e[1;34m
CO_CLEAR = \e[0m

.PHONY: $(SUBMODULES)

all: $(SUBMODULES) youcompleteme

youcompleteme: bundle/youcompleteme
	@echo -e "$(CO_INFO)building submodule $@$(CO_CLEAR)"
	@cd $< && \
	    git submodule update --init --recursive && \
	    bash ./install.sh --clang-completer --system-libclang

$(SUBMODULES):
	@echo -e "$(CO_INFO)updating submodule $@$(CO_CLEAR)"
	@cd $@ && \
	    git pull origin master


