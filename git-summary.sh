#!/bin/bash

PrintWidth=25
for dir in */; do
    echo -n "--------"
    printf "%5s%${PrintWidth}s%5s" "" "${dir///}" ""
    echo "--------"
    echo ""
    cd $dir 
    git shortlog -sne --since="12 Dec 2021" --before="12 Dec 2022" --author=jiajin 
    git log --shortstat --since="12 Dec 2021" --before="12 Dec 2022" --author=jiajin| awk '/^ [0-9]|^A/ {
    	if($1=="Author:") 
		c += 1;
	else 
		f += $1; 
		i += $4; 
		d += $6 
	} END {
 		printf("%6d  commits, %d  files changed, %d  insertions(+), %d  deletions(-) \n",c, f, i, d) 
	}'
    echo ""
    cd .. 
done
