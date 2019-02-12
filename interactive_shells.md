

# Crear una shell interactiva

1. Spawn the shell

```
$ python -c 'import pty; pty.spawn("/bin/bash")'
```

2. Dar CTRL + Z.

3. Configurar la tty.

```
$ stty raw -echo
$ fg
```

4. Resetear la tty

```
$ reset
```

5. Configura las variables de entorno.

```
$ export SHELL=bash
$ export TERM=xterm-256color
$ stty rows <num> columns <cols>
```

6. Presionar CTRL + Z.

