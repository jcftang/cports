#!/bin/bash

#
# a very very simple and quick hack to generate new modules
#

NAME=$(echo $1 | awk -F"-" '{print $1}')
mkdir -p $1/$2

cat > $1/$2/Makefile << EOF
include ../../../../../mk/gnu.pre.mk

DISTNAME=       $1
VERSION=        $2

CPAN_CATEGORY=  $NAME

include ../../../../../mk/prg.perlmod.mk

include ../../../../../mk/gnu.post.mk
EOF
