#!/bin/bash

echo "-------------------------------------------------------"
echo "      Instalador de Archlinux arch51 - UEFI"
echo "               Por: Alchise 2021"
echo "-------------------------------------------------------"
echo "¡EL DISCO DEBE TENER TABLA GPT Y UBICADO EN /DEV/SDA!"
echo "-------------------------------------------------------"

opcteclado=0

while [ $opcteclado -ne 4 ]; do

	echo "Seleccione la distribucion de teclado:"	
	echo "************************************************"
	echo "1. Español - España - 'es'        - ()=?¿"
	echo "2. Español - Latino - 'la-latin1' - ()=?¡"
	echo "3. Inglés  - EEUU   - 'us'        - ()-+" 
	echo "4. Salir"
	echo "************************************************"
	echo "Selecciona una opcion:"

	read opcteclado

	case $opcteclado in
		1) loadkeys es ;;
		2) loadkeys la-latin1 ;;
		3) loadkeys us ;;   
		4) echo "Ok"  ;;                                                                     
		*) echo "Opcion no valida"
		   opcteclado=0;;	
	esac

	echo "Pulsa para continuar ...."

	read p
done

