#!/bin/bash

# Assignment Reminder Manager

parent_directory="submission_remainder_*/"    # The parent directory where the app is located
startup="startup.sh"                          # The main startup script of the reminder app
config="./submission_remainder_*/config/config.env"  # Path to the environment configuration file
continuation="y"                              # Controls the while loop (y = continue)
assignment_name=""                            # Stores the assignment name entered by the user

copilot_function() {
    # Capture the assignment name passed as an argument
    assignment="$1"

    if [ ! -d $parent_directory ]; then
        sleep 0.9
        echo "The directory doesn't exist. Please run the file create_environment.sh"
        echo " "
        exit 1
    else
        sed -i "s/ASSIGNMENT=\".*\"/ASSIGNMENT=\"$assignment_name\"/" $config

        echo "Processing '$assignment' assignment"


        cd $parent_directory
        if [ ! -f $startup ]; then
            echo "Error: $startup not found."
            exit 1
        else
            ./$startup
            cd ..
        fi
    fi
}

while [[ "$continuation" == "y" || "$continuation" == "Y" ]]; do
    echo " "
    echo "Which assignment do you want to check?"
    echo "Example options:
Shell Navigation
Shell Basics
Git"

    # Ask the user to type the assignment name
    read -p "Enter the assignment name: " assignment_name

    # Call the copilot_function and pass the user’s input
    copilot_function "$assignment_name"

   # Ask the user if they want to analyze another assignment
    echo " "
    read -p "Do you want to analyze another assignment (y/n): " continuation
done

echo -e "Exiting"
