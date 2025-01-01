# Set the password File location
param (
    [string]$SecurePasswordFilePath = '.\SecurePassword.xml'
)

# Get the password from the user
$RESTAPIPassword = Read-Host -Prompt "Enter the REST API password" -AsSecureString

# Convert the secure password to plain text
$PlainTextPassword = [System.Runtime.InteropServices.Marshal]::PtrToStringAuto([System.Runtime.InteropServices.Marshal]::SecureStringToBSTR($RESTAPIPassword))

# Encrypt the password and save it to a file
$SecurePassword = ConvertTo-SecureString -String $PlainTextPassword -AsPlainText -Force
$SecurePassword | Export-CliXml -Path $SecurePasswordFilePath