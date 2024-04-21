#!/data/data/com.termux/files/usr/bin/bash

PACKAGE="$1"

mkdir -p ${PACKAGE}/data/data/com.termux/files/usr/bin
mkdir -p ${PACKAGE}/data/data/com.termux/files/usr/share
mkdir -p ${PACKAGE}/data/data/com.termux/files/usr/lib/python3.11
mkdir -p ${PACKAGE}/DEBIAN

pip install ${PACKAGE} --target=${PACKAGE}/data/data/com.termux/files/usr/lib/python3.11

cat <<EOF > ${PACKAGE}/DEBIAN/control
Package: ${PACKAGE}
Version:
Section: utils
Architecture: all
Priority: important
Depends: python, python-pip
Maintainer:
Description:
EOF

nano ${PACKAGE}/DEBIAN/control

chmod 755 ${PACKAGE}/DEBIAN

dpkg-deb --build ${PACKAGE}

rm -rf ${PACKAGE}

mkdir -p pkg

mv ${PACKAGE}.deb pkg
