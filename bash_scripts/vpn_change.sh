#!/bin/bash

#
# Esta funcion se puede usar cuando hay un bloqueo por IP de una firewall (a.k.a congelando)
#
# Se requiere configurar previante conexiones a vpn mediante Network Manager

importing_ovpn(){
	OVPN_FILE_DIR=$1;

	if [ -d "$OVPN_FILE_DIR" ]; then

		for item in $(ls -1 "$OVPN_FILE_DIR");
		do
			nmcli connection import type openvpn file "$item";
		done;
	fi;
}

changingvpn(){

	# Desactivamos todas las conexiones de vpn por eth0
	for item in $(nmcli c show | grep -e "vpn" | grep "eth0");
	do
		nmcli connection down "$item";
	done;
	
	# Param 1: Dominio que objetivo
	DOMAIN=$1
	
	# Param 2: Diccionario que se va a usar
	DICTIONARY=$2;
	
	# Param 3: Numero de request soportadas
	PAGE_SIZE=$3;
	
	# Cantidad de lineas del dicionario
	LINES=$(cat $DICTIONARY | wc -l);
	
	# Obteniendo modulo
	MOD=$((LINES % PAGE_SIZE))
	DIV=$((LINES / PAGE_SIZE))
	
	if [ $MOD -gt "0" ]; then
		DIV=$(( DIV + 1 ));
	fi;
	
	export COUNTER=1;

	echo "LINES:$LINES, MOD:$MOD, DIV:$DIV, COUNTER:$COUNTER";
	
	while [ "$COUNTER" -le "$DIV" ];
	do
		for line in $(nmcli connection | grep vpn | awk '{ print $1 }'); 
		do	
			ACTUAL="$line";
			echo "=== CONNECTING $ACTUAL"; 
			nmcli connection up "$ACTUAL"; 
		
			if [ $? -eq 0 ]; then
    				echo "== CONNECTED , COUNTER: $COUNTER ****";
    				cat "$DICTIONARY" | head -"$(( PAGE_SIZE * COUNTER ))" | tail -"$PAGE_SIZE" | gobuster dir -l -t 10 -e -k -s 200,201,204,301,302 -u "$DOMAIN" -w -
    				if [ $? -eq 0 ]; then
    					((COUNTER++))
    				fi;
			fi;
			
			echo "=== DISABLE $ACTUAL";
			nmcli connection down "$ACTUAL";
			
			echo "== CONNECTED, COUNTER: $COUNTER, DIV: $DIV";
			if [ "$COUNTER" -ge "$DIV" ]; then
				echo "$COUNTER y $DIV, se va acabar la script";
				break;
			fi;
		done
	done
}