<#
.DESCRIPTION
	Demonstrate searching for files by various methods.
	Possible uses include cleaning up old files, renaming as backups,etc.
.PARAMETER FolderPath
	Folder to scan for files (default is path where script resides)
.PARAMETER Filter
	File name pattern to limit searches (default is *.*)
.EXAMPLE
	.\ex-ps-files.ps1 -Path
#>
param (
	[parameter()][string]$Path = $PSScriptRoot,
	[parameter()][string]$Filter = "*.*",
	[parameter()][Alias("Subtree")][switch]$Recurse
)

# Show default properties. Also explain display output vs. pipeline output
Get-ChildItem -Path $Path -Filter $Filter -File

# Show all properties
#Get-ChildItem -Path $Path -Filter $Filter -File | Select-Object *

# Filter return data
#Get-ChildItem -Path $Path -Filter $Filter -File | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension

# Add -Recurse parameter
#Get-ChildItem -Path $Path -Filter $Filter -File -Recurse:$Recurse | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension

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