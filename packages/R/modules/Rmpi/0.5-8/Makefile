include ../../../../../mk/gnu.pre.mk

DISTNAME=       Rmpi
VERSION=        0.5-8

DEPENDS+="openmpi/1.4.2 --build-env openmpi/1.4.2 --run-env"

CPRT_R_INSTARGS += --configure-args=--with-mpi=$(PREFIX_openmpi)

include ../../../../../mk/prg.Rmod.mk
include ../../../../../mk/gnu.post.mk
