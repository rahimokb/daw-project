$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $newContent = [regex]::Replace($content, 'foot(\d+)\.(png|jpg)', 'produit$1.jpg')
    if ($content -ne $newContent) {
        Set-Content -Path $f.FullName -Value $newContent
    }
}
