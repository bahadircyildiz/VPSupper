#!/bin/bash

# get_password(){

#     if [[ $(passwd "$1") == "0" ]]; then
#         echo "Username $1 created with password set" 
#     else
#         get_password $1
#     fi
# }

echo "Creating new Sudoer user..."
read -p "Username: " username 
useradd -m "$username"
# get_password "$username"
passwd "$username"
usermod -aG sudo "$username"