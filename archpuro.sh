#!/bin/bash
#-------------------------Contenido-------------------------------
    # 1. Bienvenida
    # 2. Verificar arquitectura del procesador
    # 3. Verificar modo UEFI presente...
    # 4. Configurar distribución de teclado temporal
    # 5. Crear particiones de nuestro disco
    # 6. Dar formato a las particiones creadas
    # 7. Montado de particiones
    # 8. Conexión a internet
    # 9. Instalación del sistema base
    # 10. Entrar al sistema base
    # 11. Configuración del sistema base
    # 12. Desmontado de particiones y reinicio de sistema
    # 13. Configuraciones del sistema - ¿Users y Root?
    # 14. Instalación de complementos gráficos base
    # 15. Instalación de entornos de escritorios (D.E.)
    # 16. Instalación de Gestores de inicio de sesión (D.M.)
	# 17. Reinicio
#---------------------------------------------------------------------
# 1. Bienvenida...
clear
result=$(echo "\nGracias por usar el instalador archpuro.\n\nTe ofrezco un método por script para que instales paso a paso tu distro favorita totalmente limpia.")
dialog 	--title "Archlinux limpio y Puro" \
    	--backtitle "1. Bienvenido al instalador de Archpuro - Por Alchise 2021" \
    	--no-collapse \
        --msgbox "$result" 0 0
          
# 2. Verificar arquitectura del procesador...
clear
result=$(uname -m)
if [ "$result" = "x86_64" ];
then
        dialog 	--title "La arquitectura de tu procesador ES LA CORRECTA para el instalador:" \
    	--backtitle "2. Verificando la arquitectura del procesador..." \
    	--no-collapse \
    	--msgbox "\n$result" 0 0
else
        dialog 	--title "La arquitectura de tu procesador NO ES LA CORRECTA para el instalador:" \
    	--backtitle "2. Verificando la arquitectura del procesador..." \
    	--no-collapse \
    	--msgbox "\n$result" 0 0
        exit
fi

# 3. Configurando la distribución de teclado temporal...
HEIGHT=30
WIDTH=50
CHOICE_HEIGHT=10
BACKTITLE="Backtitle here"
TITLE="Title here"
MENU="Choose one of the following options:"

OPTIONS=(1 "es     - español - españa"
         2 "latam  - español - latino"
         3 "us     - inglés  - ????"
         4 "us     - inglés  - acentos")

CHOICE=$(dialog --clear \
                --backtitle "$BACKTITLE" \
                --title "$TITLE" \
                --menu "$MENU" \
                $HEIGHT $WIDTH $CHOICE_HEIGHT \
                "${OPTIONS[@]}" \
                2>&1 >/dev/tty)

clear
case $CHOICE in
        1)
            echo "You chose Option 1"
            ;;
        2)
            echo "You chose Option 2"
            ;;
        3)
            echo "You chose Option 3"
            ;;
esac

# dialog --checklist "Escoge las opciones que desees:" 0 0 0  1 "queso" on 2 "Mostaza" on  3 "anchoas" off
# dialog --infobox "Espera 4 segundos" 0 0 ; sleep 4
# dialog --title "nombre" --inputbox "Pon tu nombre:" 0 0
# dialog --menu "La mejor tortilla es:" 0 0 0 1 "con cebolla" 2 "sin cebolla" 3 "con piminetos" 
# dialog --radiolist "Escoge tu tortilla favorita:" 0 0 0 1 "Con cebolla" off  2 "Sin cebolla" on 3 "De pimientos" off 4 "De esparragos" off

# opcion1=0
# txtmenu="$(tput setaf 6)$(tput bold)Pulse para regresar al menú...$(tput sgr0)"
# echo "$(tput setaf 6)$(tput bold)"
# echo "-------------------------------------------------------"
# echo "        Instalador de Archlinux arch51 - UEFI"    
# echo "                  Por: Alchise 2021"
# echo "-------------------------------------------------------"
# echo "$(tput setaf 7)$(tput setab 1)$(tput bold)  EL DISCO DEBE TENER TABLA GPT Y UBICADO EN /DEV/SDA  $(tput sgr0)"
# echo
# echo -n "$(tput setaf 6)$(tput bold)Pulse para continuar...$(tput sgr0)"
# read p


# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Verificando la arquitectura del procesador...$(tput sgr0)"
# echo
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo -n "Arquitectura: "$(tput bold)
# uname -m	
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Verificando modo UEFI presente...$(tput sgr0)"	
# echo
# if [ -d /sys/firmware/efi/efivars ];
# then
# 	echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"	
# 	echo "El directorio '/sys/firmware/efi/efivars' $(tput bold)¡EXISTE!"
# else
# 	echo -n "$(tput setaf 10)$(tput bold)[Error] $(tput sgr0)"	
# 	echo "La directorio '/sys/firmware/efi/efivars' ¡NO EXISTE!"
# 	echo -n "$(tput setaf 6)$(tput bold)Pulse para salir...$(tput sgr0)"
# 	read p
# 	exit
# fi
# path=$(ls -A '/sys/firmware/efi/efivars') 
# if [[ ! -z "$path" ]]; 
# then 
# 	echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"	
# 	echo "El directorio '/sys/firmware/efi/efivars'$(tput bold)¡NO ESTA VACIO, UEFI PRESENTE!" 
# else 
# 	echo -n "$(tput setaf 10)$(tput bold)[Error] $(tput sgr0)"	
# 	echo "El directorio '/sys/firmware/efi/efivars' $(tput bold)¡ESTA VACIO, UEFI NO PRESENTE!"
# 	echo -n "$(tput setaf 6)$(tput bold)Pulse para salir...$(tput sgr0)"
# 	read p	
# 	exit
# fi
# echo
# opcteclado=0 
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Distribucion de teclado temporal...      $(tput sgr0)"	
# echo "-----------------------------------------"
# echo "1. Español - España - es"
# echo "2. Español - Latino - la-latin1"
# echo "3. Inglés  - EEUU   - us" 
# echo "-----------------------------------------"
# echo
# while [[ $opcteclado < 1 ]] || [[ $opcteclado > 3 ]]; do
# 	echo -n "$(tput setaf 6)$(tput bold)Seleccione una opción:$(tput sgr0)"
# 	read opcteclado
# done
# echo
# case $opcteclado in
# 	1) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# 	   echo "Ha seleccionado la distribución de teclado temporal 'es'" 
# 	   loadkeys es ;;
# 	2) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# 	   echo "Ha seleccionado la distribución de teclado temporal 'la-latin1'" 
# 	   loadkeys la-latin1 ;;
# 	3) echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)"
# 	   echo "Ha seleccionado la distribución de teclado temporal 'us'" 
# 	   loadkeys us ;;
# 	*)  
# esac
# echo
# echo -n "$(tput setaf 6)$(tput bold)Pulse para continuar...$(tput sgr0)"
# read p
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Verificando conexión a internet...$(tput sgr0)"
# echo 
# opcinternet="s"
# while [[ "$opcinternet" == "s" ]] || [[ "$opcinternet" == "S" ]]; do
# 	ping -c 5 www.google.com
# 	echo
# 	echo -n "$(tput setaf 6)$(tput bold)Digite 'S' para otra prueba de conexion o pulse para continuar:$(tput sgr0)"
# 	read opcinternet
# 	echo
# done
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Actualizando el reloj del sistema...$(tput sgr0)"
# echo
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "timedatectl set-ntp true"
# #timedatectl set-ntp true
# echo

# # >>PROCESO POR AUTOMATIZAR<<
# # Identificar discos:
# # 	Lsblk
# # Crear una nueva tabla de particiones GPT en /dev/sda:
# # 	gdisk /dev/sda
# # 	w (Para escribir los cambios)
# # 	Y (Para aceptar los cambios)
# # Verificar nuevamente:
# # 	gdisk /dev/sda
# # Particionado del disco:
# # 	cfdisk /dev/sda
# # 		/boot /dev/sda1
# # 		swap  /dev/sda2
# # 		/     /dev/sda3
# # Verificar Particiones:
# # 	fdisk -l
# # >>PROCESO POR AUTOMATIZAR<<

# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Formateando Particiones...$(tput sgr0)"
# echo
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mkfs.vfat -F32 /dev/sda1"
# #mkfs.vfat -F32 /dev/sda1
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mkswap /dev/sda2"
# #mkswap /dev/sda2 
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "swapon /dev/sda2"
# #swapon /dev/sda2
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mkfs.ext4 /dev/sda3"
# #mkfs.ext4 /dev/sda3
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Verificando activación de swap...$(tput sgr0)"
# echo
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "free"
# free
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Montando Particiones...$(tput sgr0)"
# echo
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mount /dev/sda3 /mnt"
# #mount /dev/sda3 /mnt
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "ls /mnt"
# #ls /mnt 
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mkdir -p /mnt/boot/efi"
# #mkdir -p /mnt/boot/efi
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "mount /dev/sda1 /mnt/boot/efi"
# #mount /dev/sda1 /mnt/boot/efi
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Instalar Archlinux y paquetes necesarios...$(tput sgr0)"
# echo
# #pacman -Syy
# #pacstrap /mnt base base-devel linux linux-firmware efibootmgr os-prober ntfs-3g networkmanager network-manager-applet pavucontrol grub dosfstools mtools gvfs gvfs-afc gvfs-mtp xdg-user-dirs nano vim dhcpcd xterm --verbose
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "Sstema base y paquetes necesarios instalados con exito"
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Generar fstab...$(tput sgr0)"
# echo
# #genfstab -U /mnt » /mnt/etc/fstab 
# #cat /mnt/etc/fstab
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "'/mnt/etc/fstab' generado con exito"
# echo
# echo "$(tput setaf 7)$(tput setab 4)$(tput bold)Entrar al sistema base...$(tput sgr0)"
# echo
# #arch-chroot /mnt
# echo -n "$(tput setaf 10)$(tput bold)[ok] $(tput sgr0)" 
# echo "Ingreso al sistema base con exito"
# echo

	


