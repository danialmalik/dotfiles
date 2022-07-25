#!/bin/bash
set -e

delete_thumbnail () {

    $(zenity --info --title "Note" --text \
        "Right now, the logic to \
        find the correct hashed \
        name for a file in ~/.cached/thumbnails/*/ \
        is not correct. So will delete the whole thumbnails \
        folder.!!");

    rm -rf ~/.cache/thumbnails/*


    # Area that needs to be fixed.
    filename=$1
    if [[ $filename != /* ]]
    then
        filename="$PWD/$filename"
    fi

    MD5=$(echo "file://$filename" | md5sum)
    DELETE_PATH=$HOME/.cache/thumbnails/*/${MD5%% *}.png
    rm -f $DELETE_PATH
}

delete_thumbnail $@
