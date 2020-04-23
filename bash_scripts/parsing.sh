#!/bin/bash


#
# Arregla el mal formato que te arroja masscan cuando te arroja un output-file como json
#

fix_masscan_json(){
echo -n "[" $(cat $1 | grep -v 'finished' | sed -e'$ s/.$//') "]"
}


#
# Construye la sentencia de nmap de un input de un archivo JSON que se haya obtenido de masscan.
#

parsing_masscan_json_to_nmap(){
cat "$1" | jq -r '.[] | "nmap -sV -sS -T4 -n -Pn --open -oX nmap_"+ .ip + ".xml -p" + ([.ports[].port | tostring] | join(",")) + " " + .ip'
}

#
# Hace una lista unica de host que se obtuvo de un archivo JSON para poderselos adaptar a nmap con -iL
#

parsing_masscan_list_host(){
cat "$1" |  jq '.[]| .ip' | sort -u | tr -d "\"";
}

#
# Listado de puertos que que se obtenga de un JSON
#

parsing_masscan_list_ports(){
cat "$1"| jq '.[].ports[] | select(.status == "open") | .port' | sort -u -n
}

#
# Hace el diagnostico de un json para poder saber como persearlo.


#
# Hace el diagnostico de un json para poder saber como persearlo.
#

analize_schema(){
cat "$1" | jq -r 'path(..) | map(tostring) | join("/")';
}


#
# Sacando host por puerto
#

filter_host_by_port(){
	cat "$1" | jq -r --arg PORT "$2" '.[] | select(.ports[].port == ($PORT | tonumber)) | .ip' |  sort -u;
}
