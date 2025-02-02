# Creació, formateig, muntatge i compartició de particions

Aquest sector sera completament amb exemples practics!

## Creació

entrem amb mode administrador i amb fdisk -l comprovem l'estat del disk sdb i configurem una nova partició

![alt text](fotos/sprint2/discs/2024-12-28_21-18.png)

comprovem l’estat del disc sdb i configurem una nova partició

![alt text](fotos/sprint2/discs/2024-12-28_21-21.png)

amb fdisk -l podem veure informacio detallada del disc

![alt text](fotos/sprint2/discs/2024-12-28_21-30.png)

l'hi assignem un format a la particio previament creada utilitzant mkfs.ext4 (indicant el tamañi dels blocs)

![alt text](fotos/sprint2/discs/2024-12-28_21-44.png)

utilitzem tune2fs amb el grep block per a consultar la configuració del sistema de fitxers de la partició

![alt text](fotos/sprint2/discs/2024-12-28_21-44_1.png)

## Muntatge (temporal i definitiu)

primer fem un ls del directori base i seguidament creem una carpeta "particio1" amb un fitxer "hola"

![alt text](fotos/sprint2/discs/m1.png)

despres a montarem la particio1 real que hem creat molt anteriorment i si fem un ls vorem que ja no apareix el fitxer sino que s'ha montat la particio amb el seu fitxer "lost+found"

![alt text](fotos/sprint2/discs/m2.png)

ignorant els fallos a la següent imatge fem un afegim amb touch un fitxer dins la particio1 i el mostrem amb ls

![alt text](fotos/sprint2/discs/m3.png)

amb df -T mirem el sistema de fitxers de tot els sistemes muntats

![alt text](fotos/sprint2/discs/m4.png)

Al **fstab** podem veure diferents parametres per linis els quals nomes poden fer referancia a una **particio** o **carpeta**

- **/dev/sdb1**: Ubicació d'origen.
- **/var/particio1**: Ubicació d'estí.
- **ext4**: Sistema de fitxers.
- **defaults**: Opcions de muntatge.
- **0(dump)**: Aquesta columna indica si es farà una còpia de seguretat del sistema de fitxers amb la utilitat dump. (0 vol dir que no s'en fara cap).
- **0(fsck)**: Aquesta columna defineix l'ordre en què el sistema de fitxers serà comprovat amb fsck durant l'arrencada (0 que no es comprovará).

![alt text](fotos/sprint2/discs/m5.png)

reiniciem la maquina i utilitzem df -T per a comprovar que s'ha muntat automaticament

![alt text](fotos/sprint2/discs/m6.png)

## Compartir carpetes

podem compartir amb dos sistemes (ubuntu i windows)

### **ubuntu(ext4)**

Per a compartir carpetes primer de tot tenim que installar el programari samba i el sambaclient

![alt text](fotos/sprint2/discs/c1.png)

![alt text](fotos/sprint2/discs/c2.png)

D'espres amb chmod i chown canviem els permisos i el propietari de la particio muntada

![alt text](fotos/sprint2/discs/c3.png)

despres hi ha que configurar com es compartira la carpeta dins del smb.conf (en aquest cas nomes podra accedir-hi l'usuari "diego")

![alt text](fotos/sprint2/discs/c4.png)

seguidament reiniciem el servei smbd nmbd

![alt text](fotos/sprint2/discs/c5.png)

obviament ara necessitarem crear l'usuari diego per a poder accedir a la carpeta

![alt text](fotos/sprint2/discs/u1.png)

l'hi afegim una contrasenya de samba

![alt text](fotos/sprint2/discs/u2.png)

### **windows (ntfs)**

ara seguirem els mateixos passos per amb alguns canvis per a que funcione en ntfs

![alt text](fotos/sprint2/discs/w1.png)

aqui si ens fixem afegirem de valor hex el numero 7 que fa referencia al formats compatibles amb ntfs...

![alt text](fotos/sprint2/discs/w2.png)

afegim el format amb ntfs

![alt text](fotos/sprint2/discs/w3.png)

i afegim la carpeta particio2 on muntarem la particio

![alt text](fotos/sprint2/discs/w4.png)

ens fara falta el seguent paquet per a puger montar la particio en ntfs

![alt text](fotos/sprint2/discs/w5.png)

muntem temporalment i comprovem que funciona

![alt text](fotos/sprint2/discs/w6.png)

i configurem el muntatge automatic al fstab

![alt text](fotos/sprint2/discs/w7.png)

despres per a compartir-la configurem el samba amb permisos basics

![alt text](fotos/sprint2/discs/w8.png)

comprovem que podem accedir desde un windows i que podem crear fitxer que es guardin al linux

![alt text](fotos/sprint2/discs/w9.png)

![alt text](fotos/sprint2/discs/w10.png)

## Quotes de disc

primer de tot instalem el paquet de quota i el configurem el fstab

![alt text](fotos/sprint2/discs/q1.png)

si al reiniciar no es mostren al fer un ls de la particio montada passem a crear-ho manualment

![alt text](fotos/sprint2/discs/q2.png)

afegim un usuari

![alt text](fotos/sprint2/discs/q3.png)

podem vore les quotes definides amb quota -u usuari1

![alt text](fotos/sprint2/discs/q4.png)

i editar-les amb "edquota -u"

![alt text](fotos/sprint2/discs/q5.png)

la configurem amb els seguents parametres

**Soft i Hard limit:**

    La quota soft limit és un límit flexible que permet a un usuari excedir temporalment l'espai en disc o el nombre d'inodes assignats. Quan se supera, comença un període de gràcia, durant el qual l'usuari pot continuar utilitzant espai extra abans d'imposar el hard limit, que és un límit estricte i inamovible. Aquest sistema facilita la gestió de recursos sense interrupcions immediates.

![alt text](fotos/sprint2/discs/q6.png)

podem comprovar si s'ha aplicat amb "repquota"

![alt text](fotos/sprint2/discs/q7.png)

amb la seguent comanda podem generar fitxers per a comprovar que funcione la quota:

    dd if=/dev/zero of=test bs=1K count=800c

![alt text](fotos/sprint2/discs/q8.png)

creem uns 3 fitxers per arribar al limit de la quota

![alt text](fotos/sprint2/discs/q9.png)

amb la seguent comanda podem editar el periode de gracia del soft limit: (ed quota -t)

    El **període de gràcia** és el temps que un usuari pot excedir el límit flexible (soft limit) d'espai en disc o inodes abans que el sistema li apliqui restriccions definitives. Durant aquest temps, l'usuari rep avisos però pot continuar treballant, sempre que no superi el hard limit. Si redueix l'ús per sota del soft limit abans que acabi el període, no s'apliquen sancions.

![alt text](fotos/sprint2/discs/q10.png)

tambe podem intentar eccedir-lo per l'interficie grafica

![alt text](fotos/sprint2/discs/q11.png)