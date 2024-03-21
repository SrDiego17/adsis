#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#871314, Martinez Gimenez, Carlos Tristan, M, 3, B

echo -n "Introduzca el nombre de un directorio: "
read directorio
if test -d "$directorio"
then
	n_directorios=0
	n_ficheros=0
	cd "$directorio"
	for val in *; do
		if test -d "$val"
		then
			n_directorios=$(($n_directorios+1))
		elif test -f "$val"; then
			n_ficheros=$(($n_ficheros+1))
		fi
	done
	echo El numero de ficheros y directorios en "$directorio" es de "$n_ficheros" y "$n_directorios", respectivamente

else
	echo "$directorio" no es un directorio
fi 
