#!/bin/bash 

# This script generates a list of random passwords. 

# A random number as a password. 
PASSWORD="${RANDOM}"
echo "${PASSWORD}"

# Three random numbers
PASSWORD="${RANDOM}${RANDOM}${RANDOM}"
echo "${PASSWORD}" 

# Use the current date/time aas the password. 
PASSWORD=$(date +%s)    # %s gives the UNIX time in seconds
echo "${PASSWORD}" 

# Use the nanoseconds to act as randomization. 
PASSWORD=$(date +%s%N)    # %N gives nanoseconds
echo "${PASSWORD}" 

# A better password. 
PASSWORD=$(date +%s%N | sha256sum | head -c32) 
echo "${PASSWORD}" 

# An even better password. 
PASSWORD=$(date +%s%N${RANDOM}${RANDOM}${RANDOM} | sha256sum | head -c48)
echo "${PASSWORD}" 

# Append a special character to the password. 
SPECIAL_CHARACTER=$(echo '!@#%&*=()-_+=/]' | fold -w1 | shuf | head -c1)
echo "${PASSWORD}${SPECIAL_CHARACTER}"
