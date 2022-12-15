#!/bin/bash

sflag=
bflag=
aflag=

while getopts ":s:b:a:" flag
do
case $flag in
    s)    sflag=1
          since="$OPTARG";;
    b)    bflag=1
          before="$OPTARG";;
    a)    aflag=1
          author="$OPTARG";;
    ?)   printf 'Usage: %s: [-s <date>] [-b <date>] [-a <value>] args\n' $0
          exit 2;;
    esac
done
shift $((OPTIND -1))

if [ ! -z "$sflag" ]; then
	echo "flag --since $since specified"
fi
if [ ! -z "$bflag" ]; then
	echo "flag --before $before specified"
fi
if [ ! -z "$aflag" ]; then
	echo "flag --author $author specified"
fi


for dir in */; do
	git -C $dir rev-parse 2>/dev/null;
if [[ $? -eq 0 ]]
	then
		cd $dir 
		echo "---------------${dir///}"
		git shortlog -sne ${since:+--since "$since"} ${before:+--before "$before"} ${author:+--author "$author"}
		git log --shortstat ${since:+--since "$since"} ${before:+--before "$before"} ${author:+--author "$author"} | awk '/^ [0-9]|^A/ {
	if($1=="Author:") 
		c += 1;
	else 
		f += $1; 
		i += $4; 
		d += $6 
} END {
	printf("%6d  commits, %d  files changed, %d  insertions(+), %d  deletions(-) \n",c, f, i, d) 
}'
		cd .. 
		echo ""
fi
done
