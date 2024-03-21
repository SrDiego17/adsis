#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#871314, Martinez Gimenez, Carlos Tristan, M, 3, B

echo -n "Introduzca una tecla: "
read caracter
caracter=${caracter:0:1}
case "$caracter" in
	[0-9] )
		echo "$caracter es un numero" ;;
	[a-zA-Z] )
		echo "$caracter es una letra" ;;
	* )
		echo "$caracter es un caracter especial" ;;
esac
