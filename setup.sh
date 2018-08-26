#!/bin/bash

# Create swap file
echo "Do you wish to create swap file?"
select yn in "Yes" "No"; do
    case $yn in
        Yes ) $(dirname $0)/src/create_swap.sh; break;;
        No ) break;;
    esac
done

# Creating new Sudoer user
echo "Do you wish to create sudoer user?"
select is_sudoer in "Yes" "No"; do
    case $is_sudoer in
        Yes ) source $(dirname $0)/src/create_sudoer_user.sh; break;;
        No ) break;;
    esac
done

# Install git 
# apt-get update && apt-get install -y git 

# Setup git-aware-prompt
# echo "Do you wish to install git-aware-prompt?"
# select yn in "Yes" "No"; do
#     case $yn in
#         Yes )   
#             case $is_sudoer in
#                 Yes )
#                     ;;
#                 No ) read -p "Enter the user to install: " username
#                     ;;
#             esac
#             sudo -u $username "$(dirname $0)/src/setup_git-aware-prompt.sh";; 
#         No )    
#             ;;
#     esac
# done