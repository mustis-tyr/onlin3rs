
# Creando la partición

~~~
fdisk /dev/sdX

n -> new 

p -> primary

w -> write
~~~

# Creando la particion cifrada

~~~
cryptsetup\
 --cipher aes-xts-plain\
 --key-size 512\
 --hash sha512\
 -v luksFormat /dev/sdX1\
~~~

# Abriendo la partición

~~~
sudo cryptsetup -v luksOpen /dev/sdX1 cipherpart
~~~

# Creando un file system ext4

~~~
sudo mkfs -t ext4 -L cipherdata /dev/mapper/cipherpart
~~~


