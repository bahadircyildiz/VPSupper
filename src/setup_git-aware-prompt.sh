#!/bin/bash

echo "Setting up git-aware-prompt..."
mkdir ~/.bash
cd ~/.bash
git clone git://github.com/jimeh/git-aware-prompt.git
echo 'export GITAWAREPROMPT=~/.bash/git-aware-prompt' >>~ ~/.bashrc
echo 'source "${GITAWAREPROMPT}/main.sh\"' >> ~/.bashrc
echo 'export PS1="\${debian_chroot:+(\$debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\] \[$txtcyn\]\$git_branch\[$txtred\]\$git_dirty\[$txtrst\]\$ "' >> ~/.bashrc
cd ~
source ~/.bashrc
