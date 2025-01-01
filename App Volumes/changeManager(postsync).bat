@echo off
SET log=C:\scripts\AppVolSwitch.log
SET man1=manager1.fqdn
echo %date% %time% Running script... setting regkeys... >> %log%
REG ADD HKLM\SOFTWARE\WOW6432Node\CloudVolumes\Agent /v Manager_Address /t REG_SZ /d %man1% /f 1>> %log% 2>>&1
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\svservice /v Manager1 /t REG_SZ /d %man1%:443 /f 1>> %log% 2>>&1
echo %date% %time% Stopping svservice... >> %log%
net stop svservice 1>> %log% 2>>&1
echo %date% %time% Starting svservice... >> %log%
net start svservice 1>> %log% 2>>&1