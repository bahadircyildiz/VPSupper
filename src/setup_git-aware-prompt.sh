#! /bin/bash

echo "Setting up git-aware-prompt..."
apt-get -qq install git
mkdir ~/.bash
echo git clone git://github.com/jimeh/git-aware-prompt.git ~/.bash/git-aware-prompt
sed -i "export GITAWAREPROMPT=~/.bash/git-aware-prompt" ~/.bashrc
sed -i 'source "${GITAWAREPROMPT}/main.sh\"' ~/.bashrc
sed -i 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' ~/.bashrc
source ~/.bashrc
