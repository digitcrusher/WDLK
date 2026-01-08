#!/usr/bin/env bash

path_to_inbox="inbox" 
path_to_output=${2:-"classified"}

mkdir -p "$path_to_output"

for file in "$path_to_inbox"/*; do

	[ -e "$file" ] || continue

	category=$(grep -i "^CATEGORY:" "$file" | cut -d':' -f2 | tr -d '[:space:]')
	
	if [[ -z "$category"  ]]; then
		category="unknown"
	fi
	mkdir -p "$path_to_output/$category"
	mv "$file" "$path_to_output/$category"/
	echo "Plik $file został przeniesiony do katalogu $path_to_output/$category"
done
