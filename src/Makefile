#
# makefile for the program conman on the Sun
# 
COMMON=ConMan.o adjbc.o eg2.o eglib.o elminp.o error.o \
        f_vstf.o f_vrres.o fluxke.o g2assm.o \
        genien.o genmat.o genshg.o genshp.o \
        input.o intemp.o pickdt.o print.o printd.o process.o \
        rdflux.o stress.o timer.o tmass.o \
        vadd.o mydate.o mytime.o projct.o prj4q.o print_reg.o prtstr_reg.o \
        batchelor.o 

SRC_HOME=/home/scott/ConMan02

IMPLICIT=f_tlhs.o f_trhsimp.o
PICARD=f_tlhs.o f_trhsimp.o
EXPLICIT=f_tmres.o

LIBS= libs/libsolver.a libs/libmm.a libs/libgrid.a

PROGRAM=conman
#
# switch for flags around for picard and implicit versions
# use -m64 -r8 -i8 for 64-bit architecture (also see changed in mm.src)
#
FC=ifort
FFLAGS = -O2 -DIMPLICIT -I.
FFLAGS = -O2 -DIMPLICIT -DPICARD -I. -m64 -r8 -i8
FFLAGS = -O2 -I. -m64 -r8 -i8

#
explicit: $(COMMON) $(EXPLICIT) rheol.newt.o timdrv.o
	(cd solver.src ; make)
	(cd mm.src ; make)
	(cd grid.src ; make)
	$(FC) -I$(SRC_HOME)/libs -o conman.exp  rheol.newt.o timdrv.o $(COMMON) $(EXPLICIT) $(LIBS)

picard: $(COMMON) $(PICARD) rheol.newt.o timdrv.o
	(cd solver.src ; make)
	(cd mm.src ; make)
	(cd grid.src ; make)
	$(FC) $(FFLAGS) -I$(SRC_HOME)/libs -o conman.pic rheol.newt.o timdrv.o $(COMMON) $(PICARD) $(LIBS)

picardnn: $(COMMON) $(PICARD) rheol.nn.sdk.o timdrv.nn.o
	(cd solver.src ; make)
	(cd mm.src ; make)
	(cd grid.src ; make)
	$(FC) -I$(SRC_HOME)/libs -o conman.nn.pic rheol.nn.sdk.o timdrv.nn.o $(COMMON) $(PICARD) $(LIBS)

implicit: $(COMMON) $(IMPLICIT)
	(cd solver.src ; make)
	(cd mm.src ; make)
	(cd grid.src ; make)
	$(FC) -o conman.imp  $(COMMON) $(IMPLICIT) $(LIBS)

clean:
	rm -rf core $(COMMON) $(PICARD) $(EXPLICIT) $(IMPLICIT) rheol.newt.o timdrv.o libs/lib*
	(cd solver.src ; make clean)
	(cd mm.src ; make clean)
	(cd grid.src ; make clean)

veryclean:
	rm -rf core $(COMMON) $(PICARD) $(EXPLICIT) $(IMPLICIT) conman.???
