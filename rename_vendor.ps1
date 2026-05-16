$files = Get-ChildItem -Filter *.html
foreach ($f in $files) {
    $content = Get-Content $f.FullName -Raw
    $newContent = [regex]::Replace($content, '(?i)Mohamed Douibi', 'abderrahim kb')
    if ($content -ne $newContent) {
        Set-Content -Path $f.FullName -Value $newContent
    }
}
