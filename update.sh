#!/bin/bash

echo "[*] Usuwanie starych plikow indeksu..."
rm -f Packages Packages.bz2

echo "[*] Generowanie nowego pliku Packages..."
dpkg-scanpackages -m ./debs > Packages

echo "[*] Kompresowanie pliku Packages..."
bzip2 -5f -k Packages

echo "[*] Wysylanie zmian na GitHub..."
git add .
git commit -m "Zaktualizowano paczki w repozytorium"
git push

echo "[*] Gotowe! Repozytorium zaktualizowane."
