#
# check that the Fortran compiler works
#
AC_PROG_FC () {
    test "$AC_FC" && return 0

cat > /tmp/ngc$$.f90 << \EOF
program hello
        integer :: i = 0
        do i=1,10
                print *, "hello"
        end do
end program
EOF
### probably don't care about f77, should default to checking for a f90
### compatible or above compiler
##    cat > /tmp/ngc$$.f << \EOF
##      PROGRAM HELLO
##      DO 10, I=1,10
##      PRINT *,'Fortran Suxorz'
##   10 CONTINUE
##      STOP
##      END
##EOF

    TLOGN "checking the Fortran f90 compatible compiler"

    unset AC_FCFLAGS AC_LDFLAGS

    if [ "$FC" ] ; then
	AC_FC="$FC"
    elif [ "$WITH_PATH" ]; then
	AC_FC=`acLookFor f95`
    elif [ "`acLookFor f95`" ]; then
	# don't specify the full path if the user is looking in their $PATH
	# for a Fortran compiler.
	AC_FC=f95
    fi

    if [ ! "$AC_FC" ]; then
	TLOG " (no Fortran f90 compatible compiler found)"
	$__fail 1
    fi
    echo "checking out the Fortran compiler"

    $AC_FC -o /tmp/ngc$$ /tmp/ngc$$.f90
    status=$?

    TLOGN " ($AC_FC)"
    if [ $status -eq 0 ]; then
	TLOG " ok"

	# check that the FCFLAGS and LDFLAGS aren't bogus

	unset AC_FCFLAGS AC_LDFLAGS

	if [ "$FCFLAGS" ]; then
	    test "$FCFLAGS" && echo "validating FCFLAGS=${FCFLAGS}"
	    if $AC_FC $FCFLAGS -o /tmp/ngc$$.o /tmp/ngc$$.f90 ; then
		AC_FCFLAGS=${FCFLAGS:-"-g"}
		test "$FCFLAGS" && echo "FCFLAGS=\"${FCFLAGS}\" are okay"
	    elif [ "$FCFLAGS" ]; then
		echo "ignoring bogus FCFLAGS=\"${FCFLAGS}\""
	    fi
	else
	    AC_FCFLAGS=-g
	fi
	if [ "$LDFLAGS" ]; then
	    test "$LDFLAGS" && echo "validating LDFLAGS=${LDFLAGS}"
	    if $AC_FC $LDFLAGS -o /tmp/ngc$$ /tmp/ngc$$.o; then
		AC_LDFLAGS=${LDFLAGS:-"-g"}
		test "$LDFLAGS" && TLOG "LDFLAGS=\"${LDFLAGS}\" are okay"
	    elif [ "$LDFLAGS" ]; then
		TLOG "ignoring bogus LDFLAGS=\"${LDFLAGS}\""
	    fi
	else
	    AC_LDFLAGS=${FCFLAGS:-"-g"}
	fi
    else
	AC_FAIL " does not compile code properly"
    fi

    AC_SUB 'FC' "$AC_FC"

    rm -f /tmp/ngc$$ /tmp/ngc$$.f90 /tmp/ngc$$.o

    return $status
}

#
# check that the C++ compiler works
#
AC_PROG_CXX () {
    test "$AC_CXX" && return 0

    cat > /tmp/ngc$$.cpp << \EOF
#include <iostream>

int main()
{
  std::cout <<"Hello World\n";
}
EOF

    TLOGN "checking the C compiler"

    unset AC_CFLAGS AC_LDFLAGS

    if [ "$CXX" ] ; then
	AC_CXX="$CXX"
    elif [ "$WITH_PATH" ]; then
	AC_CXX=`acLookFor c++`
    elif [ "`acLookFor c++`" ]; then
	# don't specify the full path if the user is looking in their $PATH
	# for a C++ compiler.
	AC_CXX=c++
    fi

    if [ ! "$AC_CXX" ]; then
	TLOG " (no C++ compiler found)"
	$__fail 1
    fi
    echo "checking out the C++ compiler"

    $AC_CXX -o /tmp/ngc$$ /tmp/ngc$$.cpp
    status=$?

    TLOGN " ($AC_CXX)"
    if [ $status -eq 0 ]; then
	TLOG " ok"

	# check that the CFLAGS and LDFLAGS aren't bogus

	unset AC_CFLAGS AC_LDFLAGS

	if [ "$CFLAGS" ]; then
	    test "$CFLAGS" && echo "validating CFLAGS=${CFLAGS}"
	    if $AC_CXX $CFLAGS -o /tmp/ngc$$.o /tmp/ngc$$.cpp ; then
		AC_CFLAGS=${CFLAGS:-"-g"}
		test "$CFLAGS" && echo "CFLAGS=\"${CFLAGS}\" are okay"
	    elif [ "$CFLAGS" ]; then
		echo "ignoring bogus CFLAGS=\"${CFLAGS}\""
	    fi
	else
	    AC_CFLAGS=-g
	fi
	if [ "$LDFLAGS" ]; then
	    test "$LDFLAGS" && echo "validating LDFLAGS=${LDFLAGS}"
	    if $AC_CXX $LDFLAGS -o /tmp/ngc$$ /tmp/ngc$$.o; then
		AC_LDFLAGS=${LDFLAGS:-"-g"}
		test "$LDFLAGS" && TLOG "LDFLAGS=\"${LDFLAGS}\" are okay"
	    elif [ "$LDFLAGS" ]; then
		TLOG "ignoring bogus LDFLAGS=\"${LDFLAGS}\""
	    fi
	else
	    AC_LDFLAGS=${CFLAGS:-"-g"}
	fi
    else
	AC_FAIL " does not compile code properly"
    fi

    AC_SUB 'CXX' "$AC_CXX"

    rm -f /tmp/ngc$$ /tmp/ngc$$.cpp /tmp/ngc$$.o

    return $status
}
