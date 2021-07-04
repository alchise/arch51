#!/bin/bash
# Particionado automatico estandar /boot/efi /swap /raiz
# INICIO - SELECCIONAR DISCO DONDE SE VA INSTALAR ARCHLINUX
opcion=0
while [ $opcion -ne 5 ]; do
	clear
	echo
	echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Seleccione la unidad donde desea instalar Archlinux...$(tput sgr0)"
	echo
	lsblk
	echo "-------------------------------------------------------"
	echo "1. /dev/sda"
	echo "2. /dev/sdb"
	echo "3. /dev/sdc"
	echo "4. /dev/sdd"
	echo "-------------------------------------------------------"
	echo -n "Seleccione la unidad donde desea instalar Archlinux: " ; read opcion
	echo
	udd="sdx"
	case $opcion in
		1) udd="/dev/sda";;
		2) udd="/dev/sdb" ;;	
		3) udd="/dev/sdc" ;;	
		4) udd="/dev/sdd" ;;	
		*) echo -n "¡Seleccione una opción válida!...[ ENTER ]" ; read p ; opcion=0 ;;
	esac
	if [ $opcion != 0 ];
	then
		echo -n "¿Está seguro de utilizar la unidad '"; echo -n $udd; echo -n "' para la instalación?...[s/n]: " 
		read sino
		if [ "$sino" == "s" ] || [ "$sino" == "S" ];
		then 
			echo
			echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"
			echo -n "¡Ha confirmado la unidad '"; echo -n $udd ; echo "'!"
			opcion=5
			echo
		else
			if [ "$sino" == "n" ] || [ "$sino" == "N" ];
			then 
				echo
				echo -n "¡No Ha confirmado una unidad!...[ ENTER ]"
				read p
				opcion=0
				echo
			else
				echo
				echo -n "¡Digite una opcion correcta!...[ ENTER ]"
				read p
				opcion=0
				echo
			fi
		fi
	else
		echo
	fi
done
echo -n "Pulse ENTER para continuar..."
read p
# FIN - SELECCIONAR DISCO DONDE SE VA INSTALAR ARCHLINUX
