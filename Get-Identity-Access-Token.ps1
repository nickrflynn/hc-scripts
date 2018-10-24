Write-Host "Installing CatalystDosIdentity module"

if (Get-Module -ListAvailable -Name CatalystDosIdentity) {
    Write-Host "CatalystDosIdentity module already installed"
}
else {
    Install-Module -Name CatalystDosIdentity
}

$identityUrl = "http://localhost/identity"
$clientId = "fabric-installer"
$scope = "fabric/identity.manageresources"
$secret = ""

Write-Host "Retrieving access token from Fabric.Identity"

$accessToken = Get-AccessToken -identityUrl $identityUrl -clientId $clientId -scope $scope -secret $secret

Write-Host "Access token (also copied to clipboard): $accessToken"
$accessToken | clip
