# Script Management for Linux command practical
This repository contains several bash scripts designed to manage users, perform file operations, and interact with network drives. Below is a description of each script, along with usage instructions.

Scripts
#1. Create Users Script
This script creates multiple user accounts, assigns them to a specific group, and sets up their home directories with appropriate permissions.

Usage
Run the script without any arguments:

bash
Copy code
./create_users.sh

#2. Delete Users Script
This script deletes user accounts within a specified range and removes their home directories.

Usage
Run the script without any arguments:

bash
Copy code
./delete_users.sh

#3. Network Drive Backup Script
This script checks for an NFS mount, saves the current user's command history, compresses a specified folder, and uploads it to the network drive.

Usage
Run the script with the folder name as an argument:

bash
Copy code
./network_backup.sh <folder_name>
Replace <folder_name> with the name of the folder you want to backup and upload.

#4. Script Distribution Script
This script copies a specified script to multiple user home directories, changes ownership, and makes the script executable.

Usage
Run the script with the script file to be copied as an argument:

bash
Copy code
./distribute_script.sh <script_to_copy>
Replace <script_to_copy> with the name of the script file you want to distribute.

Notes
Ensure you have the necessary permissions (e.g., root or sudo) to run these scripts.
Modify the range of user IDs and other parameters as needed to fit your environment.
Check that the specified network paths and servers are correct and accessible from your machine.
