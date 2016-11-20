#!/bin/bash
# Dokter's Index v0.5
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
# Config ----------------------------------------------------------------------------
DOKINDVER="0.5"
DOKINDNAM="Dokter's Index"
# -----------------------------------------------------------------------------------
while :
do
    clear
    DOKINDDIR=$(pwd)
    DOKINDLS=$(ls -1)
    echo "$DOKINDNAM v$DOKINDVER"
    echo ""
    echo "$DOKINDLS" | nl -nrz -w2 -s- | sed 's/-/ /g'
    echo "[$DOKINDDIR]"
    echo ""
    echo "   00. Move down one folder"
    echo "01-99. Move up one folder"
    echo "   QQ. Quit"
    echo ""
    read -p "Enter option: " -s -n2 DOKIND
    case "$DOKIND" in
        00)
            cd ..
        ;;
        [0-9]*)
            DOKINDCNT=$(echo "$DOKINDLS" | wc -l)
            if [ "$DOKIND" -ge "$DOKINDCNT" ]
            then
                clear
                echo "No folder with that number, Butterfingers!"
                sleep 3s
            else
                if [ "$DOKIND" = 0[1-9] ]
                then
                    DOKIND=$(echo $DOKIND | cut -c 2)
                fi
                DOKINDDIR=$(echo "$DOKINDLS" | sed "$DOKIND!d")
#                clear
#                echo "$DOKINDNAM v$DOKINDVER"
#                echo ""
#                ls -1
#                echo ""
#                read -p "Enter directory: " DOKINDDIR
                cd $DOKINDDIR
            fi
        ;;
        qq|QQ)
            clear
            break
        ;;
    esac
done
