if [ ! -x /usr/bin/cmus-remote ];
then
echo "cmus is not installed."
exit
fi

ARTIST=$( cmus-remote -Q 2>/dev/null | grep artist | cut -d " " -f 3- | tail -n 1 )
TITLE=$( cmus-remote -Q 2>/dev/null | grep title | cut -d " " -f 3- )
SONG=$(cmus-remote -Q 2>/dev/null | grep file | cut -d "/" -f 5- | tail -n 1)

STRLEN=${#SONG}

if [ -z "$SONG" ];
then
echo "null"
else
	if [[ $STRLEN > 65 ]];then
		echo "♩ ♪ ♫"
	else
		echo "$SONG"
	fi
fi
