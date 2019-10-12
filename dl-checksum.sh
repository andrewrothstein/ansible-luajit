#!/usr/bin/env sh
VER=${1:-2.0.5}
DIR=~/Downloads
TGZ=LuaJIT-${VER}.tar.gz
LFILE=$DIR/$TGZ
URL=http://luajit.org/download/$TGZ

if [ ! -e $LFILE ];
then
    wget -q -O $LFILE $URL
fi

printf "  # %s\n" $URL
printf "  '%s': sha256:%s\n" $VER $(sha256sum $LFILE | awk '{print $1}')
