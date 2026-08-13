$baseUrl = "https://ssgmhandballclubkaranja.netlify.app"
$basePath = "d:\anway\handballwebsite-master"

# Create all needed folders
$folders = @(
    "photos",
    "pratice session",
    "diwali celebration",
    "National Tournament",
    "Dasara",
    "birthday celebration"
)

foreach ($folder in $folders) {
    $fullPath = Join-Path $basePath $folder
    if (-not (Test-Path $fullPath)) {
        New-Item -ItemType Directory -Path $fullPath -Force | Out-Null
        Write-Host "Created folder: $folder" -ForegroundColor Green
    }
}

# Photos folder images
$photos = @(
    "WhatsApp Image 2024-08-22 at 19.53.19_3bebc921.jpg",
    "logo.jpg", "devendra.jpg", "vijay.jpg", "8.jpg", "darshanrokade.jpg",
    "yogesh.jpg", "sagar.jpg", "rajesh.jpg", "rajumate.jpg", "umesh.jpg",
    "78.jpg", "877.jpg", "111.jpg", "9.jpg", "hfi.jpg", "1.jpg",
    "slide1.jpg", "slide3.jpg", "ttttt.jpg", "uy.jpg", "rahul.jpg",
    "vivekshinde.jpg", "arjun.jpg", "harsh.jpg", "devansh.jpg", "yuvansh.jpg",
    "rutuja.jpg", "sanjyot.jpg", "sakshimatode.jpg", "mohini_ghate.jpg",
    "hindavi.jpg", "samikshac.jpg", "gandu.jpg", "IMG_20240824_171840.jpg",
    "Samikasha.jpg", "krushnali.jpg", "janhavi.jpg", "munde.jpg", "siddhi.jpg",
    "prasad.jpg", "Gitesh.jpg", "yuraj.jpg", "subam.jpg", "photo.jpg",
    "handballlogo.jpg", "gphoto.jpg"
)

# Practice session files
$practice = @(
    "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg",
    "10.mp4", "8.mp4", "11.mp4", "123456.mp4", "777.mp4", "888.mp4"
)

# Diwali celebration files
$diwali = @(
    "1.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg", "9.jpg", "10.jpg", "11.jpg",
    "12.jpg", "13.jpg", "14.jpg", "15.jpg", "16.jpg", "17.jpg", "18.jpg",
    "19.jpg", "20.jpg", "21.jpg", "22.jpg", "23.jpg", "24.jpg", "25.jpg",
    "26.jpg", "27.jpg", "28.jpg", "29.jpg", "30.jpg", "31.jpg", "32.jpg", "33.jpg",
    "1.mp4"
)

# National Tournament files
$national = @("1.jpg", "2.jpg", "3.jpg", "22.jpg", "33.jpg", "1111.jpg")

# Dasara files
$dasara = @("1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg")

# Birthday celebration files
$birthday = @(
    "1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg", "6.jpg", "7.jpg", "8.jpg",
    "9.jpg", "10.jpg", "11.jpg", "12.jpg", "13.jpg", "14.jpg", "15.jpg",
    "16.jpg", "17.jpg", "18.jpg", "19.jpg", "20.jpg", "21.jpg", "22.jpg", "23.jpg"
)

function Download-File($url, $dest) {
    if (Test-Path $dest) {
        Write-Host "  SKIP (exists): $dest" -ForegroundColor Yellow
        return
    }
    try {
        Invoke-WebRequest -Uri $url -OutFile $dest -UseBasicParsing -ErrorAction Stop
        Write-Host "  OK: $dest" -ForegroundColor Green
    } catch {
        Write-Host "  FAIL: $url -> $($_.Exception.Message)" -ForegroundColor Red
    }
}

Write-Host "`n=== Downloading photos/ ===" -ForegroundColor Cyan
foreach ($img in $photos) {
    $url = "$baseUrl/photos/$img" -replace ' ', '%20'
    $dest = Join-Path $basePath "photos\$img"
    Download-File $url $dest
}

Write-Host "`n=== Downloading pratice session/ ===" -ForegroundColor Cyan
foreach ($img in $practice) {
    $url = "$baseUrl/pratice%20session/$img"
    $dest = Join-Path $basePath "pratice session\$img"
    Download-File $url $dest
}

Write-Host "`n=== Downloading diwali celebration/ ===" -ForegroundColor Cyan
foreach ($img in $diwali) {
    $url = "$baseUrl/diwali%20celebration/$img"
    $dest = Join-Path $basePath "diwali celebration\$img"
    Download-File $url $dest
}

Write-Host "`n=== Downloading National Tournament/ ===" -ForegroundColor Cyan
foreach ($img in $national) {
    $url = "$baseUrl/National%20Tournament/$img"
    $dest = Join-Path $basePath "National Tournament\$img"
    Download-File $url $dest
}

Write-Host "`n=== Downloading Dasara/ ===" -ForegroundColor Cyan
foreach ($img in $dasara) {
    $url = "$baseUrl/Dasara/$img"
    $dest = Join-Path $basePath "Dasara\$img"
    Download-File $url $dest
}

Write-Host "`n=== Downloading birthday celebration/ ===" -ForegroundColor Cyan
foreach ($img in $birthday) {
    $url = "$baseUrl/birthday%20celebration/$img"
    $dest = Join-Path $basePath "birthday celebration\$img"
    Download-File $url $dest
}

Write-Host "`n=== ALL DONE! ===" -ForegroundColor Green
Write-Host "Total images/videos attempted: $($photos.Count + $practice.Count + $diwali.Count + $national.Count + $dasara.Count + $birthday.Count)"
