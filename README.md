
Pour toute modification, relancez simplement le script `deploy.ps1` puis poussez les changements.

# GitHub Pages Deployment for Blazor WebAssembly

This project demonstrates how to deploy a static Blazor WebAssembly application to GitHub Pages.

## Prerequisites
- .NET 9 SDK installed
- A configured GitHub repository

## Deployment Steps

1. **Generate static files**

Run the following PowerShell script at the root of the project:
./deploy.ps1
This script:
- Publishes the project to a temporary folder
- Copies the static content to the project root
- Adds the `.nojekyll` file
- Cleans up unnecessary files

2. **Push to GitHub**

- Commit and push all generated files to the branch used by GitHub Pages `main` .

3. **Configure GitHub Pages**

- Go to your repository settings → Pages
- Select the branch `main` and the folder `/docs` (root)

4. **Access your site**

Your site will be available at:https://<your-username>.github.io/<repo-name>/
## Notes
- The `.nojekyll` file is required so GitHub Pages serves files starting with `_`.
- Client-side routing is supported thanks to the `404.html` file which redirects to `index.html`.
- The `<base href="/repo-name/">` in `index.html` must match your GitHub repository name.

---

For any changes, simply rerun the `deploy.ps1` script and push the updates.
