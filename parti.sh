#!/bin/bash
clear
opcion=0
while [ $opcion -ne 6 ]; do
	echo "--------------------------------------------------"
	echo "       IDENTIFICAR DISCOS Y PARTICIONES"
	echo "               Por: Alchise 2021"
	echo "--------------------------------------------------"
	echo "1. Info de espacio en discos"
	echo "2. Info de discos y particiones."
	echo "3. Info de dispositivos de bloque"
	echo "4. Info de marcas y modelos de discos"
	echo "5. Info de volumenes físicos y lógicos"
	echo "6. Salir"
	echo "--------------------------------------------------"
	echo -n "Seleccione una opción: " ; read opcion
	echo
	case $opcion in
		1) echo "1. Info de espacio en discos"; df -h ;;
		2) fdisk -l ;;
		3) lsblk -l ;;
		4) parted -l ;;
		5) sfdisk -l ;;
		6) echo "¡Adios!" ; opcion=6 ;;
		*) echo "!Opcion no valida!" ; opcion=0 ;;	
	esac
	echo
	echo -n "Pulse para continuar..." ; read p
	echo
done
