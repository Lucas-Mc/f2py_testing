FC = gfortran

FFLAGS = -fPIC

SRCS_F = $(wildcard  *.F90)
OBJS   = $(SRCS_F:.F90=.o)

all: $(OBJS)
	ar crs allFiles.a $(OBJS)


.SUFFIXES:
.SUFFIXES: .o .f .F90 .h

.F90.o: $(FSOURCE)
	$(FC) -c $(FFLAGS) $?