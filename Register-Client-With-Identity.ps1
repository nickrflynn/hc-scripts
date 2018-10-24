Write-Host "Installing CatalystDosIdentity module"

if (Get-Module -ListAvailable -Name CatalystDosIdentity) {
    Write-Host "CatalystDosIdentity module already installed"
}
else {
    Install-Module -Name CatalystDosIdentity
}

$identityUrl = "http://localhost/identity"
$clientId = "catalog-service"
$clientName = "Catalog Service"
$scope = "dos/catalogs"
$accessToken = ""

$body = @"
{
    "accessTokenLifetime": 1200,
    "allowedGrantTypes": [
        "implicit"
    ],
    "allowOfflineAccess": true,
    "allowedScopes": [
        "$scope"
    ],
    "claims": [
        "name",
        "email",
        "role",
        "groups"
    ],
    "clientId": "$clientId",
    "clientName": "$clientName"
}
"@

Write-Host "Attempting to register client $clientName with Fabric.Identity"

$clientSecret = New-ClientRegistration -identityUrl $identityUrl -body $body -accessToken $accessToken

Write-Host "Client secret (also copied to clipboard): $clientSecret"
$clientSecret | clip
