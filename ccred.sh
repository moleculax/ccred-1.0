#!/bin/bash

#Emilio J. Gomez
#moleculax@protonmail.com
#Configuración basica de interfaces de red en debian.
#06/01/18

dialog --title "CCINTERFACE" --msgbox " CONFIGURACION DE INTERFACES DE RED "  0 0

	clear
	rm interfaces
	iface=$(dialog --title 'INTERFACES' --stdout --inputbox "INTRODUZCA iface ethN  (COLOQUE eth0 en caso de usarla): " 0 0)
	address=$(dialog --title 'Address' --stdout --inputbox "IP" 0 0)
	netmask=$(dialog --title 'Netmask' --stdout --inputbox "NETMASK" 0 0)
	gateway=$(dialog --title 'Gateway' --stdout --inputbox "GATEWAY" 0 0)


dialog --title "CCINTERFACE" --msgbox "Para continuar presione aceptar, o Ctrl C para abortar." 0 0

if [ "$?" = "255" ]
	rm -r /etc/network/interfaces 
	echo "# This file describes the network interfaces available on your system" >> /etc/network/interfaces
	echo "# and how to activate them. For more information, see interfaces(5). " >> /etc/network/interfaces
	echo "source /etc/network/interfaces.d/*  " >> /etc/network/interfaces

	# The loopback network interface

	echo "auto lo" >> /etc/network/interfaces
	echo "auto $iface" >> /etc/network/interfaces
	echo "iface $iface inet static " >> /etc/network/interfaces
	echo "address $address" >> /etc/network/interfaces
	echo "netmask $netmask" >> /etc/network/interfaces
	echo "gateway $gateway" >> /etc/network/interfaces
then
	dialog --title "DATOS PROCESADOS" --msgbox "CONFIGURACION EXITOSA" 0 0
else
	exit 
	clear
	dialog --title "NO SE PROCESARON LOS DATOS" --infobox "SIN PROCESAR" 0 0
for i in $(seq 0 10 100) ; do sleep 1; echo $i | dialog --gauge "NP" 0 0 0; done
fi
 
dialog --title "CONFIGURACION FINAL:" --textbox /etc/network/interfaces 0 30
dialog --title "GRACIAS POR USAR:" --textbox msg 0 30

clear