#!/bin/bash
# Dokter's Index v0.1
# Made by Dr. Waldijk
# Dokter's own file manager.
# Read the README.md for more info.
# By running this script you agree to the license terms.
# Alias -----------------------------------------------------------------------------
#DOKINDLIAS=$(cat ~/.bashrc | grep -o doktersindex)
#if [ $DOKINDLIAS != "doktersindex" ]
#then
#    DOKINDLIAS=$(pwd)
#    echo "alias doktersindex='$DOKINDLIAS/start.sh'" >> ~/.bashrc
#fi
# Comfig ----------------------------------------------------------------------------
DOKINDVER="0.1"
DOKINDNAM="Dokter's Index"
# -----------------------------------------------------------------------------------
while :
do
    clear
    DOKINDDIR=$(pwd)
    echo "$DOKINDNAM v$DOKINDVER"
    echo ""
    ls -1
    echo "Current directory: $DOKINDDIR"
    echo ""
    echo "1. Move down one folder"
    echo "2. Move up one folder (you need to enter it manually)"
    echo "Q. Quit"
    echo ""
    read -p "Enter option: " -s -n1 DOKIND
    case "$DOKIND" in
        1)
            cd ..
        ;;
        2)
            clear
            echo "$DOKINDNAM v$DOKINDVER"
            echo ""
            ls -1
            echo ""
            read -p "Enter directory: " DOKINDDIR
            cd $DOKINDDIR
        ;;
        [qQ])
            clear
            break
        ;;
    esac
done
