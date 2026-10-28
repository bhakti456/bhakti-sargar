<#
.SYNOPSIS
  Automated Vercel Deployment Script for PhishDojo
.DESCRIPTION
  Deploys PhishDojo directly to Vercel using the Vercel REST API (no Node.js or Vercel CLI required).
.EXAMPLE
  .\deploy-vercel.ps1 -Token "YOUR_VERCEL_TOKEN"
#>

param(
  [Parameter(Mandatory=$false)]
  [string]$Token,

  [Parameter(Mandatory=$false)]
  [string]$ProjectName = "phishdojo"
)

$ErrorActionPreference = "Stop"

Write-Host "====================================================" -ForegroundColor Cyan
Write-Host "🥋 PhishDojo - Vercel Direct Deployer" -ForegroundColor Cyan
Write-Host "====================================================" -ForegroundColor Cyan

# 1. Acquire Token
if (-not $Token) {
  $Token = $env:VERCEL_TOKEN
}

if (-not $Token) {
  Write-Host "`nTo deploy directly via API, you need a Vercel Access Token." -ForegroundColor Yellow
  Write-Host "Get one in 10 seconds at: " -NoNewline
  Write-Host "https://vercel.com/account/tokens" -ForegroundColor Green
  $Token = Read-Host "`nEnter your Vercel Token"
}

if (-not $Token -or $Token.Trim() -eq "") {
  Write-Error "No Vercel token provided. Deployment aborted."
  exit 1
}

$Token = $Token.Trim()

# 2. Files to deploy
$rootDir = $PSScriptRoot
$targetFiles = @("index.html", "vercel.json", "README.md")
$filesPayload = @()

Write-Host "`n[1/3] Preparing files..." -ForegroundColor Gray

foreach ($fileName in $targetFiles) {
  $filePath = Join-Path $rootDir $fileName
  if (-not (Test-Path $filePath)) {
    Write-Warning "File $fileName not found, skipping."
    continue
  }

  $bytes = [System.IO.File]::ReadAllBytes($filePath)
  $sha1 = (Get-FileHash -Algorithm SHA1 -Path $filePath).Hash.ToLower()
  $size = $bytes.Length

  Write-Host " -> Uploading $fileName ($size bytes)..." -NoNewline

  # Upload to Vercel File Store
  $uploadHeaders = @{
    "Authorization" = "Bearer $Token"
    "Content-Type"  = "application/octet-stream"
    "x-vercel-digest" = $sha1
    "Content-Length" = "$size"
  }

  try {
    $uploadRes = Invoke-RestMethod -Uri "https://api.vercel.com/v2/files" -Method Post -Headers $uploadHeaders -Body $bytes
    Write-Host " [OK]" -ForegroundColor Green
  } catch {
    # If 409 conflict, file already exists in cache, which is completely normal on Vercel
    if ($_.Exception.Response.StatusCode -eq 409) {
      Write-Host " [Cached]" -ForegroundColor DarkGreen
    } else {
      Write-Host " [Error: $($_.Exception.Message)]" -ForegroundColor Red
      throw $_
    }
  }

  $filesPayload += @{
    file = $fileName
    sha  = $sha1
    size = $size
  }
}

# 3. Create Deployment
Write-Host "`n[2/3] Triggering Vercel deployment for '$ProjectName'..." -ForegroundColor Cyan

$deployPayload = @{
  name = $ProjectName
  files = $filesPayload
  projectSettings = @{
    framework = $null
  }
} | ConvertTo-Json -Depth 5

$deployHeaders = @{
  "Authorization" = "Bearer $Token"
  "Content-Type"  = "application/json"
}

try {
  $deployResponse = Invoke-RestMethod -Uri "https://api.vercel.com/v13/deployments" -Method Post -Headers $deployHeaders -Body $deployPayload
  $deploymentUrl = "https://$($deployResponse.url)"
  
  Write-Host "`n[3/3] Deployment initiated successfully!" -ForegroundColor Green
  Write-Host "----------------------------------------------------" -ForegroundColor Cyan
  Write-Host "🚀 Live URL:        $deploymentUrl" -ForegroundColor Yellow
  if ($deployResponse.alias -and $deployResponse.alias.Count -gt 0) {
    Write-Host "🌐 Production Alias: https://$($deployResponse.alias[0])" -ForegroundColor Green
  }
  Write-Host "📊 Vercel Dashboard: https://vercel.com" -ForegroundColor Gray
  Write-Host "----------------------------------------------------" -ForegroundColor Cyan
} catch {
  Write-Host "`nDeployment failed: $($_.Exception.Message)" -ForegroundColor Red
  if ($_.ErrorDetails) {
    Write-Host "Details: $($_.ErrorDetails.Message)" -ForegroundColor Red
  }
  exit 1
}
