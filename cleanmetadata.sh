#!/bin/bash

FILE=$1
IDENTIFY=`which identify`

if [ -z "$IDENTIFY" ]
then
    sudo apt install imagemagick
fi

if [ -z "$FILE" ]
then
    echo "usage: ./cleanmetada.sh filename"
fi

mogrify -strip $FILE
