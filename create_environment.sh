#!/bin/bash
echo "welcome to the submission reminder app  setup"
#Prompting the user for their name
read -p "Please enter your name:" username

#creating the main directory named submission_reminder_username

main_dir="submission_reminder_${username}"

echo "Creating application directory: $main_dir"
mkdir "$main_dir"

#Creating the subdirectories
echo "Creating subdirectories"
mkdir -p "$main_dir/app"
mkdir -p "$main_dir/modules"
mkdir -p "$main_dir/assets"
mkdir -p "$main_dir/config"
echo "directory structure created"
#creating and populating the files

echo "Creating config/config.env"

cat << EOL > "$main_dir/config/config.env"
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOL

echo "Creating assets/submissions.txt"
cat << EOL > "$main_dir/assets/submissions.txt"
student, assignment, sustatus
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Keilla, Git, submitted
Ruth, Shell navigation, not submitted
Patty, Git, not submitted
Mutoni, Shell basics, not submitted
Justine, Shell navigation, not submitted
Winnie, Shell navigation, not submitted
EOL

echo "Creating app/reminder.sh"
cat << EOL > "$main_dir/app/reminder.sh"
#!/bin/bash

# Source environment variables and helper functions
source ./config/config.env
source ./modules/functions.sh

# Path to the submissions file
submissions_file="./assets/submissions.txt"

# Print remaining time and run the reminder function
echo "Assignment: $ASSIGNMENT"
echo "Days remaining to submit: $DAYS_REMAINING days"
echo "--------------------------------------------"

check_submissions $submissions_file
EOL

cat << EOL > "$main_dir/modules/functions.sh"
#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=$1
    echo "Checking submissions in $submissions_file"

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=$(echo "$student" | xargs)
        assignment=$(echo "$assignment" | xargs)
        status=$(echo "$status" | xargs)

        # Check if assignment matches and status is 'not submitted'
        if [[ "$assignment" == "$ASSIGNMENT" && "$status" == "not submitted" ]]; then
            echo "Reminder: $student has not submitted the $ASSIGNMENT assignment!"
        fi
    done < <(tail -n +2 "$submissions_file") # Skip the header
}
EOL 

cat << EOL > "$main_dir/startup.sh"
#!/bin/bash
Start the reminder application
SCRIPT_DIR="$(dirname "$0")"
bash "$SCRIPT_DIR/reminder.sh"
EOL

# Make all .sh scripts executable
chmod +x "$main_dir/scripts"/*.sh

# Confirm setup complete
echo "Environment setup complete. Run startup.sh to begin."
echo "Path: $main_dir/scripts/startup.sh"

