## Intro

You can generate a non-signed debian package via:

```bash
debuild -us -uc -b
```
in the parent of this directory. This will generate the deb file in the parent directory of this repository.

You can increase changelog version and comments with `dch` utility, like with `dch -i` that increase minor version.

Add to your .gitignore:
```
*/*.debhelper
*/*.debhelper.log
*.buildinfo
*.substvars
debian/files
debian/ala-cas-5
```

## Using systemd?

Just create here your systemad service like
debian/ala-cas-5.service
debian/cas.conf

see ala-images debian package for details

## Looking for inspiration?

`dbconfig-common` package have some samples in `/usr/share/doc/dbconfig-common/examples/` for mysql and postgresql debian configuration tasks for packages.

## Testing

You can test the generated package without install it with `piuparts` like:

```bash
sudo piuparts -D ubuntu -d xenial -d bionic ../ala-collectory_1.6.2-1_all.deb
```
in this way you can also test it in different releases.

Read `/usr/share/doc/piuparts/README.*` for more usage samples.

## TODO

[ ] remove mysql deps and dbconfig to allow external dbs
[ ] ask for db user/pass and put in application.yml

## CODE DUPLICATED

Code duplicated from `ala-install` of similar:

- data/cas5/templates/log4j2.xml
- data/cas5/config/application.template
