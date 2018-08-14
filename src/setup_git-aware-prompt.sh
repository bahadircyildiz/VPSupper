#!/bin/bash

username=$1

echo "Setting up git-aware-prompt..."
mkdir "/home/$username/.bash"
git clone git://github.com/jimeh/git-aware-prompt.git "/home/$username/.bash/git-aware-prompt"
sed -i "export GITAWAREPROMPT=/home/$username/.bash/git-aware-prompt" /home/$username/.bashrc
sed -i 'source "${GITAWAREPROMPT}/main.sh\"' /home/$username/.bashrc
sed -i 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' /home/$username/.bashrc
source /home/$username/.bashrc
