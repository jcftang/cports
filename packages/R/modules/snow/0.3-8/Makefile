include ../../../../../mk/gnu.pre.mk

DISTNAME=       snow
VERSION=        0.3-8

DEPENDS+="openmpi/1.4.3 --build-env openmpi/1.4.3 --run-env"
R_DEPENDS+="Rmpi"

#CPRT_R_INSTARGS += --configure-args=--with-mpi=$(PREFIX_openmpi)
CPRT_R_INSTARGS += 

include ../../../../../mk/prg.Rmod.mk
include ../../../../../mk/gnu.post.mk
