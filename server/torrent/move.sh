#!/bin/bash
CARTOON="/mnt/cartoon"
BEST="/mnt/best"

function help
{
echo "usage"
echo " <file> <dest>"
echo "-c <file> to carton folder"
echo "file-simlink on file to move"
}

VERBOUSE=0
function show_var
{
	if [ $VERBOUSE == 1 ];then
		echo "$1=" ${!1}
	fi
}

function move_files
{
SIMLINK=$1
DEST=$2$1

REALFILE=$(readlink "$SIMLINK")
show_var SIMLINK
show_var REALFILE
show_var DEST

if [ $REALFILE == $(realpath "$2")"/"$1 ];then
    echo "SIMLINK and DEST are the same. There is nothing to do."
    exit
fi


if [ ! -e "$SIMLINK" ]; then
	if [ -L "$SIMLINK" ]; then
	    echo "File '$SIMLINK' brocken simulink"
	else
	    echo "File '$SIMLINK' not found!"
	fi
	exit
fi
if [ ! -L "$SIMLINK" ]; then
	echo "File '$SIMLINK' is not simlink"	
	exit
fi





if [ -z "$REALFILE" ]
then
    echo "'$SIMLINK' is empty"
    exit
fi


if [ -L "$REALFILE" ]; then
    echo "File '$REALFILE' is simulink, real file expected"
    exit   
fi



#----------------------------------------------
if [ -n $(mv "$REALFILE" "$DEST")]; then
	echo "OK"
else 
	echo "ERROR" 
	exit
fi
REALDEST=$(realpath "$DEST")
show_var REALDEST
ln -sf "$REALDEST" "$REALFILE"
ln -sf "$REALDEST" "$SIMLINK"
ls -la "$SIMLINK"
echo "done"
}

while [ "$1" != "" ]; do
    case $1 in
	-v | --verbouse )	VERBOUSE=1
				;;
        -b | --best )        	move_files "$1" "$BEST"
				exit
                                ;;
        -c | --cartoon )        move_files "$1" "$CARTOON"
				exit
                                ;;
        -h | --help )           help
                                exit
                                ;;
        * )                     move_files "$1" "$2"
                                exit 
    esac
    shift
done
help
