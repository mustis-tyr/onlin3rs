#!/bin/bash


apt-get install\
 autossh\
 vim\
 tmux\
 terminator\
 nmap\
 proxychains\
 nmon\
 nload\
 htop\
 software-properties-common\
 net-tools\
 sudo\
 mc\
 network-manager-openvpn\
 network-manager-openvpn-gnome\
 openvpn


# Install virtualbox

install_virtualbox () {
	echo "deb http://download.virtualbox.org/virtualbox/debian stretch contrib" > /etc/apt/sources.list.d/virtualbox.list
	wget -q https://www.virtualbox.org/download/oracle_vbox.asc -O- | apt-key add -
	apt-get update
	apt-get install virtualbox-6.0
}

# Install chrome

install_chrome () {
	echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" > /etc/apt/sources.list.d/google-chrome.list
	wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
	apt-get update
	apt-get install virtualbox-6.0 google-chrome-stable
}	
