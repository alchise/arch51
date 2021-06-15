#!/bin/bash
clear
echo "$(tput setaf 6)$(tput bold)"
echo "-------------------------------------------------------"
echo "        Instalador de Archlinux arch51 - UEFI"
echo "                  Por: Alchise 2021"
echo "-------------------------------------------------------"
echo "$(tput setaf 7)$(tput setab 1)$(tput bold)  EL DISCO DEBE TENER TABLA GPT Y UBICADO EN /DEV/SDA  $(tput sgr0)"
echo "======================================================="
echo
echo -n "$(tput setaf 6)$(tput bold)Pulse para continuar...$(tput sgr0)"
read p
echo
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Verificando modo UEFI presente...$(tput sgr0)"	
echo
if [ -d /sys/firmware/efi/efivars ];
then
	echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"	
	echo "El directorio '/sys/firmware/efi/efivars' ¡EXISTE!"
else
	echo -n "$(tput setaf 10)$(tput bold)[Error] $(tput sgr0)"	
	echo "La directorio '/sys/firmware/efi/efivars' ¡NO EXISTE!"
	echo -n "$(tput setaf 6)$(tput bold)Pulse para salir...$(tput sgr0)"
	read p
	exit
fi
path=$(ls -A '/sys/firmware/efi/efivars') 
if [[ ! -z "$path" ]]; 
then 
	echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"	
	echo "El directorio '/sys/firmware/efi/efivars'¡NO ESTA VACIO, UEFI PRESENTE!" 
else 
	echo -n "$(tput setaf 10)$(tput bold)[Error] $(tput sgr0)"	
	echo "El directorio '/sys/firmware/efi/efivars' ¡ESTA VACIO, UEFI NO PRESENTE!"
	echo -n "$(tput setaf 6)$(tput bold)Pulse para salir...$(tput sgr0)"
	read p	
	exit
fi
echo
opcteclado=0 
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Distribucion de teclado temporal...$(tput sgr0)"	
echo "-----------------------------------------"
echo "1. Español - España - 'es'        - ()=?¿"
echo "2. Español - Latino - 'la-latin1' - ()=?¡"
echo "3. Inglés  - EEUU   - 'us'        - ()-+" 
echo "-----------------------------------------"
echo
while [[ $opcteclado < 1 ]] || [[ $opcteclado > 3 ]]; do
	echo -n "$(tput setaf 6)$(tput bold)Seleccione una opción:$(tput sgr0)"
	read opcteclado
done
echo
case $opcteclado in
	1) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
	   echo "Ha seleccionado la distribución de teclado temporal 'es'" 
	   loadkeys es ;;
	2) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
	   echo "Ha seleccionado la distribución de teclado temporal 'la-latin1'" 
	   loadkeys la-latin1 ;;
	3) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"
	   echo "Ha seleccionado la distribución de teclado temporal 'us'" 
	   loadkeys us ;;
esac
echo
echo -n "$(tput setaf 6)$(tput bold)Pulse para continuar...$(tput sgr0)"
read p
echo
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Verificando conexión a internet...$(tput sgr0)"
echo 
opcinternet="s"
while [[ "$opcinternet" == "s" ]] || [[ "$opcinternet" == "S" ]]; do
	ping -c 5 www.google.com
	echo
	echo -n "$(tput setaf 6)$(tput bold)Digite 'S' para otra prueba de conexion o pulse para continuar:$(tput sgr0)"
	read opcinternet
	echo
done
echo
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Actualizando el reloj del sistema...$(tput sgr0)"
echo
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "timedatectl set-ntp true"
timedatectl set-ntp true
echo

# >>PROCESO POR AUTOMATIZAR<<
# Identificar discos:
# 	Lsblk
# Crear una nueva tabla de particiones GPT en /dev/sda:
# 	gdisk /dev/sda
# 	w (Para escribir los cambios)
# 	Y (Para aceptar los cambios)
# Verificar nuevamente:
# 	gdisk /dev/sda
# Particionado del disco:
# 	cfdisk /dev/sda
# 		/boot /dev/sda1
# 		swap  /dev/sda2
# 		/ 	/dev/sda3
# Verificar Particiones:
# 	fdisk -l
# >>PROCESO POR AUTOMATIZAR<<

echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Formateando Particiones...$(tput sgr0)"
echo
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mkfs.vfat -F32 /dev/sda1"
mkfs.vfat -F32 /dev/sda1
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mkswap /dev/sda2"
mkswap /dev/sda2 
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "swapon /dev/sda2"
swapon /dev/sda2
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mkfs.ext4 /dev/sda3"
mkfs.ext4 /dev/sda3
echo
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Verificando activación de swap...$(tput sgr0)"
echo
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "free"
free
echo
echo "$(tput setaf 0)$(tput setab 7)$(tput bold)Montando Particiones...$(tput sgr0)"
echo
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mount /dev/sda3 /mnt"
mount /dev/sda3 /mnt
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "ls /mnt"
ls /mnt 
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mkdir -p /mnt/boot/efi"
mkdir -p /mnt/boot/efi
echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
echo "mount /dev/sda1 /mnt/boot/efi"
mount /dev/sda1 /mnt/boot/efi

	


