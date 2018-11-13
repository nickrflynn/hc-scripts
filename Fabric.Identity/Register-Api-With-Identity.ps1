Write-Host "Installing CatalystDosIdentity module"

if (Get-Module -ListAvailable -Name CatalystDosIdentity) {
    Write-Host "CatalystDosIdentity module already installed"
}
else {
    Install-Module -Name CatalystDosIdentity
}

$identityUrl = "http://localhost/identity"
$name = ""
$scope = ""
$accessToken = ""

$body = @"
{
    "enabled": true,
    "name": "$name",
    "scopes": [
        {
            name: "$scope",
            displayName: "Catalog"
        }
    ],
    "userClaims": [
        "name",
        "email",
        "role",
        "groups"
    ]
}
"@

Write-Host "Attempting to register API $name with Fabric.Identity"

$apiSecret = New-ApiRegistration -identityUrl $identityUrl -body $body -accessToken $accessToken

Write-Host "API secret (also copied to clipboard): $apiSecret"
$apiSecret | clip
