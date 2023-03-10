#!/bin/bash

TARGET_DIR=$1
FFMPEG=`which ffmpeg`

if [ -z "$FFMPEG" ]
then
    sudo apt install ffmpeg
fi

if [ -z "$TARGET_DIR" ]
then
    echo "usage: ./ffmpegRecursive.sh path/to/dir"
fi

IFS=$'\n'; set -f
for f in $(find $TARGET_DIR -name '*.MP4')
do
    echo "------------------------------------------------------------------------------------------------"
    dir=`dirname $f`
    base=`basename $f | awk -F '.' '{print $1}'`
    _new="$dir/_$base.mp4"
    new="$dir/$base.mp4"
    ffmpeg -i $f -q:v 4 $_new && rm $f && mv $_new $new 
    echo "================================================================================================"
done
unset IFS; set +f
