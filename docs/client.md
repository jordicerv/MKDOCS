# Unió de Clients al Domini LDAP

En aquesta secció ens encarregarem d'unir diferents clients (tant **Windows** com **Ubuntu**) al domini **LDAP**.

## Instal·lació dels Paquets Necessaris

Abans de procedir amb la instal·lació, assegureu-vos d'actualitzar el sistema amb la següent comanda:

```sudo apt update```

Ara instal·larem els paquets: ```sudo apt install libnss-ldap libpam-ldap nscd```

![alt text](fotos/sprint3/cli1.png)

*Despres de l'instal·lacio s'brira una finestra de configuracio, si es fa algun configuracio de forma erronea o es tanca la finestra despres es pot tornar a "configurar"*.

## Reconfiguració

Ara farem la reconfiguració amb la següent comanda:

````dpkg-reconfigure lpda-auth-config```

![alt text](fotos/sprint3/cli3.png)

## Configuració principal

- Aqui indicarem la adrça del servidor (compte amb com esta escrit **ldap://**)

![alt text](fotos/sprint3/cli2.png)

- Afegim el nom i extensió del domini

![alt text](fotos/sprint3/cli4.png)

- Indiquem que la versio

![alt text](fotos/sprint3/cli5.png)

- Diem que el root local sigue administrador

![alt text](fotos/sprint3/cli6.png)

- Escollim que "si" ja que la base de dades requereix un login

![alt text](fotos/sprint3/cli7.png)

- Compte root del LDAP

![alt text](fotos/sprint3/cli9.png)

- Contrasenya del mateix compte

![alt text](fotos/sprint3/cli10.png)

- Usuari no root

![alt text](fotos/sprint3/cli11.png)

- Mateixa contrasenya

![alt text](fotos/sprint3/cli12.png)

- Deixem el hash per defecte

![alt text](fotos/sprint3/cli13.png)

## Configuracio Addicional dels Fitxers

### Modificar */etc/nsswitch.conf*

Hi ha que afegir *"ldap compat"* devant de les 3 primeres linies (com es mostra a la següent captura)

![alt text](fotos/sprint3/cli14.png)

### Modificar */etc/pam.d/common-session*

Afegim la seguent linea que s'encarrega de crear automaticamen el directori de cada usuari.

```sudo nano /etc/pam.d/common-session```

![alt text](fotos/sprint3/cli15.png)

### Modificar */usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf*

Aquests parametres serveixen per a evitar possibles problemes amb el login del usuari.

```sudo nano /usr/share/lightdm/lightdm.conf.d/50-ubuntu.conf```

```greeter-show-manual-login=true```

![alt text](fotos/sprint3/cli16.png)

## Comprovar que s'ha unit al LDAP

Per assegurar que el sistema pot autenticar-se correctament amb LDAP, seguiu aquests passos:

### Comprovació de l'usuari amb la comanda `getent`

Executeu la comanda següent per verificar si el sistema consulta correctament l'LDAP:

```sudo getent passwd```

Si l'usuari que heu afegit, com ara `alu1`, apareix a la llista, significa que la configuració s'ha aplicat correctament i estem units al domini.

![alt text](fotos/sprint3/cli17.png)

Per a comprovar que funciona al 100% reiniciem la maquina i intentem entrar a un dels usuaris del domini:

![alt text](fotos/sprint3/cli18.png)

falten la meitat (revisar foto a descargues)