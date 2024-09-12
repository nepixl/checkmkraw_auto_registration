@echo off

if exist c:\service\checkMK_registration_successful.txt goto EOF

set CMKPFAD=C:\ProgramData\checkmk\agent\bin
set CMKUSER=<automationUser>
set CMKPASS<=GeneratedSecret>

for /f %%i in ('hostname') do set "HOSTNAME_FULL=%%i"
set CMKNAME=%HOSTNAME_FULL%
set CMKSERVER=<checkmk.host.tld:8001>
set CMKSITE=<sitename>
set CMKPROT=http
@echo off & SETLOCAL ENABLEEXTENSIONS ENABLEDELAYEDEXPANSION
echo %CMKNAME%

echo [ CheckMK Registrierung für Client: %HOSTNAME_FULL% ] >> C:\service\checkMK_registration_successful.txt
echo Datum: %date% -%time% >> C:\service\checkMK_registration_successful.txt
echo. >> C:\service\checkMK_registration_successful.txt

echo "%CMKPFAD%\cmk-agent-ctl.exe" register -H %CMKNAME% -U %CMKUSER% -P %CMKPASS% -s %CMKSERVER% -i %CMKSITE% --trust-cert >> C:\service\checkMK_registration_successful.txt
echo. >> C:\service\checkMK_registration_successful.txt
"%CMKPFAD%\cmk-agent-ctl.exe" register -H %CMKNAME% -U %CMKUSER% -P %CMKPASS% -s %CMKSERVER% -i %CMKSITE% --trust-cert >> C:\service\checkMK_registration_successful.txt
echo. >> C:\service\checkMK_registration_successful.txt

echo Stoppe CheckmkService
net stop CheckmkService >> C:\service\checkMK_registration_successful.txt

echo Starte CMKAgent
net start CheckmkService >> C:\service\checkMK_registration_successful.txt

goto :EOF
