<#
.SYNOPSIS
	Clean up old files
.DESCRIPTION
	Get Files Older than [DaysBack] days from the current date and optionally
	delete them, as well as write the results to a log file.
.PARAMETER Path
	Optional. Folder to scan for files. Default is current location.
.PARAMETER Filter
	Optional. File name pattern to limit searches (default filter is '*.*')
.PARAMETER DaysBack
	Optional. Number of days back to ignore. The default is 90 days.
.PARAMETER Recurse
	Optional. Include sub-folders in the search scope
.PARAMETER Delete
	Optional. Delete files which match the search conditions
.PARAMETER LogOutput
	Optional. Capture a log file of the results from the search conditions when -Delete is used.
.PARAMETER LogPath
	Optional. Path and name of LogOutput file. Default is c:\temp\filename, where the filename
	default is "file_cleanup_<COMPUTERNAME>_<DATE>.log" such that <DATE> is yyyyMMddHHmm format, 
	for example: "file_cleanup_FS03_202402021345.log"
.EXAMPLE
	.\Invoke-FileCleanup.ps1 -Path d:\logs -Filter *.tmp -DaysBack 180 -Recurse
.EXAMPLE
	.\Invoke-FileCleanup.ps1 -Path d:\logs -Filter *.log -Recurse -Delete -LogOutput

	1.0.0 - 2024-02-02 - Quisitive, David Stein

	External: Insert Legal Disclaimer here.
#>
[CmdletBinding()]
param (
	[parameter()][string]$Path = "\.",
	[parameter()][string]$Filter = "*.*",
	[parameter()][int32][ValidateRange(1,366)]$DaysBack = 90,
	[parameter()][Alias("Subtree")][switch]$Recurse,
	[parameter()][switch]$Delete,
	[parameter()][switch]$LogOutput,
	[parameter()][string]$LogPath = "c:\temp\file_cleanup_$($env:COMPUTERNAME)_$(Get-Date -f 'yyyyMMddHHmm').log"
)

try {
	
	if (!(Test-Path $Path)) { throw "Path not found: $Path" }

	$CutoffDate = (Get-Date).AddDays(-$DaysBack)
	Write-Verbose "cutoff date: $CutoffDate"

	$results = [System.Collections.ArrayList]::new()

	Get-ChildItem -Path $Path -Filter $Filter -File -Recurse:$Recurse -ErrorAction SilentlyContinue |
		Where-Object {$_.LastWriteTime -lt $CutoffDate} |
			Select-Object Length,@{l='DaysOld';e={(New-TimeSpan $_.LastWriteTime (Get-Date)).Days}},FullName |
				ForEach-Object { $null = $results.Add($_) }
	
	Write-Verbose "$($results.Count) files were found"

	if ($Delete) {
		if ($LogOutput) {
			$results | Tee-Object -FilePath $LogPath | Foreach-Object {
				try {
					Remove-Item $_.FullName -Force -ErrorAction Stop
				} catch {
					Write-Warning "$($_.Exception.Message)"
				}
			}
			Write-Host "$($results.Count) files have been deleted. Refer to log: $LogPath"
		} else {
			$results
		}
	} else {
		if ($LogOutput) {
			$results | Tee-Object -FilePath $LogPath | Select-Object *
		} else {
			$results
		}
	}
}
catch {
	Write-Error $_.Exception.Message
}
