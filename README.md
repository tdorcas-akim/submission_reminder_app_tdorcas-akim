#Steps to run the app:
1. Clone the repository:
#submission_reminder_app_githubusername which is the githubrepository
git clone https://github/githubusername/submission_reminder_app_githubusername.git

#2.Navigate into the repository directory
cd submission_reminder_app_githubusername
#Files created in this repository:
create_environment.sh: this script sets up the application structure.
startup.sh: this script starts the submission reminder application.

#3. Create the create_environment.sh file script
vim create_environment.sh

#4.Make the script executable
chmod +x create_environment.sh

#5.Run the script
./create_environment.sh

6. Follow the prompt message to enter your name, and the directories and files will be created automatically.

#7. Navigate to the created directory
cd submission_reminder_{name}
#Files included in the created directory:
reminder.sh: this is the main script that checks and reminds students who haven't submitted.
functions.sh: this contains the helper function that checks submissions.
submissions.txt: this contains records of student submissions.
config.env: this contains assignments details

8.Run the application:
./startup.sh

#9. Commit and Push to Github
git add .
git commit -m " "
git push
