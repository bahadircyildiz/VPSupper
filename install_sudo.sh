#! /bin/bash

# Create swap file
$SWAP_Q = "4G"

fallocate -l $SWAP_Q /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
swapon --show

# Setup git-aware-prompt
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git
sed -i "export GITAWAREPROMPT=~/.bash/git-aware-prompt" ~/.bashrc
sed -i 'source "${GITAWAREPROMPT}/main.sh\"' ~/.bashrc
sed -i 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' ~/.bashrc
source ~/.bashrc

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