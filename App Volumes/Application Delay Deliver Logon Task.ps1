<#

    This script will check if the windows build is "18363" or "19045" and assign the package if the build is equal to one of them

#>


# Get the OS build number using wmic
$osBuildNumber = (wmic os get BuildNumber | Select-String -Pattern '\d+').Matches.Value

# Check the OS build number and execute commands accordingly
if ($osBuildNumber -eq '18363') {
    cd "C:\Program Files (x86)\CloudVolumes\Agent"
    $appLink = ".\svservice.exe app deliver 6c163a1d-902f-4d0b-8426-439d1962aab9"
    Invoke-Expression $appLink
}
elseif ($osBuildNumber -eq '19045') {
    cd "C:\Program Files (x86)\CloudVolumes\Agent"
    $appLink = ".\svservice.exe app deliver 6c163a1d-902f-4d0b-8426-439d1962aab9"
    Invoke-Expression $appLink
}
else {
    Write-Host "Unsupported OS build number: $osBuildNumber"
}