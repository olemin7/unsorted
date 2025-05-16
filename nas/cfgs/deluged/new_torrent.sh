#!/bin/bash
# /home/olemin/repo/unsorted/nas/cfgs/deluged/new_torrent.sh
#https://deluge-torrent.org/plugins/execute/
torrentid=$1
torrentname=$2
torrentpath=$3

NewFolder="/mnt/wd40/torrent/new"
FileName=$torrentpath/$torrentname
echo "$(date)":"$FileName" >> $NewFolder/log.txt

echo "$FileName"
if [[ -a "$FileName" ]]; then
    echo "a"
fi

if [[ -d $FileName ]]; then
    echo "$FileName is a directory"
   	mkdir "$NewFolder/$torrentname"
	ln -sfv "$FileName/"* "$NewFolder/$torrentname/".
elif [[ -f $FileName ]]; then
    echo "$FileName is a file"
    ln -sfv "$FileName" "$NewFolder/$title"
else
    echo "$FileName is not valid"
fi

