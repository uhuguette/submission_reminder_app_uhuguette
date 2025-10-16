
 📝 Submission Reminder App

Overview
The Submission Reminder App is a Bash-based tool designed to help instructors and students keep track of assignment submissions. It automatically identifies students who have not submitted their assignments and displays reminders, along with the remaining days to submit.

 How the App Works
1.Setup  
   When the setup script ('create_environment.sh') is run, it prompts the user for their name and creates a personalized folder containing:
   - 'app/' for the main script
   - 'modules/' for reusable functions
   - 'assets/' for student submission data
   - 'config/' for assignment settings
   - 'startup.sh' to launch the app

2.Launching the App  
   The user runs './startup.sh', which:
   - Loads the configuration ('config.env') to know the current assignment and remaining days.
   - Loads helper functions from 'functions.sh'.

3.Checking Submissions 
   The 'check_submissions() function reads 'submissions.txt' and identifies students who haven’t submitted the assignment.  
   - It skips the header line, reads each record, and compares the assignment and submission status.  
   - If a student has not submitted, the app prints a reminder for that student.

4.Dynamic Assignment Updated  
   Another script can prompt the user to select a different assignment. It updates 'config.env` and reruns the reminder script to reflect the new assignment.

5.Output  
   The app prints:
   - Assignment name  
   - Days remaining to submit  
   - List of students who have not submitted  

Example output:
 Requirements
- Bash shell (≥ 4.0)  
