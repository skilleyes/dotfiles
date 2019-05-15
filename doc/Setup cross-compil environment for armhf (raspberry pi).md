# Setup cross-compil environment for armhf (raspberry pi)

On utilise `sbuild` pour créer un chroot et en environnement de build pour l'architecture que l'on veut.

Install des outils :

```
sudo apt-get install sbuild ubuntu-dev-tools
```

Création d'un chroot

```
mk-sbuild --arch=armhf bionic
```

Lancement d'un build
```
sbuild -d bionic-armhf --host=armhf --build=armhf
```