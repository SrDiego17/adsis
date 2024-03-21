#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#871314, Martínez Giménez, Carlos Tristán, M, 3, B

echo -n "Introduzca el nombre del fichero: "
read fich
if [ ! -f "$fich" ]
then
	echo "$fich" no existe
else
	if [ -r "$fich" ]
	then
		r='r'
	else
		r='-'
	fi
	if [ -w "$fich" ]
	then
		w='w'
	else 
		w='-'
	fi
	if [ -x "$fich" ]
	then	
		x='x'
	else
		x='-'
	fi
	echo "Los permisos del archivo "$fich" son: "$r$w$x
fi
