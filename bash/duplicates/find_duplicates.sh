#!/usr/bin/env bash

if [[ $# -ne 1  ]]; then
	echo "Zła ilość argumentów, musisz podać jeden katalog"
	exit 1
fi

path="$1"

if [[ ! -d "$path" ]]; then
	echo "W argumencie musisz podać nazwę katalogu"
	exit 1
fi

declare -A checksum_dict

for file in "$path"/*; do

	[[ -f "$file" ]] || continue

	checksum=$(sha256sum "$file" | cut -d ' ' -f1)

	if [[ -n "${checksum_dict[$checksum,0]}" ]]; then
		echo "Znaleziono duplikat: "
		echo "Oryginał: ${checksum_dict[$checksum,0]}"
		echo "Duplikat: $file"
		while true; do
			read -p "Czy usunąć plik? [t/N] " odpowiedz
			case $odpowiedz in
				[tT]   ) rm "$file"; break ;;
				[nN]|"") break
			esac
		done
		declare -i n=checksum_dict[#$checksum]
		checksum_dict[$checksum,$n]=$file
		n+=1
		checksum_dict[#$checksum]=$n
	else
		checksum_dict[$checksum,0]=$file
		checksum_dict[#$checksum]=1
	fi
done

for checksum in "${!checksum_dict[@]}"; do
	[[ $checksum = \#* ]] || continue
	n=checksum_dict[$checksum]
	[[ $n -gt 1 ]] || continue
	checksum=${checksum#"#"}

	echo "$checksum:"
	for ((i = 0; i < $n; i++)); do
		echo $'\t'"${checksum_dict[$checksum,$i]}"
	done
done
