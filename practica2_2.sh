#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#871314, Martinez Gimenez, Carlos Tristan, M, 3, B

for fich in "$@"
do
	if test -f "$fich"
	then
		more -e "$fich"
	else
		echo "$fich" no es un fichero
	fi
done
