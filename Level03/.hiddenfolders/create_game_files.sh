#!/bin/bash

# Array of possible file extensions
extensions=("txt" "log" "dat" "cfg" "page")

# Create 10 folders
for i in {1..10}; do
    folder_name="ispasswordhere$i"
    mkdir -p "$folder_name"
    
    # Generate 5-10 random files
    num_files=$((RANDOM % 6 + 5))
    for j in $(seq 1 $num_files); do
        file_size=$((RANDOM + 1024))
        file_extension=${extensions[$RANDOM % ${#extensions[@]}]}
        dd if=/dev/urandom of="${folder_name}/file$j.$file_extension" bs=1 count=$file_size 2>/dev/null
    done
done

# Create the specific file
special_folder=$((RANDOM % 10 + 1))
dd if=/dev/urandom of="ispasswordhere${special_folder}/file6.txt" bs=1 count=1056 2>/dev/null
chgrp group2 "ispasswordhere${special_folder}/file6.txt"

