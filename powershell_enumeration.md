
# Enumeracion de una máquina comprometida con Windows

1. Preguntar si puedes ejecutar powershell y la version.

```
powershell -Command "&{ $PSVersionTable.PSVersion }" 
```

2. Preguntar por el politica de ejecución.

```
powershell -Command "&{ Get-ExecutionPolicy }"
```

3. Tratadar de quitarla.

```
powershell -Command "&{ Set-ExecutionPolicy unrestricted }"
```

