echo off
set "ruleName=EnableCheckMK"
set "programPath=%ALLUSERSPROFILE%\checkmk\agent\bin\cmk-agent-ctl.exe"

netsh advfirewall firewall add rule name="EnableCheckMK" dir=in action=allow program="%ALLUSERSPROFILE%\checkmk\agent\bin\cmk-agent-ctl.exe" enable=yes profile=any

echo Firewall-Regel erfolgreich hinzugefügt für %programPath%
pause
