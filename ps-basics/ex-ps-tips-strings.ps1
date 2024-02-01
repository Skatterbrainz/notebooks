$FirstName = ""

if ([string]::IsNullOrEmpty($FirstName)) {
	Write-Host "FirstName is empty or null"
}

if ([string]::IsNullOrWhiteSpace($FirstName)) {
	Write-Host "FirstName is empty or only has spaces or non-printing characters"
}

