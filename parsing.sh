#!/bin/bash

fix_masscan_json(){
echo -n "[" $(cat local.json | grep -v 'finished' | sed -e'$ s/.$//') "]"
}

parsing_masscan_json_to_nmap(){
cat "$1" | jq -r '.[] | "nmap -sV -sS -T4 -n -Pn --open -oX nmap_"+ .ip + ".xml -p" + ([.ports[].port | tostring] | join(",")) + " " + .ip'
}

parsing_masscan_list_host(){
cat "$1" |  jq '.[]| .ip' | sort -u | tr -d "\"";
}

parsing_masscan_list_ports(){
cat "$1"| jq '.[].ports[] | select(.status == "open") | .port' | sort -u -n
}

analize_schema(){
cat "$1" | jq -r 'path(..) | map(tostring) | join("/")';
}
