$indexContent = Get-Content "index.html" -Raw

# 1. Extract CSS
$cssMatch = [regex]::Match($indexContent, '(?s)<style>(.*?)</style>')
$css = ""
if ($cssMatch.Success) {
    $css = $cssMatch.Groups[1].Value
}

# Add table styling to CSS
$tableStyles = @"

/* ── TABLE GLASS CARDS FOR CHECKOUT & FORMS ── */
table {
    background: var(--surface);
    border: 1px solid var(--border);
    border-radius: var(--card-radius);
    padding: 30px;
    margin: 40px auto;
    border-collapse: separate;
    border-spacing: 0;
    width: 90%;
    max-width: 600px;
    box-shadow: 0 20px 40px rgba(0,0,0,0.4);
}

table td {
    padding: 15px 20px;
    border-bottom: 1px solid var(--border);
    color: var(--text);
    font-size: 14px;
}

table tr:last-child td {
    border-bottom: none;
}

table td:first-child {
    font-weight: 600;
    color: var(--muted);
}

table img {
    border-radius: 10px;
    background: var(--surface2);
    padding: 10px;
    width: 100%;
    max-width: 250px;
    display: block;
    margin: auto;
}

table input[type="text"], 
table input[type="password"], 
table input[type="number"], 
table select {
    background: var(--surface2);
    border: 1px solid var(--border);
    color: var(--text);
    padding: 10px 14px;
    border-radius: 6px;
    font-family: 'Inter', sans-serif;
    width: 100%;
    outline: none;
    transition: border-color 0.2s;
}

table input[type="text"]:focus, 
table input[type="password"]:focus, 
table input[type="number"]:focus, 
table select:focus {
    border-color: var(--primary);
}

table input[type="submit"], button[type="button"] {
    background: var(--primary);
    color: white;
    border: none;
    padding: 12px 20px;
    border-radius: 8px;
    cursor: pointer;
    font-weight: 600;
    width: 100%;
    margin-top: 10px;
    transition: background 0.2s;
}

table input[type="submit"]:hover, button[type="button"]:hover {
    background: var(--primary-dark);
}

table input[type="checkbox"] {
    accent-color: var(--primary);
    margin-right: 5px;
}

#color-error, #quantity-error, #pointure-error, #fname-error, #lname-error, #email-error, #password-error {
    font-size: 12px;
    margin-top: 4px;
}
"@

# Save to stade.css
Set-Content -Path "stade.css" -Value ($css + $tableStyles)

# 2. Extract Nav and Footer
$navMatch = [regex]::Match($indexContent, '(?s)(<!-- NAVBAR -->\s*<nav>.*?</nav>)')
$nav = ""
if ($navMatch.Success) {
    $nav = $navMatch.Groups[1].Value
}

$footerMatch = [regex]::Match($indexContent, '(?s)(<!-- FOOTER -->\s*<footer>.*?</footer>)')
$footer = ""
if ($footerMatch.Success) {
    $footer = $footerMatch.Groups[1].Value
}

$headFonts = '<link href="https://fonts.googleapis.com/css2?family=Bebas+Neue&family=Inter:wght@400;500;600&display=swap" rel="stylesheet">'
$headCss = '<link href="stade.css" rel="stylesheet">'

# 3. Remove inline style from index.html and add link
$newIndex = $indexContent -replace '(?s)<style>.*?</style>', ($headCss)
Set-Content -Path "index.html" -Value $newIndex

# 4. Modify all other HTML files
$files = Get-ChildItem -Filter *.html | Where-Object { $_.Name -ne "index.html" }
foreach ($file in $files) {
    $content = Get-Content $file.FullName -Raw

    # Remove old nav and footer if they exist to avoid duplicates
    $content = $content -replace '(?s)<!-- NAVBAR -->.*?<\/nav>\s*', ''
    $content = $content -replace '(?s)<!-- FOOTER -->.*?<\/footer>\s*', ''
    
    # Remove old fonts/css links to avoid duplicates
    $content = $content -replace '<link href="https://fonts\.googleapis\.com/css2[^>]+>', ''
    $content = $content -replace '<link href="stade\.css" rel="stylesheet">', ''
    $content = $content -replace '<link rel="stylesheet" href="stade\.css">', ''

    # Insert fonts and css into head
    $content = $content -replace '(?i)</head>', "`n    $headFonts`n    $headCss`n</head>"
    
    # Insert nav after body
    $content = $content -replace '(?i)<body>', "<body>`n`n    $nav`n"
    
    # Insert footer before /body
    $content = $content -replace '(?i)</body>', "`n    $footer`n</body>"

    # Remove inline border="1" and width="50%" from table to let CSS take over
    $content = $content -replace '<table border="1" width="50%">', '<table>'
    $content = $content -replace '<table width="50%">', '<table>'

    Set-Content -Path $file.FullName -Value $content
}
