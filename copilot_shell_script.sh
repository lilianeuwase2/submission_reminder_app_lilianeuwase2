#!/bin/bash
read -p "Enter the name you used during setup : " username

# Construct the directory path
main_dir="submission_reminder_${username}"

# Check if the application directory actually exists
if [ ! -d "$main_dir" ]; then
    echo "Error: Application directory '$main_dir' not found."
    echo "Please run the create_environment.sh script first."
    exit 1
fi

# Define the full path to the configuration file
CONFIG_FILE="${main_dir}/config/config.env"

# 2. Prompt the user for the new assignment name
read -p "Enter the new assignment name to check for: " new_assignment

# 3. Use the 'sed' command to find and replace the assignment name.
# The -i flag means "edit in-place" (modify the actual file).
# The expression s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/ finds the line
# starting with 'ASSIGNMENT=' and replaces the entire line.
sed -i "s/^ASSIGNMENT=.*/ASSIGNMENT=\"$new_assignment\"/" "$CONFIG_FILE"

echo "✅ Configuration updated successfully."
echo "New assignment set to: '$new_assignment'"

# 4. Rerun the startup script automatically to show the new results
echo "🚀 Rerunning the application with the new settings..."
bash "${main_dir}/scripts/startup.sh"

="submission_reminder_${username}"
