# Ubuntu Recuperacio del Grub2

Ferramenta utilitzada "Super Grub 2"

Primer de tot eliminarem manualment el grub2 del sistema amb la comanda "sudo rm -rf /root/grub". Al iniciar el sistema amb la ferramenta ens detectara que falten fitxers del boot
![alt text](fotos/Captura%20de%20pantalla%20de%202024-09-26%2013-23-14.png)

Per a recuperar el grub muntarem la iso de supegrub i a l'opcio "detecta qualsevol SO"
![alt text](fotos/Captura%20de%20pantalla%20de%202024-09-26%2013-23-14.png)

Anem a "Detect and show boot methods"
![alt text](fotos/Captura%20de%20pantalla%20de%202024-09-26%2013-29-03.png)

Baixem fins trobar l'opció Linux i fem "enter"
![alt text](fotos/Captura%20de%20pantalla%20de%202024-09-26%2013-38-10.png)

Despres de recuperar ens iniciara el sistema amb normalitat
![alt text](fotos/Captura%20de%20pantalla%20de%202024-09-26%2013-38-37.png)

Per a mantenir aquest canvis tenim que instalar el grub2 manualment amb les seguents comandes

```
Sudo grub-install /dev/sda
```

```
Sudo apt-get install grub2
```

```
Sudo apt update-grub2
```