CC=gcc
CFLAGS=-O3 -funroll-loops
LDFLAGS=-O2
LDLIBS=-lm
SOURCES=main.c
HEADERS=
OBJECTS=$(addsuffix .o, $(basename ${SOURCES}))
EXECUTABLE=main

all: $(EXECUTABLE)

zip: Makefile $(SOURCES) $(HEADERS)
	zip -r mypackage.zip $^

$(EXECUTABLE): $(OBJECTS)

$(OBJECTS): %.o: %.c $(HEADERS)

clean:
	rm -f $(EXECUTABLE) $(OBJECTS)

.PHONY: all clean