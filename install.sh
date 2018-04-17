#!/bin/sh

OPTIONS=''
PREFIX=/usr
CATALOGS=1
USAGE='install.sh [-v] [-n] [-p prefix]'

while [ $# -ge 1 ]; do
        case $1 in
        -v)     OPTIONS="$OPTIONS $1" ;;
        -n)     CATALOGS=0 ;;
        -prefix)    PREFIX=`echo $1 | cut -c3-`;;
        -p)     shift;  PREFIX=$1 ;;
        -*)     echo $USAGE; exit 1 ;;
        *)      disks=$*;       break   ;;
        esac

        shift
done

XML_DIR=$PREFIX/share/xml
RNG_DIR=$XML_DIR/mathml/schema/rng/3.0

install $OPTIONS -m 755 -d $RNG_DIR
install $OPTIONS -m 644 schema/*.rng $RNG_DIR

