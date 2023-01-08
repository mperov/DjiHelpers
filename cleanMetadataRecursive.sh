#!/bin/bash

TARGET_DIR=$1
IDENTIFY=`which identify`

if [ -z "$IDENTIFY" ]
then
    sudo apt install imagemagick
fi

if [ -z "$TARGET_DIR" ]
then
    echo "usage: ./cleanmetada.sh path/to/dir"
fi

IFS=$'\n'; set -f
for f in $(find $TARGET_DIR -name '*.JPG')
do
    mogrify -strip $f
done
unset IFS; set +f
