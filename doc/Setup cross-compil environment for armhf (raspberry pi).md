# Setup cross-compil environment for armhf (raspberry pi)

On utilise `sbuild` pour créer un chroot et en environnement de build pour l'architecture que l'on veut.

Install des outils :

```
sudo apt-get install sbuild ubuntu-dev-tools
```

Création d'un chroot pour SITL

```
mk-sbuild --name=project-focal focal
```

Création d'un chroot pour crossbuild

```
mk-sbuild --arch=armhf bionic

 To CHANGE the golden image: sudo schroot -c source:bionic-armhf -u root
 To ENTER an image snapshot: schroot -c bionic-armhf
 To BUILD within a snapshot: sbuild -A -d bionic-armhf PACKAGE*.dsc
 To BUILD for : sbuild -A -d bionic-armhf --host  PACKAGE*.dsc
```

Lancement d'un build
```
sbuild -d bionic-armhf --host=armhf --build=armhf
```

ou alors entrer dans le chroot en montant le dossier /home
-> /etc/schroot/sbuild/fstab, rajouter la ligne

```
/home /home none rw,bind 0 0
```

et lancer le build depuis le schroot.

## Setup ccache with sbuild

Follow the instructions here :
- [Setup ccache with sbuild](https://wiki.debian.org/sbuild#Using_.22ccache.22_with_sbuild)

## Remove a chroot

Get info about the schroot : `schroot --info -c source:inspection-amd64`

Remove directory "Directory" in the info command :

- `/var/lib/schroot/chroots/chroot-to-delete` -> the files
- `/etc/schroot/chrood.d/sbuild-chroot-to-delete` -> the schroot config file
