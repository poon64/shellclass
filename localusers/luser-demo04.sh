#!/bin/bash 
# This script creates an account on the local system. 
# You will be prompted for the account name and password. 

# Ask for the user name. 
read -p 'Enter the user name to create: ' USER_NAME

# Ask for the real name. 
read -p 'Enter the real name of the person who this account is for: ' COMMENT

# Ask for the password. 
read -p 'Enter the password to use for this account: ' PASSWORD

# Create the user.
useradd -c "${COMMENT}" -m ${USER_NAME}        # Use "" to allow for spaces in the comment

# Set the password for the user. 
echo ${PASSWORD} | passwd --stdin ${USER_NAME}  # --stdin is absent in Ubuntu

# Force the user to change password at firt login. 
passwd -e ${USER_NAME}