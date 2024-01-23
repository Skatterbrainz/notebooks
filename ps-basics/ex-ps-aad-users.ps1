<#
.DESCRIPTION
	Export AzureAD(EntraID) user accounts with PowerShell and MS Graph API
#>

# import module
Import-Module Microsoft.Graph.Authentication

# connect to graph api
# query for all users
# query for users by filter
# query for one user by Id
# query for one user by UPN

<#
****************************************
NOTE: Move this to another screen !!!!
****************************************

param (
	[parameter()][string]$Id,
	[parameter()][string]$DisplayName,
	[parameter()][string]$UserPrincipalName
)

Import-Module Microsoft.Graph.Authentication

$conn = Connect-MgGraph -Scopes Directory.Read.All,User.Read.All,Group.Read.All,GroupMember.Read.All

if (![string]::IsNullOrEmpty($Id)) {
	
	Get-MgUser -UserId $Id

} elseif (![string]::IsNullOrEmpty($DisplayName)) {
	
	Get-MgUser -Filter "DisplayName eq '$DisplayName'"

} elseif (![string]::IsNullOrEmpty($UserPrincipalName)) {
	
	Get-MgUser -Filter "UserPrincipalName eq '$UserPrincipalName'"

} else {

	Get-MgUser -All
	
}
#>