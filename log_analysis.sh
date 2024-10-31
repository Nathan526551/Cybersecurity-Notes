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


