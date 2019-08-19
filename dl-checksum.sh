#!/usr/bin/env sh
VER=1.1.0
DIR=~/Downloads
MIRROR=https://github.com/cyberark/secretless-broker/releases/download/v${VER}

# https://github.com/cyberark/secretless-broker/releases/download/v1.1.0/SHA256SUMS.txt
RSHAFILE=SHA256SUMS.txt
LSHAFILE=$DIR/secretless-broker-${VER}-SHA256SUMS.txt

if [ ! -e $LSHAFILE ];
then
    wget -q -O $LSHAFILE $MIRROR/$RSHAFILE
fi

dl()
{
    OS=$1
    ARCH=$2
    ARCHIVETYPE=$3
    PLATFORM=${OS}_${ARCH}
    FILE=secretless-broker_${VER}_${PLATFORM}.${ARCHIVETYPE}
    URL=$MIRROR/$FILE

    printf "    # %s\n" $URL
    printf "    %s: sha256:%s\n" $PLATFORM `grep $FILE $LSHAFILE | awk '{print $1}'`
}

printf "  '%s':\n" $VER
dl linux amd64 tar.gz



