#!/bin/bash
#873338, Mateo Lorente, Diego, M, 3, B
#873338, Martinez Gimenez, Carlos Tristan, M, 3, B

direct_user=$(pwd)
primer_bin=0
cd /home/$USER
for val in *
do
	case $val in
		bin[0-9a-zA-Z][0-9a-zA-Z][0-9a-zA-Z] )
			if test -d $val; then
				if test $primer_bin -eq 0; then
					directorio_destino=/home/$USER/$val
					primer_bin=1
				elif test $(stat -c %Y $val) -lt $(stat -c %Y $directorio_destino);then
				directorio_destino=/home/$USER/$val
				fi
			fi
			;;
		* )
			;;
	esac
done
if test $primer_bin -eq 0; then
	directorio_destino=$(mktemp -d /home/$USER/binXXX)
	echo Se ha creado el directorio $directorio_destino
fi
echo Directorio destino de copia: $directorio_destino
cd $direct_user
num_fich=0
for fich in *
do
	if test -f "$fich" -a -x "$fich"; then
		cp "$fich" $directorio_destino
		echo ./"$fich" ha sido copiado a $directorio_destino
		num_fich=$(($num_fich+1))
	fi
done
if test $num_fich -gt 0; then
	echo Se han copiado $num_fich archivos
else
	echo No se ha copiado ningun archivo
fi
