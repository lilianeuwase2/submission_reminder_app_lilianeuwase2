# this is  a readme file that  contains the explainations on how the Submission Reminder application was run using mainly the create_environment.sh and copilot_shell_script.sh scripts 

#the purpose of the application is to check the list of student submission for a certain assignment and check for the student who have not yet submitted their assignment

#the project shows proficiency in writing and executing shell scripts and automating tasks such as directory creation and file maniputation

#the repository contains the files 
   create_environmet.sh file which is a shell script that sets up the directory structure for the application , populates the files with data and updates permissions  for the .sh files

  copilot_shell_script.sh which is the script that allows the user to change the assignment to change the assignmemt which is being checked for 
  README.md which is the files that contains instruction on how to run the application

#How to use the application 
    step 1 : clone the repository 
           using git clone command 
           change the directory to your repository name 
    
    step 2 : Creating the application environment
           run the create_environment script and the script will ask you to enter your name in order to create the main directory for the app 

   step 3 :once the environment is created the change the directory into the created one and run the startup.sh script 
  
   after running the startup.sh script the application will run and show the list of students who have not submitted the "Shell Navigaation" assignment . this happens when you are running the startup.sh script for the first time 

#to check for the other assignments which are not submitted yet here we use the copilot_Shell_script.sh script 
   here is how to change it 
    
step 1: go back to the parent directory 
step 2: run the copilot script using bash 
step 3: after running the script you will be asked to enter a name you used when setting up the environment and the new assigment name you want to check 

this project was developed using two branches 
where feature/setup was for the rough work and the branch master for my final work 


