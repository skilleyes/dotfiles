# Companion Computer Maintainer's guide

The software used in the Companion Computer is released under the form of debian packages to be installed on raspberry pis.

Every package resides in the `src/package-name/` folder and is built using the `make clean && make` command, using the Makefile in the folder.

The debian packages follow the new debian maintainer's guide that can be found here https://www.debian.org/doc/manuals/maint-guide/

## Updating an existing package

To update an existing package, after having edited the sources and tested the new software, you need to edit the `package/debian/changelog` file.

Please refer to the https://www.debian.org/doc/manuals/maint-guide/dreq.en.html#changelog page to conform the changelog to the debian style.

An easy way to create a new entry is using `debchange` or its alias `dch` :

For example to bump a package to the version 3.0, go to the debian directory and run :

```
dch -v "3.0-1"
```

It will add an entry to the `changelog` with the correct new version. You must edit the changelog to describe the changes in the upstream package, starting with **"New upstream release"**

The `changelog` should look like this : 

```
sqdr-logistics (3.0-1) unstable; urgency=medium

  * New upstream release
  * Bump upstream version to 3.0 from 1.0.

 -- ryan <ryan.ammoury@squadrone-system.com>  Wed, 20 Jun 2018 16:20:44 +0200

sqdr-logistics (1.0-1) unstable; urgency=medium

  * Initial release.

 -- ryan <ryan.ammoury@squadrone-system.com>  Fri, 15 Jun 2018 11:00:00 +0200
```


## Create a new package to add new functionality

It is fairly straightforward : 

- copy an `src/SQDRExistingPackage` to `src/SQDRNewPackage`
- rename the source directory to `sqdr-new-package`
- modify the first line of the `src/SQDRNewPackage/Makefile` : `PACKAGE=sqdr-new-package`
- edit the `debian/files` and replace everywhere the string `sqdr-old-package` by `sqdr-new-package`
 - changelog : Make just one entry, with the correct package name and version. It will be used by the packaging tools for the debian package.
 - compat : leave as it is
 - control : description of the source, package, and its dependencies
 - copyright : change the package name
 - rules : update according to your new package
 - source/format : leave as it is
 
 
The `src/SQDRNewPackage/sqdr-new-package/Makefile` should have the `all`/`build` targets to build and clean the package, and `install`/`uninstall` targets to install the files under an optional `$(DESTDIR)` variable.

Here is a Makefile example to install just a bash script `sqdr-barcode-scanner` : 

```
EXEC=sqdr-barcode-scanner

.PHONY: all
all:

PREFIX=/usr

.PHONY: install
install: all
	install -m 755 -D $(EXEC) $(DESTDIR)$(PREFIX)/bin/$(EXEC)

.PHONY: uninstall
uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/$(EXEC)
```

And another example containing some C++ sources to build as well : 

```
CXX=g++
SRCS=\
	sqdr_service_manager.cpp \

EXEC=sqdr_service_manager
LAUNCHER=sqdr-service-manager-launcher

OBJS=$(SRCS:.cpp=.o)


.PHONY: all
all: $(OBJS)
	$(CXX) $(OBJS) -o $(EXEC)

.PHONY: clean
clean:
	@rm -f *.o $(EXEC)

%.o: %.cpp
	$(CXX) -c $<


PREFIX=/usr

.PHONY: install
# Install for debian based distributions
install: all
	@mkdir -p $(DESTDIR)$(PREFIX)/bin
	@install -m 755 $(EXEC) $(DESTDIR)$(PREFIX)/bin/
	@install -m 755 $(LAUNCHER) $(DESTDIR)$(PREFIX)/bin/

.PHONY: uninstall
# Uninstall for debian based distribution
uninstall:
	@rm -f $(DESTDIR)$(PREFIX)/bin/$(EXEC)
	@rm -f $(DESTDIR)$(PREFIX)/bin/$(LAUNCHER)
```

To add a systemd entry to launch the software as a service on boot, you just need to add a `debian/sqdr-new-package.service` file. Debhelper will take care of managing that file, install or remove it, create symlinks, enable it in systemd etc.. for you. 

Make sure to add the lines to remove the warning that an init.d file is missing : 

```
override_dh_installinit:
	true
```


If you want to disable it by default, edit the `/debian/rules` file to override the corresponding `dh_systemd_enable` and/or `dh_systemd_start` debhelper steps. Use `man dh_command_that_you_want_info_for` for options.