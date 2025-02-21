#!/bin/bash
#Ask for user's name
read -p "Please enter your name: " name

#This creates the main directory
main_dir="submission_reminder_${name}"
mkdir "$main_dir"

#This creates subdirectories
mkdir "$main_dir/app"
mkdir "$main_dir/modules"
mkdir "$main_dir/assets"
mkdir "$main_dir/config"

#This creates the files
touch "$main_dir/app/reminder.sh"
touch "$main_dir/modules/functions.sh"
touch "$main_dir/assets/submissions.txt"
touch "$main_dir/config/config.env"
touch "$main_dir/startup.sh"

#This populates reminder.sh
cat << END > "$main_dir/app/reminder.sh"
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
END

#It populates functions.sh file"
cat << END > "$main_dir/modules/functions.sh"
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
END

#It populates submissions.txt file
cat << END > "$main_dir/assets/submissions.txt"
student, assignment, submission status
Chinemerem, Shell Navigation, not submitted
Chiagoziem, Git, submitted
Divine, Shell Navigation, not submitted
Anissa, Shell Basics, submitted
Naomi, Shell Permissions, submitted
Smith, Shell Loops Conditions And Parsing, not submitted
Damon, Shell Variables, submitted
Liv, Shell I/O Redirections, submitted
Nick, Emacs, not submitted
END

#It populates config.env file
cat << END > "$main_dir/config/config.env"
#This is the config file
ASSIGNMENT="Shell Navigation"
DAYS_REMAINING=2
END

#This populates startup.sh file
cat << END > "$main_dir/startup.sh"
#!/bin/bash

#This launch the submission_reminder_app
echo "Launching the submission reminder app.."

echo "Please wait while we set everything up.."
./app/reminder.sh
END

#Let's make the scripts executable
chmod +x "$main_dir/app/reminder.sh"
chmod +x "$main_dir/modules/functions.sh"
chmod +x "$main_dir/startup.sh"
