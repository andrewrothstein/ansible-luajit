#!/usr/bin/env bash
set -e
DIR=~/Downloads
MIRROR=http://luajit.org/download

dl_ver() {
    local -r ver=$1
    tgz="LuaJIT-${ver}.tar.gz"
    lfile="${DIR}/${tgz}"
    url="${MIRROR}/${tgz}"

    if [ ! -e $lfile ];
    then
        curl -sSLf -o $lfile $url
    fi

    printf "  # %s\n" $url
    printf "  '%s': sha256:%s\n" $ver $(sha256sum $lfile | awk '{print $1}')
}

dl_ver ${1:-2.0.5}
