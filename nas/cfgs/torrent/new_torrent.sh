#!/bin/bash
echo $1
echo $2
echo file name $1/$2
Dest="/mnt/wd40/media/new/"
echo to $Dest$2
ln -s "$1/$2" "$Dest$2"
echo "$(date):$2" >> /mnt/wd40/media/new/log.txt
