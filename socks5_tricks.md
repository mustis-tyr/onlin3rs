

# Aptitude

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
