#!/bin/bash

# This script calculates the number of days based on the user's age in years.

# Prompt the user to enter their age in years
read -p "Enter your age in years: " age_years

# Check if the input is a valid number using regex
if [[ ! $age_years =~ ^[0-9]+$ ]]; then
    echo "Error: Please enter a valid number."
    exit 1  # Exit the script with an error code
fi

# Calculate the number of days
age_days=$((age_years * 365))

# Display the result
echo "You are approximately $age_days days old."

# New function for system monitoring (updates and errors)
system_monitor() {
    echo "System Monitoring Report:"
    echo "-------------------------"

    # Check for system updates
    echo "Checking for system updates..."
    updates=$(apt list --upgradable 2>/dev/null | grep -v "Listing..." | wc -l)

    if [ $? -ne 0 ]; then
        echo "Error: Failed to check for updates."
        exit 1
    fi

    if [ "$updates" -gt 0 ]; then
        echo "There are $updates updates available."
    else
        echo "Your system is up to date."
    fi

    # Check for failed services
    echo "Checking for failed services..."
    failed_services=$(systemctl --failed --quiet | wc -l)

    if [ $? -ne 0 ]; then
        echo "Error: Failed to check system services."
        exit 1
    fi

    if [ "$failed_services" -gt 0 ]; then
        echo "$failed_services services are currently failed."
    else
        echo "No failed services detected."
    fi
}

# Ask for system monitoring
echo "Would you like to check for system updates and errors? (y/n)"
read response
if [[ "$response" == "y" || "$response" == "Y" ]]; then
    system_monitor
else
    echo "Skipping system monitoring."
fi
