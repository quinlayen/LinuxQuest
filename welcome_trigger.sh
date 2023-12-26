#!/bin/bash

######################
# Author: Peter Faso
# Date: 12/25/2023
# Ver: .01
# Use: This script overrides the default cd command and 
#      welcomes the user upon entry of each level in the game
######################

shopt -s xpg_echo
#######################
# Set default variables
filenametime1=$(date +"%m%d%Y%H%M%S")
#######################

# SCRIPTS_FOLDER=$(pwd)
# LOGDIR=$SCRIPTS_FOLDER/log
# SHELL_SCRIPT_NAME='run'
# LOG_FILE=${LOGDIR}/${SHELL_SCRIPT_NAME}_${filenametime1}.log
#######################
# Go to script folder and run
# cd ${SCRIPTS_FOLDER}

##################################
# Set log rules
# exec > >(tee ${LOG_FILE}) 2>&1

##################################

cd() {
    builtin cd "$@" && check_level
}

# Function to check the level and display a welcome message
check_level() {
    case "$PWD" in
        /LinuxQuest/Level01)
            if [ "$LEVEL1_FIRST_VISIT" = true ]; then
                echo "Welcome to Level 1!"
                export LEVEL1_FIRST_VISIT=false
            fi
            ;;
        /LinuxQuest/Level02)
            if [ "$LEVEL2_FIRST_VISIT" = true ]; then
                echo "Welcome to Level 2!"
                export LEVEL2_FIRST_VISIT=false
            fi
            ;;
        /LinuxQuest/Level03)
            if [ "$LEVEL3_FIRST_VISIT" = true ]; then
                echo "Welcome to Level 2!"
                export LEVEL2_FIRST_VISIT=false
            fi
            ;;
    esac
}

# Export the new 'cd' function
export -f cd
