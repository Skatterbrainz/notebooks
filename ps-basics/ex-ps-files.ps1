<#
.DESCRIPTION
	Demonstrate searching for files by various methods.
	Possible uses include cleaning up old files, renaming as backups,etc.
.PARAMETER FolderPath
.PARAMETER Filter
#>
param (
	[parameter()][string]$FolderPath = $PSScriptRoot,
	[parameter()][string]$Filter = "*.*"
)

# Show default properties. Also explain display output vs. pipeline output
Get-ChildItem -Path $FolderPath -Filter $Filter -File

# Show all properties
#Get-ChildItem -Path $FolderPath -Filter $Filter -File | Select-Object *

# Filter return data
#Get-ChildItem -Path $FolderPath -Filter $Filter -File | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension

# Add -Recurse parameter
#Get-ChileItem -Path $FolderPath -Filter $Filter -File -Recurse:$Recurse | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension
