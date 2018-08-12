#! /bin/bash

echo "Creating swap partition...\n"
$SWAP_Q = "4G"

echo fallocate -l $SWAP_Q /swapfile
echo chmod 600 /swapfile
echo mkswap /swapfile
echo swapon /swapfile
echo '/swapfile none swap sw 0 0' | tee -a /etc/fstab
echo swapon --show
