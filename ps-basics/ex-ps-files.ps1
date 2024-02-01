<#
.DESCRIPTION
	Demonstrate searching for files by various methods.
	Possible uses include cleaning up old files, renaming as backups,etc.
.PARAMETER FolderPath
	Optional. Folder to scan for files (default path is where the script file resides)
.PARAMETER Filter
	Optional. File name pattern to limit searches (default filter is '*.*')
.PARAMETER Recurse
	Optional. Include sub-folders in the search scope
.EXAMPLE
	.\ex-ps-files.ps1 -Path
#>
param (
	[parameter()][string]$Path = $PSScriptRoot,
	[parameter()][string]$Filter = "*.*",
	[parameter()][Alias("Subtree")][switch]$Recurse
)

# Add -Recurse parameter
try {
	Get-ChildItem -Path $Path -Filter $Filter -File -Recurse:$Recurse -ErrorAction Stop |
		Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension
}
catch {
	Write-Error $_.Exception.Message
}

<#
# show splatting example
@params = @{
	Path      = $Path
	Filter    = $Filter
	File      = $True
	Directory = $false
	Recurse   = $Recurse
}
Get-ChildItem @params
#>