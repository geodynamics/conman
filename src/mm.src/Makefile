#
# makefile for the memory manager library
# 
FC=ifort
FFLAGS=-O2 -m64 -r8 -i8
CFLAGS= -m64  -DMMSC_INT_TYPE=int64_t
CC=gcc

MEMORY_MANAGER=mmsc.o mm2000.o

../libs/libmm.a: $(MEMORY_MANAGER)
	$(AR) cr ../libs/libmm.a  $(MEMORY_MANAGER) 

#
../libs/libmm.a: $(MEMORY_MANAGER)

clean:
	rm -rf core $(MEMORY_MANAGER) 

