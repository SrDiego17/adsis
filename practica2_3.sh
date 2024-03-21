#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#871314, Martinez Gimenez, Carlos Tristan, M, 3, B

if [ $# -ne 1 ]
then
	echo "Sintaxis: practica2_3.sh <nombre_archivo>"
else
	if [ -f "$1" ]
	then
		chmod u+x "$1"
		chmod g+x "$1"
		stat -c %A "$1"
	else
		echo "$1 no existe"
	fi
fi
