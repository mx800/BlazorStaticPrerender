# Nettoie les anciens fichiers statiques à la racine (hors dossiers source)
Remove-Item -Recurse -Force _framework, css, lib, BlazorStaticPrerender.styles.css, favicon.png, index.html, manifest.webmanifest, service-worker.js, service-worker.published.js, .nojekyll, 404.html -ErrorAction SilentlyContinue

# Publie le projet dans un dossier temporaire
dotnet publish -c Release -o publish-temp

# Copie le contenu de wwwroot à la racine du projet
Copy-Item -Recurse publish-temp\wwwroot\* .\

# Ajoute le fichier .nojekyll
New-Item -ItemType File -Path .nojekyll -Force

# Supprime les fichiers/dossiers inutiles
Remove-Item publish-temp -Recurse -Force -ErrorAction SilentlyContinue
Remove-Item BlazorStaticPrerender.staticwebassets.endpoints.json -ErrorAction SilentlyContinue
Remove-Item web.config -ErrorAction SilentlyContinue
