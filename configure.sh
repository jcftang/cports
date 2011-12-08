#!/bin/sh

TARGET=cports

ac_help='
--compiler		use gnu, open64 or intel toolchain (default is gnu)'

LOCAL_AC_OPTIONS='
case X"$1" in
X--compiler=*)
	AC_COMPILER=`echo "$1" | sed -e "s/^[^=]*=//"`
	shift 1
	;;
X--compiler)
	AC_COMPILER=$2
	shift 2
	;;
*)	
	ac_error=1
	;;
esac'

. ./configure.inc
. ./local.inc

#
# make sure all the scripts in scripts are executable (or at least the
# ones that configure.sh needs
#
for i in config.guess distro.guess git2cl org2html.sh wvtestrun wvtest.sh
do
	chmod u+x scripts/$i
done

AC_INIT $TARGET

if [ -z "$AC_COMPILER" ]; then
	AC_COMPILER="gnu"
fi

case X"$AC_COMPILER" in
Xgnu)	
	if [ -z "$CC" ]; then
	CC=gcc
	fi
	if [ -z "$CXX" ]; then
	CXX=g++
	fi
	if [ -z "$FC" ]; then
	FC=gfortran
	fi
	AC_SUB COMPILERS gnu
	;;
Xintel)
	CC=icc
	CXX=icpc
	FC=ifort
	AC_SUB COMPILERS intel
	;;
Xopen64)
	CC=opencc
	CXX=openCC
	FC=openf90
	AC_SUB COMPILERS open64
	;;

X*) 	ac_error=1
	LOG "not a valid compiler, plese select gnu, open64 or intel toolchain (default is gnu)"
	exit 1
	;;
esac


# check that we have a C compiler"
if ! AC_PROG_CC; then
    LOG "You need to have a functional C compiler to build $TARGET"
    exit 1
fi

# check that we have a C++ compiler"
if ! AC_PROG_CXX; then
    LOG "You need to have a functional C compiler to build $TARGET"
    exit 1
fi

# this needs more checking and testing, the function is a copy and paste of AC_PROG_CC with some changes
if ! AC_PROG_FC; then
	LOG "You need to have a functional Fortran compiler to build $TARGET"
	exit 1
fi

# check that we have wget
TLOGN "checking the wget"
WGET=`acLookFor wget`
if [ -z "$WGET" ]; then
    AC_FAIL "Cannot find wget";
fi
TLOG " - you have some version of wget ok"

# check for gnu make
TLOGN "checking the GNU make"
MAKE=`acLookFor make`
if [ -z "$MAKE" ]; then
    AC_FAIL "Cannot find make";
fi

MAKE_GNU=`$MAKE --version | grep "GNU Make"`
if [ -z "$MAKE_GNU" ]; then
    AC_FAIL "$MAKE is not GNU Make"
fi

MAKE_VERSION=`$MAKE --version | grep "GNU Make" | awk '{print $3}'`
if [ -z "$MAKE_VERSION" ]; then
    AC_FAIL "$MAKE --version does not return sensible output?"
fi
expr "$MAKE_VERSION" '>=' '3.81' || AC_FAIL "$MAKE must be >= version 3.81"
TLOG " ok"

# check that we have tar
TLOGN "checking the tar"
TAR=`acLookFor tar`
if [ -z "$TAR" ]; then
    AC_FAIL "Cannot find tar";
fi
TLOG " - you have some tar program - ok"

# check that we have gunzip
TLOGN "checking the gunzip"
GUNZIP=`acLookFor gunzip`
if [ -z "$GUNZIP" ]; then
    AC_FAIL "Cannot find gunzip";
fi
TLOG " - you have some gunzip program - ok"

# check that we have makeinfo
TLOGN "checking the makeinfo (texinfo)"
MAKEINFO=`acLookFor makeinfo`
if [ -z "$MAKEINFO" ]; then
    AC_FAIL "Cannot find makeinfo (texinfo)";
fi
TLOG " - you have some makeinfo program - ok"

# check that we have install-info
TLOGN "checking the install-info (texinfo)"
INSTALL_INFO=`acLookFor install-info`
if [ -z "$INSTALL_INFO" ]; then
    AC_FAIL "Cannot find install-info (texinfo), this program is usually in /usr/sbin/";
fi
TLOG " - you have some install-info program - ok"

# check that we have patch
TLOGN "checking the patch"
PATCH=`acLookFor patch`
if [ -z "$PATCH" ]; then
    AC_FAIL "Cannot find patch";
fi
TLOG " - you have some patch program - ok"

# check that we have tr
TLOGN "checking for tr"
TR=`acLookFor tr`
if [ -z "$TR" ]; then
    AC_FAIL "Cannot find tr";
fi
TLOG " - you have some tr program - ok"

# assuming the above checks pass, get the path of everything
MF_PATH_INCLUDE	GMAKE make gmake
MF_PATH_INCLUDE WGET wget
MF_PATH_INCLUDE TAR tar gtar
MF_PATH_INCLUDE MAKEINFO makeinfo
MF_PATH_INCLUDE INSTALL_INFO install-info
MF_PATH_INCLUDE GUNZIP gunzip
MF_PATH_INCLUDE PATCH patch
MF_PATH_INCLUDE TR tr 

AC_SUB	DISTRO_TYPE `./scripts/distro.guess`
AC_OUTPUT Makefile mk-conf/config.mk cports.modulefile
