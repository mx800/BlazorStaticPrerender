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
