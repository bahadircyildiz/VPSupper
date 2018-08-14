#!/bin/bash

echo "Creating swap partition..."
# $SWAP_Q="4G"
read -p "Enter swap amount (Hit Enter for 4G)" SWAP_Q
SWAP_Q=${SWAP_Q:-4G}

fallocate -l $SWAP_Q /swapfile
chmod 600 /swapfile
mkswap /swapfile
swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
swapon -s
