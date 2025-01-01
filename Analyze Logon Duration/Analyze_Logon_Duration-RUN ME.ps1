$SessionID = (Get-Process -PID $pid).SessionID
$DomainUser =(Get-WMIObject -ClassName Win32_ComputerSystem).Username
& ((Split-Path $MyInvocation.InvocationName) + "\Analyze_Logon_Duration.ps1") -DomainUser $DomainUser -SessionID $SessionID