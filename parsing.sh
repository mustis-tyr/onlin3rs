#!/bin/bash

parsing_masscan_json(){
cat "$1" | jq -r '.[] | "nmap -sV -sS -T4 -n -Pn --open -oX nmap_"+ .ip + ".xml -p" + ([.ports[].port | tostring] | join(" ")) + " " + .ip'
}

