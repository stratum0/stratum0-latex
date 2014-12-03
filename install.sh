#!/bin/sh
DOWNLOAD_URL=$(curl -s https://api.github.com/repos/stratum0/stratum0beamer/releases | grep browser_download_url | head -n 1 |sed -E 's/[[:space:]]*"[a-z_]*": "([a-zA-Z0-9_.:/\-]*)"/\1/')
UNZIP_DIR=$(mktemp -d /tmp/stratum0beamer.XXXXXXXX)
UNZIP_FILE=${UNZIP_DIR}/stratum0beamer.zip
curl -L "${DOWNLOAD_URL}" > "${UNZIP_FILE}"
unzip -d "${UNZIP_DIR}" "${UNZIP_FILE}"
INSTALL_TO="$(kpsewhich --var-value TEXMFLOCAL)/"
sudo cp -r "${UNZIP_DIR}/fonts" "${UNZIP_DIR}/tex" "${INSTALL_TO}"
sudo mktexlsr
sudo updmap-sys --nomkmap --nohash --enable Map=YanoneKaffeesatzZeroHack.map
sudo updmap-sys
sudo mktexlsr
rm -rf "${UNZIP_DIR}"
