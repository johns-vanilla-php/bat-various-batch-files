:: ssh-keygen.bat
:: Version 1.0
:: Created: 9/5/2022
:: Author: John Stuttler
:: https://github.com/johns-vanilla-php
:: Purpose -
::   Automates the process of generating a pair of SSH keys.
::   Guides the end-user on the installation of the public key to Github
::   Guides the end-user on creating a Personal Access Token
::   Automatically updates the ~/.ssh/config file
::   Automatically updates the ~/.ssh/known_hosts file
::   Automatically saves the key information into the ~/.ssh/readme.txt file

@ECHO OFF
TITLE Create SSH Key

:: Define Screen Colors ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Setting color requires 2 digits...the first is the background color, and the other is text color
: Colors:
::   00 = Black       08 = Gray
::   01 = Blue        09 = Light Blue
::   02 = Green       0A = Light Green
::   03 = Aqua        0B = Light Aqua
::   04 = Red         0C = Light Red
::   05 = Purple      0D = Light Purple
::   06 = Yellow      0E = Light Yellow
::   07 = White       0F = Bright White
SET normColor=0B
SET errColor=0C
color %normColor%

:: Github User Name ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:User-Prompt
cls
color %normColor%
SET /P githubuser=Github User Name:
IF not defined githubuser GOTO Msg1

:: Define SSH File Name ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:File-Prompt
cls
color %normColor%
SET /P filename=Filename:
IF not defined filename GOTO Msg2

:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Email-prompt
cls
color %normColor%
SET /P email=Github Email:
IF not defined email GOTO Msg3

:: Generate SSH Key ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Keygen
color %normColor%
cls
echo Creating the SSH Keys
echo.
ssh-keygen -f %UserProfile%\.ssh\%filename% -t ed25519 -b 4096 -C "%email%"

:: Prompt for Fingerprint ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:FingerPrint
SET /P fingerprint=Copy the above key fingerprint and paste it here:
clip < %UserProfile%\.ssh\%filename%.pub

:: Prompt for Passphrase Used ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P passphrase=Enter the passphrase that you used when creating the key.  This can be blank:
IF not defined passphrase GOTO EmptyPassphrase
GOTO OpenURLs

:: Set Passphrase to *blank* if it was left empty ::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:EmptyPassphrase
SET passphrase=*empty*

:: Open Github URLs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:OpenURLs
cls
echo Two web pages will open in Firefox.
echo.
echo You need to add the public key in one of those tabs.
echo   - This key is currently saved in your clipboard.
echo.
echo After you have created the public key, open the other tab to create a new Public Access Token (PAT).
echo   - Copy the PAT to your clipboard.
echo.
echo Once you are done, return to this window.
pause
echo.
start firefox.exe https://github.com/settings/ssh/new
start firefox.exe https://github.com/settings/tokens/new

:: Prompt for Personal Access Token ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
SET /P PAT=Paste the PAT from GitHub (https://github.com/settings/tokens/new) here:

:: Open Github URLs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:SAVE
cls
cd %UserProfile%\.ssh\

:: Open Github URLs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:readme-file
echo. >> readme.txt
echo github.com/%githubuser%>> readme.txt
echo   Github email: %email%>> readme.txt
echo   Public Key:   %filename%.pub>> readme.txt
echo   Passphrase:   %passphrase%>> readme.txt
echo   Fingerprint:  %fingerprint%>> readme.txt
echo   Access Token: %PAT%>> readme.txt
echo Important information regarding this key has been saved to %UserProfile%\.ssh\readme.txt
echo.

:: Open Github URLs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:config-file
echo. >> config
echo. >> config
echo Host *>> config
echo   AddKeysToAgent yes>> config
echo   IdentityFile ~/.ssh/%githubuser%>> config
echo Your config file has been updated %UserProfile%\.ssh\config
echo.

:: Open Github URLs ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: Github Account (email) ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
set /p Build=<%filename%.pub
echo github.com %build%>> known_hosts
echo Your known_hosts file has been updated %UserProfile%\.ssh\known_hosts
echo.
echo.
echo Your new SSH keys have been installed!
echo You may close this window.
echo A backup of this information can be found in %UserProfile%\.ssh\readme.txt for future reference.
pause
GOTO exit

:: Error Message - Missing User Name :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Msg1
cls
SET gt=User-Prompt
color %errColor%
echo The Github User Name is REQUIRED
GOTO ErrMsg

:: Error Message - Missing SSH Key Filename ::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Msg2
cls
SET gt=File-Prompt
color %errColor%
echo The SSH Key Filename is REQUIRED
GOTO ErrMsg

:: Error Message - Missing Github Email Address ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:Msg3
cls
SET gt=Email-Prompt
color %errColor%
echo The Github email address is REQUIRED
GOTO ErrMsg

:: Error Message - Missing Github Email Address ::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:: :::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
:ErrMsg
pause
GOTO %gt%

:: Prompt to see if the user wants to create another key. ::::::::::::::::::::::::::::::::::::::::::::::
: exit
set /p another=Do you want to generate another key? ([y]es / [n]o)
if another
cls
echo This script has completed and will now close.
pause
