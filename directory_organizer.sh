#!/bin/bash

# Function to create directories
create_directories() {
    for dir in "$@"; do
        if [ ! -d "$dir" ]; then
            mkdir "$dir"
            echo "Directory '$dir' created."
        else
            echo "Directory '$dir' already exists."
        fi
    done
}

# Main script
echo "Enter directory names separated by spaces:"
read -a dirs # Read multiple directory names
create_directories "${dirs[@]}" # Call the function
