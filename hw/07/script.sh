#!/bin/bash

# List of surnames
names=("Šembera" "Boháč" "Fabinger" "Havlas" "Jelínek" "Konrád" "Pokorný" "Řezníček" "Schmidt" "Vavřina" "Brodský" "Certin" "Herrmann" "Jícha" "Jirásek" "Ledvinka" "Lustig" "Musil" "Novák" "Novotný" "Postránecký" "Přibyslavský" "Říhánek" "Šulc" "Veselý" "Záhorský" "Baberkov" "Beneš" "Bláha" "Cenčić" "Diviš" "Dudek" "Ehrlich" "Fontán" "Grunt" "Hambálek" "Hartl" "Hassdenteufel" "Hauf" "Havlíček" "Houser" "Kabelík" "Karásek" "Karl" "Karlovský" "Kindl" "Kořínek" "Kraus" "Kulda" "Majcen" "Marván" "Rozsypal" "Sáblík" "Schier" "Schulz" "Schworm" "Smíšek" "Stjepanek" "Suchánek" "Svoboda" "Šícha" "Urbánek" "Vančura" "Vochoč")

# names=("emil" "franta")

# Function to remove diacritics
remove_diacritics() {
    echo "$1" | iconv -f utf-8 -t ascii//TRANSLIT
}

len=${#names[@]}

for ((i = 0; i < $len; i++)); do
	for ((j = 0; j < $len; j++)); do
		if [ $i -ne $j ]; then
			surname1=$(remove_diacritics "${names[i]}")
			surname2=$(remove_diacritics "${names[j]}")
			echo "$surname1 $surname2"
		fi
	done
done
