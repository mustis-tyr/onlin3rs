#!/bin/bash

nse(){
find /usr/share/nmap/scripts/ -iname *$1* -printf '%P\n';
}

