#!/bin/bash

# Check if the correct number of arguments is provided (in this case, exactly 1)
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 <folder_name>"  # Display usage information if the argument count is not 1
    exit 1  # Exit the script with a status code of 1 (indicating an error)
fi

folder_name="$1"  # Assign the first argument to the variable folder_name
nfs_server="10.3.1.21:/exm"  # Define the NFS server and the shared directory
mount_point="/upload"  # Define the local mount point for the NFS share

# Check if the NFS share is already mounted
if mount | grep -q "$mount_point"; then
    echo "<<< Network drive is already mounted >>>"  # Inform the user that the network drive is already mounted
else
    echo " !!!! Network drive is not accessible !!!"  # Inform the user that the network drive is not accessible
    exit 1  # Exit the script with a status code of 1 (indicating an error)
fi

# Save the current user's command history to a file in the specified folder
history > /home/"$USER/$folder_name/history.txt"

# Create a zip archive of the specified folder, including a timestamp in the filename
zip_archive="$USER-AppLab-$(date +"%b%d-%Y-%H%M%S").zip"
zip -r "$zip_archive" "/home/$USER/$folder_name"

# Copy the zip archive to the NFS share
if cp "$zip_archive" "$mount_point/$zip_archive"; then
    echo "<<<< !!!! Folder compressed and Uploaded successfully !!!! >>>>"  # Inform the user of a successful upload
else
    echo "!!! Upload FAILED !!!"  # Inform the user that the upload failed
fi
