#!/bin/bash
FileP="Invalid"

fileVerificationPlutoProtection(){
    cd Pluto-Protection
    if [ -f "userslog.txt" ]
    then
        if [ -f "platforms.txt"]
        then
            FileP="Valid"
        else
            touch platforms.txt
            fileVerificationPlutoProtection
        fi
    else
        touch userslog.txt
        fileVerificationPlutoProtection
    fi
}

fileVerificationPlutoProtection
if [ "$FileP"="Valid" ]
then
    ./passwordManager
else
    echo "Unexpected error.... Cloosing..."
    exit
fi


