# PowerShell Module - Exercises

## Exercise 1 - List Modules

```powershell
Get-Module
```

```powershell
Get-Module -ListAvailable
```

```powershell
Get-Module -ListAvailable | Select Name,Version
```

## Exercise 2 - Get Module Details

```powershell
Get-Module PSReadLine -ListAvailable | Select *
```

## Exercise 3 - Search for a Module

```powershell
Find-Module Az.Accounts
Find-Module PowerShellAI
```

```powershell
Find-Module Az.Accounts | Select *
```

```powershell
Find-Module Az.Auto* | Select -First 5
```

```powershell
Find-Module -Tag azureautomation
Find-Module -Tag intune
```

```powershell
Find-Module -Tag 
```

## Exercise 3 - Installing Modules

```powershell
Install-Module ImportExcel
```

```powershell
# Note that installed module doesn't load into memory automatically
Get-Module
```

```powershell
Get-Command -Module ImportExcel
```

```powershell
# Example: check if installed first, then install for current user only

if (-not (Get-Module ImportExcel -ListAvailable)) {
	Install-Module ImportExcel -Scope CurrentUser
} else {
	Write-Host "ImportExcel is already installed"
}
```

## Exercise 4 - Module Dependencies

```powershell
Find-Module Az.Automation |
	Select-Object -ExpandProperty Dependencies
```

```powershell
Find-Module Az.Automation -RequiredVersion 1.6.0 |
	Select-Object -ExpandProperty Dependencies
```

## Exercise 5 - Create a Module

1. Create a file named ```MyDates.psm1```, in a convenient location/path. For this exercise we'll use C:\TEMP, but any path is fine.
2. Add 2 or more functions within MyDates.psm1. For example:
   
   ```powershell
   function Get-FutureDate {
	  param (
		[parameter(Mandatory)][datetime]$Date,
		[parameter()][int]$DaysInTheFuture = 0
	  )
      (Get-Date $Date).AddDays($DaysInTheFuture)
   }

   function Get-PastDate {
	  param (
		[parameter(Mandatory)][datetime]$Date,
		[parameter()][int]$DaysBack = 0
	  )
	  (Get-Date $Date).AddDays(-$DaysBack)
   }
   ```
3. Save and close the module file

```powershell
if (Test-Path "C:\TEMP\MyDates.psm1") {
	Import-Module C:\TEMP\MyDates.psm1
	Get-Module
} else {
	Write-Warning "Make sure you saved the MyDates.psm1 in the correct path."
}
```

## Exercise 6 - Create a Module Manifest

Using the same MyDates.psm1 module, we'll create a .psd1 manifest to provide additional details about your module.

```powershell
cd C:\TEMP
New-ModuleManifest -Path C:\TEMP\MyDates.psd1 -RootModule .\MyDates.psm1
```

* In Windows File Explorer, view the contents of the module directory (e.g. C:\TEMP)
* Open the new MyDates.psd1 file in your editor (Notepad, Visual Studio Code, etc.)
   
   * Notice how every line has a comment above it to explain its purpose.
   * Most properties are commented out. If you didn't specify them in step 3, they use default values.
  
* Close the file in your editor, and Delete the file MyDates.psd1.
* Repeat step 3 but include inputs for the parameters:

   Property | Value
   --|--
   Path | C:\TEMP\MyDates.psd1
   Author | (your name)
   CompanyName | Quisitive
   Copyright | 2023 Quisitive. All rights reserved
   RootModule | .\MyDates.psm1
   ModuleVersion | 1.0.0
   Description | Assorted Date Calculation Tools
   PowerShellVersion | 5.1
   Tags | Dates

```powershell
Import-Module C:\TEMP\MyDates.psd1 -Force
Get-Module MyDates | Select *
```

## Sharing Modules

Once you have created a Module, you can share it simply by placing the files in a location where others can access it.

If you only wish to share the Module with users who are connected to your organization's network, you can save it to a network file share. Other users can import the Module directlry from the file share, or download it to a local directory. Plan ahead for what will make the most sense when it comes to maintaining the Module later on (e.g. fixing bugs, adding new functions or features)/

If you wish to share your Module with the public, there are some additional considerations:

* Already a Module with the same Name
* Already a Module which covers the same features
* Do the other modules support open source contribution (e.g. GitHub)
* Do you want to allow public contribution

If you cleared all of these considerations, and still wish to make your Module available to the public, you'll need to publish it somewhere which allows for public access, such as PowerShell Gallery (aka PSGallery).

* Create a PowerShell Gallery account
* Obtain an API key from within your PS Gallery account
* Save your API key in a secure, private location (Keeper, LastPass, KeyPass, BitWarden, etc.)
* Publish your module to PowerShell Gallery