#!/bin/bash

# Function to read submissions file and output students who have not submitted
function check_submissions {
    local submissions_file=
    echo "Checking submissions in "

    # Skip the header and iterate through the lines
    while IFS=, read -r student assignment status; do
        # Remove leading and trailing whitespace
        student=
        assignment=
        status=

        # Check if assignment matches and status is 'not submitted'
        if [[ "" == "" && "" == "not submitted" ]]; then
            echo "Reminder:  has not submitted the  assignment!"
        fi
    done < <(tail -n +2 "") # Skip the header
}
EOF 

cat  <<EOF > "submission_reminder_hh/assets/submissions.txt"
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
