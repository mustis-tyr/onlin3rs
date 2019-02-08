#!/bin/bash

shortcut-powershell-file(){
echo -n "powershell -nOp -w hIDdeN -EP ByPaSs -e ";
echo $(cat "$1" | iconv -t UTF-16LE | base64 | tr -d "\n"); 
}

common-attacked-ports(){
PORTS="2222 22 445 502 80 23 22321 41967 1433 25 8545 3389 8080 37215 443 5060 81 5900 2323 8088"


}

