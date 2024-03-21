#!/bin/bash
#871314, Martínez Giménez, Carlos Tristán, M, 3, B
#873338, Mateo Lorente, Diego, M, 3, B

OLDIFS="$IFS"
if [ "$#" -eq 2 ]
then
	if [ "$EUID" -ne 0 ]
	then
		echo "Este script necesita privilegios de administracion"
		exit 1
	else
		if [ "$1" = "-a" ]
		then
			IFS=,
			cat "$2" | while read logname passwd nombre resto
			do
				if [ ! "$logname" -o ! "$passwd" -o ! "$nombre" ]
				then
					echo "Campo invalido" 1>&2
					exit 1
				elif [ $(cat /etc/passwd | grep "$logname:" | wc -l) -ne 0 ]
				then
					echo "El usuario $(cat /etc/passwd | grep "$logname:" | cut -d':' -f1) ya existe"
				else
					useradd -m -k /etc/skel -U -c "$nombre" -K PASS_MAX_DAYS=30 -K UID_MIN=1815 "$logname"
					echo "$logname:$passwd" | chpasswd
					usermod -U "$logname"
					echo "$nombre ha sido creado"
				fi
			done
			IFS=$OLDIFS

		elif [ "$1" = "-s" ]
		then
			if [ ! -d "/extra" ]
			then
				mkdir /extra/
			fi
			if [ ! -d "/extra/backup" ]
			then
				mkdir /extra/backup
			fi
			IFS=,
			cat "$2" | while read logname resto
			do
				if [ ! "$logname" ]
				then
					echo "Campo invalido" 1>&2
					exit 1

				elif [ $(cat /etc/passwd | grep "$logname:" | wc -l) -ne 0 ]
				then
					if tar cfP "/extra/backup/$logname.tar" "$(cat /etc/passwd | grep "$logname:" | cut -d':' -f6)"
					then
						userdel -r "$logname" 2>/dev/null
					fi
				fi
			done
			IFS=$OLDIFS
		else
			echo "Opcion invalida" 1>&2
			exit 1
		fi
	fi
else
	echo "Numero incorrecto de parametros" 1>&2
	exit 1
fi
