Import-Module Microsoft.Graph.Users

if (!$conn) { $global:conn = Connect-MgGraph User.Read.All,Organization.Read.All,Directory.Read.All }

$users = Get-MgUser -All -Property Id,DisplayName,Mail,UserPrincipalName,UsageLocation,UserType,LicenseAssignmentStatus,AccountEnabled,Title

$users.Count

$users | Select AccountEnabled,DisplayName,UserPrincipalName,UserType,UsageLocation | FT