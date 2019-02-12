#!/bin/bash

nse(){
find /usr/share/nmap/scripts/ -iname *$1* -printf '%P\n';
}

shodan_ports(){
	if [ ! -f "/usr/local/bin/shodan" ]; then
		echo "Shodan is missing";
	else
		shodan host "$1" | grep "/" | cut -d "/" -f1 | tr -d " " | tr "\n" ",";
	fi
}

