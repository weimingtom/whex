# configuration variables
#include config.mk
CC := gcc

CFLAGS += -std=c99 -Wall -I.
#-I$(LUA_DIR)/include

whex.exe: monoedit.o lua_api.o tree.o main.o unicode.o
	$(CC) -mwindows -o $@ $^ -lgdi32 -lcomdlg32 -lcomctl32 -L. -llua

# -L$(LUA_DIR)/lib

clean: 
	rm -rf *.o *.exe

main.o: main.c mainwindow.h monoedit.h tree.h unicode.h
lua_api.o: lua_api.c mainwindow.h tree.h
tree.o: tree.c tree.h
unicode.o: unicode.c unicode.h
