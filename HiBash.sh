#!/bin/bash

export $(grep -v '^#' .env | xargs)

clear

echo "$BASH_NAME [Version $BASH_VERSION]"

echo "(c) $BASH_AUTHOR. All right reserved. Power by Thai Minh Nguyen"

while true
do
    echo "[HiBash@$OSTYPE]"
    read -p "-> " usr_cmdinput

    case $usr_cmdinput in
        "exit")
            echo "Exit $BASH_NAME"
            break
            ;;
        "cmd")
            clear
            echo "Waiting to open Command Prompt"
            cmd.exe
            ;;
        "pwsh"|"powershell")
            clear
            echo "Waiting to open Powershell"
            pwsh
            ;;
        "clear")
            clear
            ;;
        "help")
            notepad.exe help.txt &
            ;;
        "shutdown")
            read -p "? Enter options (s, r, l, st, stc, a): " usr_cmdinputoptions
            case $usr_cmdinputoptions in
                "s")
                    shutdown -h now
                    ;;
                "r")
                    shutdown -r now
                    ;;
                "l")
                    gnome-session-quit --logout --no-prompt
                    ;;
                "st")
                    read -p "? Enter the shutdown time after command activation (second):  " shutdown_timecount
                    shutdown -h +$shutdown_timecount
                    ;;
                "stc")
                    read -p "? Enter the shutdown time after command activation (second):  " shutdown_timecount
                    read -p "? Enter the shutdown message after command activation:  " shutdown_message
                    shutdown -h +$shutdown_timecount "$shutdown_message"
                    ;;
                "a")
                    shutdown -c
                    ;;
                *)
                    echo "Invalid option"
                    ;;
            esac
            ;;
        *)
            echo "Command not found"
            ;;
    esac
done
