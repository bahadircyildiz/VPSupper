#!/bin/bash

get_password(){
    read -sp "Password: " password
    read -sp "Validate Password: " passwordValidate
    if [ "$password" = "$passwordValidate" ]; then    
        passwd "$1" <<< "$password"
        echo "Username $1 created with password $password" 
    else
        echo "Both passwords $password and $passwordValidate are not matching."
        get_password $1
    fi
}

echo "Creating new Sudoer user..."
read -p "Username: " username 
useradd -m "$username"
passwd "$username"
# get_password "$username"
usermod -aG sudo "$username"