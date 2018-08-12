#! /bin/bash

get_password(){
    read -sp "Password: " password
    read -sp "Validate Password: " passwordValidate
    if [$password = $passwordValidate]; then    
        echo passwd $1 $password
        echo "Username $1 created with password $password" 
    else
        echo "Both passwords $password and $passwordValidate are not matching."
        get_password $1
    fi
}

echo "Creating new Sudoer user...\n"
read -p "Username: " username
echo useradd $username
get_password $username
sed -i "$username   LL=(ALL:ALL) ALL" /etc/sudoers
source /etc/sudoers