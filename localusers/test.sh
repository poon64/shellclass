#!/bin/bash
#
# This script creates a new user on the local system.
# You must supply a username as an argument to the script.
# Optionally, you can also provide a comment for the account as an argument.
# A password will be automatically generated for the account.
# The username, password and host for the account will be displayed.

# Make sure the script is being executed with superuser privileges.
if [[ "${UID}" -ne 0 ]]
then
    echo 'Please run with sudo or as root.'
    exit 1
fi

# Get the username (login).
read -p 'Enter the username to create: ' USER_NAME      # -p gives an prompt.

# Get the real name (Contents for the description field).
read -p 'Enter the name of the person or application that will use this account: ' COMMENT

# Get the password.
read -p 'Enter the password to use for the account: ' PASSWORD

# Create the account.
useradd -c "${COMMENT}" -m ${USER_NAME}

# Check to see if the useradd command succeded.
# We don't want to tell that an account was created when it hasn't been.
if [[ "${?}" -ne 0 ]]       # The ${?} holds the output from the latest command
then
    echo 'The account could not be created.'
    exit 1
fi

# Set the password.
echo ${PASSWORD} | passwd --stdin ${USER_NAME}

if [[ "${?}" -ne 0 ]]
then
    echo 'The password for the account could not be set.'
    exit 1
fi

# Force password change on first login.
passwd -e ${USER_NAME}

# Display the username, password and the host where the user was created.
echo
echo 'username: '
echo "${USER_NAME}"
echo
echo 'password: '
echo "${PASSWORD}"
echo
echo 'host: '
echo "${HOSTNAME}"
exit 0
