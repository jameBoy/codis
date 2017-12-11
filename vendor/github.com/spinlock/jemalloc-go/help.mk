.DEFAULT_GOAL = relink

SOURCE := jemalloc-4.4.0

-include $(SOURCE)/Makefile

relink: rmlink
	@for i in $(C_SRCS); do \
		rm -f               je_$$(basename $$i); \
		ln -s $(SOURCE)/$$i je_$$(basename $$i); \
	done
	@ln -s $(SOURCE)/VERSION VERSION
	@ln -s $(SOURCE)/include/jemalloc jemalloc

rmlink:
	@rm -f je_*.c jemalloc VERSION
