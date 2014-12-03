#!/bin/sh
mkdir -p dist
cd src/YanoneKaffeesatzZeroHack
make clean
make all
make doc
cd ../beamer
make clean
make all
make doc
cd ../../dist
cp -r ../src/YanoneKaffeesatzZeroHack/fonts/ ./
mkdir -p tex/latex/stratum0/img
cp ../src/YanoneKaffeesatzZeroHack/*.fd tex/latex/stratum0
cp ../src/YanoneKaffeesatzZeroHack/*.sty tex/latex/stratum0
cp -r ../src/YanoneKaffeesatzZeroHack/fonts/ ./
cp ../src/beamer/*.sty tex/latex/stratum0
cp ../src/beamer/img/*.pdf tex/latex/stratum0/img
zip -r stratum0beamer.zip fonts tex -x "*/\.*" -x "\.*"
cd ..
