#!/usr/bin/bash
echo "welcome to the submission reminder setup"

read -p "Please enter your name:" USER_NAME

app_dir="submission_reminder_${USER_NAME}"
ECHO "Creating application directory: $app_dir"
mkdir -p "$app_dir"

cd "$app_dir" || {echo "failed to navigate to $app_dir"; exit 1; }

echo "Creating subdirectories"
mkdir --p config data scripts 

echo "Crating config/config.env"
cat << EOF > config/config.env
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
EOF

ECHO "Creating assets/submissions.txt"
cat << EOF > assets/submissions.txt
student, assignment, submission status
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
EOF

echo "Creating app/reminder.sh"
cat << EOF > app/reminder.sh
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
EOF

echo "Creating modules/functions.sh"
cat << EOF > modules/functions.sh
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
EOF

process_submissions() {
	local submission_file="$file1"
	local assignment_name="$file2"

	echo "Current Assignment: $assignment_name"
	echo "Student who have not submitted:"

   while IFS=',' read -r student_name status; do 
	status=$echo "$status" | xargs)
	if [[ "$status == "NOT_SUBMITTED" ]]; then
	   echo "- $student_name"
	fi
   done < "$submission_file"
}
EOF

echo "Creating startup.sh"
cat << EOF > startup.sh
#!/usr/bin/bash
echo "Starting the submission reminder application"
bash app/reminder.sh
echo "Application finished"

Eof

echo "making the .sh files executable"
chmod +x app/*.sh modules/*.sh startup.sh

cd - > /dev/null

