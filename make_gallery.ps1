$imgs = Get-ChildItem -Path "images" -File | Where-Object { $_.Extension -match "\.(jpg|jpeg|png|webp)$" -and $_.Name -ne "gallery.json" } | Select-Object -ExpandProperty Name | Sort-Object
$list = ($imgs | ForEach-Object { '"' + $_ + '"' }) -join ","
$json = '{"images":[' + $list + ']}'
$json | Set-Content "images/gallery.json" -Encoding UTF8
Write-Host "gallery.json updated:" $imgs.Count "images"
