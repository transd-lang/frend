# In case a c++ compiler is not automatically detected, please set
# the CC variable manually with the name/path of your c++ compiler.
# For example: CC = /usr/bin/g++
CC =

ifeq (, $(CC))
ifneq (,$(shell which g++ 2>/dev/null))
CC := g++
else
ifneq (,$(shell which clang++ 2>/dev/null))
CC := clang++
endif
endif
endif

ifeq (, $(CC))
$(error Error: no known c++ compilers found. Please, set the CC variable in the Makefile manually.)
endif

CPPFILES := src/transd.cpp src/main.cpp

all: $(CPPFILES)
	$(CC) -O2 $(CPPFILES) -D__LINUX__ -o frend