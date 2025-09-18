#!/usr/bin/env bash
set -e
SRC="$HOME/infa-lab/apache/index.php"
DST="/var/www/html/index.php"

if [ ! -f "$SRC" ]; then
  echo "Fant ikke $SRC"; exit 1
fi

sudo cp "$SRC" "$DST"
sudo chown root:root "$DST"
sudo chmod 644 "$DST"
sudo service apache2 reload
echo "Deploy OK → http://localhost"
