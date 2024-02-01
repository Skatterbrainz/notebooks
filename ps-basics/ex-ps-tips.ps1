# --------------------- strings -----------------------

$FirstName = ""

if ([string]::IsNullOrEmpty($FirstName)) {
	Write-Host "FirstName is empty or null"
}

if ([string]::IsNullOrWhiteSpace($FirstName)) {
	Write-Host "FirstName is empty or only has spaces or non-printing characters"
}

# --------------------- dates -------------------------

$StartDate = "8/1/2024"

(Get-Date $StartDate)
(Get-Date $StartDate).DayOfWeek
(Get-Date $StartDate).ToString("MMM dd, yyyy")

# ------------------- time values --------------------

$now = (Get-Date)
$now.ToShortTimeString()

# ------------------- time spans ---------------------

$startTime = (Get-Date)
Start-Sleep -Seconds 5
$endTime = (Get-Date)

New-TimeSpan -Start $startTime -End $endTime

# ---------------------- files and folders ----------------------

$folder = Get-Item -Path "c:\git"

$folder.EnumerateDirectories()

# dir is an alias for Get-ChildItem
dir $folder.FullName -Directory

# ---------------- registry ------------------

$value = Get-ItemProperty 'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OneDriveSetup.exe' -Name 'DisplayVersion'
$value.DisplayVersion.Trim()

$value = reg query 'HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\OneDriveSetup.exe' /v DisplayVersion
$value
$value.Trim() -split "   " | Foreach-Object {$_.Trim()} | Where-Object {![string]::IsNullOrEmpty($_)} | Select-Object -Last 1

# reg add vs. New-Item / New-ItemProperty