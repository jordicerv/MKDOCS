
# Guia de Gestió de Paquets i Repositoris

## 1. Centre de programari
El Centre de Programari no sempre conté les darreres versions dels paquets.

## 2. Synaptic
Synaptic és una interfície gràfica per a gestionar paquets. Es pot instal·lar amb:

```bash
sudo apt-get install synaptic
```

Per executar-lo, simplement escriu `synaptic` al terminal.

## 3. APT (Advanced Package Tool)
APT és un sistema de gestió de paquets, amb `apt-get` o `apt` com a interfícies. **APT** és una versió millorada amb algunes funcionalitats addicionals.

### Comandes comunes:
- **apt update**: Actualitza la llista de tots els paquets mirant el fitxer `/etc/apt/sources.list`.
- **apt upgrade**: Actualitza el sistema instal·lant noves versions dels paquets existents (no instal·la nous paquets).
- **apt dist-upgrade**: Igual que `apt upgrade`, però instal·la nous paquets si cal.
- **apt build-dep paquet**: Instal·la les dependències d'un paquet (no el paquet en si).
- **apt install paquet**: Instal·la un paquet.
- **apt remove paquet**: Elimina un paquet.
- **apt purge paquet**: Elimina un paquet i les seves configuracions.
- **apt autoremove**: Elimina els paquets no utilitzats.
- **apt clean**: Esborra els paquets descarregats.
- **apt-cache depends paquet**: Mostra les dependències d'un paquet.
- **apt-rdepends paquet**: Mostra les dependències de les dependències d'un paquet.
- **apt -f install**: Repara instal·lacions incompletes o paquets trencats.
- **apt-cache policy paquet**: Mostra els candidats d'instal·lació d'un paquet (utilitzat per a pinning).
- Configuració: `/etc/apt/preferences.d/`

## 4. Aptitude
Aptitude és una alternativa a APT que permet una interfície gràfica o ús per comandes. Gestiona les dependències de manera automàtica i recorda quines dependències instal·lades s'han d'eliminar en desinstal·lar un paquet.

### Comandes comunes:
- **aptitude purge paquet**: Elimina un paquet i les seves dependències.
- **aptitude remove paquet**: Elimina un paquet.
- **aptitude install paquet**: Instal·la un paquet.
- **aptitude show paquet**: Mostra informació d'un paquet, indicant si està instal·lat o no.

## 5. dpkg (Debian Package)
`dpkg` és una eina de baix nivell per a la gestió de paquets en sistemes basats en Debian.

### Comandes comunes:
- **dpkg -r paquet**: Elimina un paquet.
- **dpkg -P paquet**: Elimina un paquet i les seves configuracions.
- **dpkg -i arxiu.deb**: Instal·la un paquet .deb.
- **dpkg -s paquet**: Mostra informació sobre un paquet (com la seva prioritat: required, important, standard, optional, extra).
- **dpkg-reconfigure paquet**: Reconfigura un paquet.
- **dpkg --get-selections | grep paquet**: Mostra si un paquet està instal·lat o no.

## 6. Repositoris
Els repositoris contenen programari per al sistema. Hi ha diferents seccions:

- **main**: Programari suportat oficialment.
- **restricted**: Programari suportat, però que no està completament sota una llicència lliure.
- **universe**: Programari suportat per la comunitat.
- **multiverse**: Programari no lliure.

Per afegir repositoris, edita el fitxer `/etc/apt/sources.list`, actualitza la llista de paquets amb:

```bash
sudo apt-get update
```

I després instal·la paquets amb:

```bash
sudo apt-get install paquet
```

## 7. Compilar des del codi font
Per compilar programes des del codi font, necessites tenir instal·lat un compilador:

```bash
sudo apt-get install build-essential
```

### Comandes per descomprimir:
- **tar**: `tar xvf archivo.tar`
- **gz**: `gunzip archivo.gz` o `gzip -d archivo.gz`
- **tgz / tar.gz**: `tar xvzf archivo.tar.gz`
- **bz2**: `bunzip2 archivo.bz2` o `bzip2 -d archivo.bz2`
- **tar.bz2**: `tar xvjf archivo.tar.bz2`
- **zip**: `unzip archivo.zip`
- **rar**: `rar -x archivo.rar`

### Per compilar:
```bash
./configure
make
sudo make install
sudo make uninstall
```

## 8. Binaris
Els binaris són aplicacions precompilades que no necessiten codi font, només executables. Per executar-los:

```bash
chmod +x arxiu.bin
sudo ./arxiu.bin
```
