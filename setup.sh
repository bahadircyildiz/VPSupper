#! /bin/bash

#Global vars
username=""

# Create swap file
./src/create_swap.sh

# Creating new Sudoer user
./src/create_sudoer_user.sh

# Setup git-aware-prompt
su $username
./src/setup_git-aware-prompt.sh

# Install apt packages
$PKGARR = "git nodejs npm"

for pkg in $PKGARR; do
    if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
        echo -e "$pkg is already installed"
    else
        if apt-get -qq install $pkg; then
            echo "Successfully installed $pkg"
        else
            echo "Error installing $pkg"
        fi
    fi
done

# Install Node global packages
$NPMPKG = "n yarn pm2"

for pkg in $PKGARR; do
    if dpkg --get-selections | grep -q "^$pkg[[:space:]]*install$" >/dev/null; then
        echo -e "$pkg is already installed"
    else
        if apt-get -qq install $pkg; then
            echo "Successfully installed $pkg"
        else
            echo "Error installing $pkg"
        fi
    fi
done

# Update nodejs
n lts 