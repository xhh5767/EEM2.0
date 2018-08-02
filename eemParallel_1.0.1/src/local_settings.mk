CXX     = /usr/local/package/openmpi/1.6.5-static-gcc/bin/mpic++
CXXFLAGS= -Wall -Wno-sign-compare -g
CXXFLAGS+= -std=c++11 -DHAVE_UNORDERED_MAP
CXXFLAGS+= -DHAVE_SHUFFLE
#CXXFLAGS+= -DSWITCHING_NUM_PROCS=4
#CXXFLAGS+= -DDEBUG
#CXXFLAGS+= -DDEBUG_MORE
#CXXFLAGS+= -D_GLIBCXX_DEBUG
CXXFLAGS+= -O2 -DNDEBUG

LDFLAGS =
LIBS    =
#LIBS    += -lduma

AR = ar cru
RANLIB = ranlib
RM = \rm -f

# for instalation
PREFIX = $(HOME)/local
INCDIR = $(PREFIX)/include
LIBDIR = $(PREFIX)/lib
BINDIR = $(PREFIX)/bin
