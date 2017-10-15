#!/bin/bash 

# Demonstrate the use of while and loops. 

# Display the first three parameters. 
# while [[ true ]]; do echo ${RANDOM}; sleep 1; done # This will execute random number every 1 sec.
echo "Parameter 1: ${1}"
echo "Parameter 2: ${2}"
echo "Parameter 3: ${3}"
echo 

# Loop through all the positional parameters. 
while [[ "${#}" -gt 0 ]]
do
    echo "Number of parameters: ${#}"
    echo "Parameter 1: ${1}"
    echo "Parameter 2: ${2}"
    echo "Parameter 3: ${3}"
    echo 
    shift
    done