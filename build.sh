#!/bin/bash

git submodule init
git submodule update

cd svg2pdf
cargo build --release
cd ..

mkdir svg2pdf-deb
cd svg2pdf-deb
mkdir -p usr/bin
mkdir -p usr/share/doc/svg2pdf
mkdir DEBIAN
cd ..

cp svg2pdf/target/release/svg2pdf svg2pdf-deb/usr/bin/
cp svg2pdf/LICENSE* svg2pdf-deb/usr/share/doc/svg2pdf/
cp svg2pdf/NOTICE svg2pdf-deb/usr/share/doc/svg2pdf/
cp svg2pdf/README.md svg2pdf-deb/usr/share/doc/svg2pdf/
cp svg2pdf/CHANGELOG.md svg2pdf-deb/usr/share/doc/svg2pdf/
cp DEBIAN/control svg2pdf-deb/DEBIAN/

sudo dpkg -b ./svg2pdf-deb
mv svg2pdf-deb.deb svg2pdf.deb

rm -rf ./svg2pdf-deb