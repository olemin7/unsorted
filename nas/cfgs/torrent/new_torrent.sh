#!/bin/bash
# /mnt/wd40/torrent/config/new_torrent.sh '%D' '%F' '%N'  '%K' '%L'
savedDir=$1
name=$2
title=$3
kind=$4
label=$5
Dest="/mnt/wd40/torrent/new"

echo "$(date):$savedDir:$name:$title:$kind:$label" >> $Dest/log.txt
if [[ "$kind" == "multi" ]]; then
	mkdir "$Dest/$title"
	ln -sfv "$savedDir/"* "$Dest/$title/".
else
	ln -sfv "$savedDir/$title" "$Dest/$title"
fi
