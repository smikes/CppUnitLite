AR = /usr/bin/ar
CXX = /usr/bin/g++
TAR = /usr/bin/tar
UPLOAD = /usr/bin/scp
RM = /bin/rm
STRIP = /usr/bin/strip
PERL = /usr/bin/perl

IPATHS =
WFLAGS = -Wall -W -Wno-unused-parameter -Wnewline-eof -Werror
CFLAGS = -g -Os

LIBNAME = CppUnitLite

LIBRARY = lib$(LIBNAME).a

OBJECTS = $(patsubst %, Build/%.o, $(notdir $(basename $(shell ls *.cpp))))

all: $(LIBRARY)

$(LIBRARY): $(OBJECTS)
	$(AR) cru $(LIBRARY) $(OBJECTS)

Build/%.o: %.cpp
	$(CXX) $(IPATHS) $(WFLAGS) $(CFLAGS) -c $< -o $@

Build/%.d: %.cpp
	set -e; $(CXX) -MM $(IPATHS) $(CFLAGS) $< | $(PERL) -pe 's/(.*)\.o\:/\1\.o \1.d\:/' > $@

clean:
	rm -f $(OBJECTS) $(OBJECTS:.o=.d)
	rm -f $(LIBRARY)

ifneq ($(MAKECMDGOALS),clean)
-include $(OBJECTS:.o=.d)
endif
