@echo off
cd /d "%~dp0"

echo Scanning images folder...
powershell -Command "$imgs = Get-ChildItem -Path 'images' -Include '*.jpg','*.jpeg','*.png','*.webp' -Recurse | Where-Object { $_.Name -ne 'gallery.json' } | Select-Object -ExpandProperty Name | Sort-Object; $json = '{\"images\":[' + (($imgs | ForEach-Object { '\"' + $_ + '\"' }) -join ',') + ']}'; $json | Set-Content 'images/gallery.json' -Encoding UTF8"

git add .
git commit -m "update gallery"
git push origin main

echo.
echo Done! https://nookcachette-art.github.io/Nook-Cachette/
echo.
pause
