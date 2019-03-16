

# Usar aptitude a través de un sock5 proxy.

En caso que se necesita instalar paquetes con aptitude y tengas algun proxy que te bloquee y solo tienes acceso remoto a una maquina mediante ssh, has lo siguiente:

1. Levanta el socks5 proxy.

~~~
ssh -f -N -D 9000 <usuario>@<ip> -p <puerto>
~~~

2. Agrega un proxy a la configuracion de aptitude.

~~~
sudo cat <<EOF > /etc/apt/apt.conf.d/80proxyconf
Acquire::http::proxy "socks5h://127.0.0.1:9000";
EOF
~~~

Listo si todo funciona correctamente podras usar apt-get update y apt-ge install sin ningun problema.


# Tunelear

En caso de que se tenga un maquina linux comprometida que puede hacer uso del protocolo ssh podemos aplicar los siguientes trucos.

## Equipo comprometido.

Previamente se debieron de haber configurado las llaves de confianza para que no se pida el password cada vez que se intente conectar.

### Con autossh

~~~
/usr/bin/autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -f -N -R <puerto-remoto-vps>:localhost:22 usuario-remoto@ip-remota-vps.
~~~

### Solo con ssh

~~~
ssh -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -f -N -R <puerto-remoto>:localhost:22 usuario-remoto@ip-remota-vps.
~~~


## Equipo nuestro.

En este esquema tiene que exisitir una maquina con un ip publico el cual se pueda llegar desde internet o que se visible para el equipo comprometido y que nosotro tambien podamos acceder.

### Con autossh

~~~
/usr/bin/autossh -M 0 -o "ServerAliveInterval 30" -o "ServerAliveCountMax 3" -f -N -L <puerto-local>:localhost:<puerto-remoto-vps> usuario-remoto@ip-remota-vps.
~~~

### Con ssh

~~~
ssh -o ServerAliveInterval=30 -o ServerAliveCountMax=3 -f -N -L <puerto-local>:localhost:<puerto-remoto-vps> usuario-remoto@ip-remota-vps
~~~

## Consejos

Eso en conjunto con un crontab , se puede tener acceso remoto a ese equipo.

