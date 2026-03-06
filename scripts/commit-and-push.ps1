# Commit and push script for Windows PowerShell
# Usage: Open PowerShell in the repo root and run: .\scripts\commit-and-push.ps1

param(
    [string]$Branch = 'main'
)

Write-Host "Staging renamed files..."
git add -A

if ($LASTEXITCODE -ne 0) {
    Write-Error "git add failed. Ensure git is installed and you're in the repo root."
    exit 1
}

Write-Host "Committing..."
git commit -m "Rename folder to lowercase for GitHub Pages path"

if ($LASTEXITCODE -ne 0) {
    Write-Warning "No changes to commit or commit failed."
} else {
    Write-Host "Pushing to origin/$Branch..."
    git push origin $Branch

    if ($LASTEXITCODE -ne 0) {
        Write-Error "git push failed. Check remote and authentication."
        exit 1
    }
    Write-Host "Done."
}
