#!/bin/bash

echo "*******************************"
echo "Instalador de Archlinux arch51"
echo "     Por: Alchise 2021"
echo "*******************************"

opcion=0

while [ $opcion -ne 6 ]; do
	echo "************************************************"
	echo "1. Configurar teclado temporalmente 'es'"
	echo "2. Verificar modo UEFI"
	echo "3. Actualizar el reloj del sistema"
	echo "4. Identificar discos"
	echo "5. Crear tabla de particiones GPT en '/dev/sda'"
	echo "6. Salir"
	echo "************************************************"
	echo Selecciona una opcion:
	read opcion

	case $opcion in
		1) loadkeys es ;;
		2) ls /sys/firmware/efi/efivars ;;
		3) timedatectl set-ntp true ;;
		4) lsblk ;;
		5) gdisk /dev/sda ;;
		6) echo "¡Adios!" ;;
		*) echo Opcion no valida
		   opcion=0 ;;	
	esac
	echo Pulsa para continuar ....
	read p
done
