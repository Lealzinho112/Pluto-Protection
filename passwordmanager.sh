
#!/bin/bash

#log
logOpening(){
    echo "$(date) - PasswordManager Open" >> userlog.txt
}

logNewPass(){
    echo "$(date) - New password created" >> userlog.txt
}

logListOfPass(){
    echo "$(date) - List of passwords open" >> userlog.txt
}

#PasswordMan
passwordMan(){
    echo "================================="
    echo "1 - New password"
    echo "2 - Passwords"
    echo "3 - Exit"
    echo "================================="
    read choice
    if [ "$choice" = "1" ]
    then
        newpassword
    elif [ "$choice" = "2" ]
    then
        logListOfPass
        listofpasswords
    elif [ "$choice" = "3" ]
    then
        exit
    else
        echo "================================="
        echo "Invalid Answer"
        echo "================================="
        passwordMan
    fi
}

newpassword(){
    echo "================================="
    echo "What will be your password?"
    echo "================================="
    read password
    echo "================================="
    echo "And for what platform?"
    echo "================================="
    read platform
    echo "$platform" >> platforms.txt
    echo "$password" > $platform.txt
    logNewPass
}

listofpasswords(){
    cat platforms.txt
    echo "================================="
    echo "Choose the password that you desire to see"
    echo "================================="
    read passe
    if [ $(grep "$passe" platforms.txt | wc -l) -gt 0 ]
    then
        decryptToHex
    else
        echo "================================="
        echo "Invalid password"
        echo "================================="
        passwordMan
    fi
}

logOpening
passwordMan

