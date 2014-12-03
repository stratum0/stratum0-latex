#!/bin/sh
installto="$(kpsewhich --var-value TEXMFLOCAL)/"
sudo cp -r dist/fonts dist/tex $installto
sudo mktexlsr
sudo updmap-sys --nomkmap --nohash --enable Map=YanoneKaffeesatzZeroHack.map
sudo updmap-sys
sudo mktexlsr
