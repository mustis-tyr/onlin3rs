#!/bin/bash

shortcut-powershell-file(){
echo -n "powershell -nOp -w hIDdeN -EP ByPaSs -e ";
echo $(cat "$1" | iconv -t UTF-16LE | base64 | tr -d "\n"); 
}

