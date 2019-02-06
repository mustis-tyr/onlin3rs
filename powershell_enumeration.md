
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

# Esconder la ejecución de powershell con vbs

Se usan las siguientes lineas en el archivo vbs.

```
Dim shell,command
command = "powershell.exe -nologo -File D:\myscript.ps1"
Set shell = CreateObject("WScript.Shell")
shell.Run command,0
```

