#!/bin/bash
# udd="sdx"
# opcion=0
# while [ $opcion -ne 1 ]; do
# cmd=(dialog --keep-tite --no-collapse --cr-wrap --backtitle "$titulo" --title "<< UNIDAD DE INSTALACIÓN >>" --column-separator "|" --no-tags --ok-label "< Seleccionar >" \
#     --nocancel --menu "Seleccione la unidad donde desea instalar Archlinux:" 20 40 16)

# options=(1 "/dev/sda"
# 	     2 "/dev/sdb"
# 	     3 "/dev/sdc"
# 	     4 "/dev/sdd")

# choices=$("${cmd[@]}" "${options[@]}" 2>&1 >/dev/tty)

# for choice in $choices
# do
#     case $choice in
#         1) udd="/dev/sda";;
# 		2) udd="/dev/sdb";;
# 		3) udd="/dev/sdc";;
# 		4) udd="/dev/sdd";;
#     esac
# done
# dialog --no-collapse --cr-wrap --backtitle "$titulo" --title "Confirma la unidad de instalación $udd" --yesno "\n ¿Desea realmente usar?" 7 50
# case $? in
#    0) opcion = 1
   
# done
# << UNIDAD DE INSTALACIÓN >>



#!/bin/bash

# while-menu-dialog: a menu driven system information program

DIALOG_CANCEL=1
DIALOG_ESC=255
HEIGHT=0
WIDTH=0


display_result() {
  dialog --title "$1" \
    --no-collapse \
    --msgbox "$result" 0 0
}

while true; do
  result=$(lsblk)
  display_result "Unidades"
  exec 3>&1
  selection=$(dialog \
    --backtitle "System Information" \
    --title "Menu" \
    --clear \
    --cancel-label "Exit" \
    --menu "Please select:" $HEIGHT $WIDTH 4 \
    "1" "Display System Information" \
    "2" "Display Disk Space" \
    "3" "Display Home Space Utilization" \
    2>&1 1>&3)
  exit_status=$?
  exec 3>&-
  case $exit_status in
    $DIALOG_CANCEL)
      clear
      echo "Program terminated."
      exit
      ;;
    $DIALOG_ESC)
      clear
      echo "Program aborted." >&2
      exit 1
      ;;
  esac
  case $selection in
    0 )
      clear
      echo "Program terminated."
      ;;
    1 )
      result=$(echo "Hostname: $HOSTNAME"; uptime)
      display_result "System Information"
      ;;
    2 )
      result=$(df -h)
      display_result "Disk Space"
      ;;
    3 )
      if [[ $(id -u) -eq 0 ]]; then
        result=$(du -sh /home/* 2> /dev/null)
        display_result "Home Space Utilization (All Users)"
      else
        result=$(du -sh $HOME 2> /dev/null)
        display_result "Home Space Utilization ($USER)"
      fi
      ;;
  esac
done

