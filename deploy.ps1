# Delete old publish
Remove-Item -Recurse -Force docs -ErrorAction SilentlyContinue

# Publish
dotnet publish -c Release -o docs

# Format folder
Copy-Item -Recurse docs\wwwroot\* docs\

# Add .nojekyll
New-Item -ItemType File -Path docs\.nojekyll

# Supprime les fichiers/dossiers inutiles
Remove-Item docs\web.config -ErrorAction SilentlyContinue
Remove-Item -Recurse -Force docs/wwwroot -ErrorAction SilentlyContinue
Remove-Item docs\BlazorStaticPrerender.staticwebassets.endpoints.json -ErrorAction SilentlyContinue  

# Met à jour le <base href> dans docs/index.html pour GitHub Pages
(Get-Content docs/index.html) -replace '<base href=\"/\" ?/?>', '<base href="/BlazorStaticPrerender/" />' | Set-Content docs/index.html
