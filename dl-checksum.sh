#!/usr/bin/env sh
DIR=~/Downloads
MIRROR=https://github.com/cyberark/secretless-broker/releases/download

dl()
{
    local ver=$1
    local lshafile=$2
    local os=$3
    local arch=$4
    local archive_type=${5:-tar.gz}
    local platform="${os}_${arch}"
    local file=secretless-broker_${ver}_${platform}.${archive_type}
    local url=$MIRROR/v${ver}/$file

    printf "    # %s\n" $url
    printf "    %s: sha256:%s\n" $platform `grep $file $lshafile | awk '{print $1}'`
}

dl_ver() {
    local ver=$1
    # https://github.com/cyberark/secretless-broker/releases/download/v1.1.0/SHA256SUMS.txt
    local lshafile=$DIR/secretless-broker-${ver}-SHA256SUMS.txt

    if [ ! -e $lshafile ];
    then
        wget -q -O $lshafile $MIRROR/v$ver/SHA256SUMS.txt
    fi

    printf "  '%s':\n" $ver
    dl $ver $lshafile linux amd64
    dl $ver $lshafile darwin amd64
}



dl_ver ${1:-1.6.0}
