#!/bin/bash

#Global vars

# Create swap file
# $(dirname $0)/src/create_swap.sh

# Creating new Sudoer user
username=$($(dirname $0)/src/create_sudoer_user.sh)

#Install git 
# apt-get update && apt-get install -y git 

# Setup git-aware-prompt
su "$username" -c "sudo $(pwd)/src/setup_git-aware-prompt.sh $username"

# Install apt packages
# $PKGARR="git nodejs npm"

# for pkg in $PKGARR; do
#     if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
#         echo -e "$pkg is already installed"
#     else
#         if apt-get -qq install $pkg; then
#             echo "Successfully installed $pkg"
#         else
#             echo "Error installing $pkg"
#         fi
#     fi
# done

# Install Node global packages
# $NPMPKG="n yarn pm2"

# for pkg in $PKGARR; do
#     if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
#         echo -e "$pkg is already installed"
#     else
#         if apt-get -qq install $pkg; then
#             echo "Successfully installed $pkg"
#         else
#             echo "Error installing $pkg"
#         fi
#     fi
# done

# Update nodejs
# n lts 