#!/bin/bash

export LANGUAGE=C
export LC_ALL=C
export LANG=en_US.utf8

HERE=$PWD

source ./variables

cd $PACKAGE
rm -f debian/changelog
dch -v $VERSION -M -u low -D unstable --create --empty --package $PACKAGE --no-force-save-on-release "See $ORIGIN"
debuild -e ARCH -uc -us -B -a$TARGET

cd $HERE

