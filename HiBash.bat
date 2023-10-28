@echo off

cls

setlocal enabledelayedexpansion

FOR /F "tokens=1* delims==" %%i IN (.env) DO (
    SET "%%i=%%j"
    IF "%%i"=="BASH_NAME" (
        SET "BASH_NAME=%%j"
    )
    IF "%%i"=="BASH_VERSION" (
        SET "BASH_VERSION=%%j"
    )
    IF "%%i"=="BASH_AUTHOR" (
        SET "BASH_AUTHOR=%%j"
    )
)

echo !BASH_NAME! [Version !BASH_VERSION!]

echo (c) !BASH_AUTHOR!. All right reserved. Power by Thai Minh Nguyen 

:loop

echo [%USERNAME%@%OS%]
set /P usr_cmdinput="-> "

IF "%usr_cmdinput%"=="exit" (
    echo Exit !BASH_NAME!
    exit /b
) ELSE IF "%usr_cmdinput%"=="cmd" (
    cls
    echo Waiting to open Command Prompt
    cmd
) ELSE IF "%usr_cmdinput%"=="pwsh" (
    cls
    echo Waiting to open Powershell
    powershell
) ELSE IF "%usr_cmdinput%"=="powershell" (
    cls
    echo Waiting to open Powershell
    powershell
) ELSE IF "%usr_cmdinput%"=="clear" (
    cls
) ELSE IF "%usr_cmdinput%"=="help" (
    start notepad.exe "help.txt"
) ELSE IF "%usr_cmdinput%"=="shutdown" (
    set /P usr_cmdinputoptions="? Enter options (s, r, l, st, stc, a): "
    IF "%usr_cmdinputoptions%"=="s" (
        shutdown /s
    ) ELSE IF "%usr_cmdinputoptions%"=="r" (
        shutdown /r
    ) ELSE IF "%usr_cmdinputoptions%"=="l" (
        shutdown /l
    ) ELSE IF "%usr_cmdinputoptions%"=="st" (
        set /P shutdown_timecount="? Enter the shutdown time after command activation (second):  "
        shutdown /s /t %shutdown_timecount%
    ) ELSE IF "%usr_cmdinputoptions%"=="stc" (
        set /P shutdown_timecount="? Enter the shutdown time after command activation (second):  "
        set /P shutdown_message="? Enter the shutdown message after command activation:  "
        shutdown /s /t %shutdown_timecount% /c %shutdown_message%
    ) ELSE IF "%usr_cmdinputoptions%"=="a" (
        shutdown /a
    ) ELSE (
        echo Invalid option
    )
) ELSE (
    echo Command not found
)

goto loop
