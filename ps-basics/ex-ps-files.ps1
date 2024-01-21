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

Get-ChildItem -Path $FolderPath -Filter $Filter -File
#Get-ChildItem -Path $FolderPath -Filter $Filter -File | Select-Object *
#Get-ChildItem -Path $FolderPath -Filter $Filter -File | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension
#Get-ChileItem -Path $FolderPath -Filter $Filter -File -Recurse:$Recurse | Select-Object Name,FullName,Length,CreationTime,LastWriteTime,Extension