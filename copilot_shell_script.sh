#!/bin/bash
read -p "Enter the name you used during setup : " username

main_dir="submission_reminder_${username}"


if [ ! -d "$main_dir" ]; then
    echo "Error, Application directory $main_dir not found"
    echo "Please make sure that you are in the correct parent directory and  run the create_environment.sh script"
    exit 1
fi

CONFIG_FILE="${main_dir}/config/config.env"

read -p "Enter the new assignment name to check for: " new_assignment 

if [ -z "$new_assignment" ]; then 
   echo "No assignment name entered"
   exit 1
fi 

sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$CONFIG_FILE"

echo "Configuration updated successfully."
echo "New assignment set to: '$new_assignment'"

echo "Re-running the application with new submission status"
bash "${main_dir}/startup.sh"

