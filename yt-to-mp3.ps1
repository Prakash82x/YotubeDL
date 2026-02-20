param(
    [Parameter(Mandatory=$true)]
    [string]$YoutubeURL,

    [string]$OutputFolder = "$PSScriptRoot\downloads"
)

# Create output folder if not exists
if (!(Test-Path $OutputFolder)) {
    New-Item -ItemType Directory -Path $OutputFolder | Out-Null
}

Write-Host "Downloading and converting to MP3..."

.\yt-dlp.exe  `
  -x `
  --audio-format mp3 `
  --audio-quality 5 `
  --embed-metadata `
  --embed-thumbnail `
  -o "$OutputFolder\%(title)s.%(ext)s" `
  $YoutubeURL

Write-Host "Completed."
