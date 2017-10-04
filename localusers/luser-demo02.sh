#!/bin/bash

# Display the UID and username of the user executing this script. 
# Display if the user is root or not. 

# Display the UID of the current user 
echo  "Your UID is ${UID}"      # UId is a preset variable in bash

# Display the username. 
USER_NAME=$(id -un)
echo "You username is ${USER_NAME}" 
# Another older way to do the same thing
# USER_NAME=`id -un`  # `` is called back tick marks
# echo "You username is ${USER_NAME}" 

# Dsiplay if the user is the root user or not. 
# UID for root is always 0
if [[ "${UID}" -eq 0 ]]
then 
    echo 'You are root.'
else 
    echo 'You are not root'
fi