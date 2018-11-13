Write-Host "Installing CatalystDosIdentity module"

if (Get-Module -ListAvailable -Name CatalystDosIdentity) {
    Write-Host "CatalystDosIdentity module already installed"
}
else {
    Install-Module -Name CatalystDosIdentity
}

$identityUrl = "http://localhost/identity"
$clientId = ""
$clientName = ""
$scope = ""
$accessToken = ""

$body = @"
{
    "allowedGrantTypes": [
        "client_credentials"
    ],
    "allowedScopes": [
        "$scope"
    ],
    "clientId": "$clientId",
    "clientName": "$clientName",
    "enabled": true
}
"@

Write-Host "Attempting to register client $clientName with Fabric.Identity"

$clientSecret = New-ClientRegistration -identityUrl $identityUrl -body $body -accessToken $accessToken

Write-Host "Client secret (also copied to clipboard): $clientSecret"
$clientSecret | clip
