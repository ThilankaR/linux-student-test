#!/bin/bash

# Create User Group
sudo groupadd student  # Adds a new group named 'student' to the system

# Generate usernames and passwords in a pattern
for i in {555..557}; do  # Loop through numbers 555 to 557
    username="2020t0$i"  # Generate a username based on the current number in the loop

    # Create generated users
    sudo adduser --home /home/"$username" --shell /bin/bash --force-badname --disabled-password --gecos "" "$username"
    # Adds a new user with the specified username
    # --home specifies the home directory
    # --shell specifies the login shell
    # --force-badname allows names that do not meet the standard criteria
    # --disabled-password creates the user without setting a password
    # --gecos "" leaves the GECOS field (User info) empty

    echo -e "$username\n$username" | sudo passwd "$username"
    # Sets the user's password to the same as the username
    # echo -e sends the username twice (once for password and once for confirmation) to the passwd command

    sudo usermod -aG student "$username"
    # Adds the user to the 'student' group
    # -aG appends the user to the supplementary group

    sudo chown "$username" /home/"$username"
    # Changes the ownership of the user's home directory to the user
    sudo chmod 711 /home/"$username"
    # Sets the permissions of the user's home directory to 711 (owner can read/write/execute, others can execute only)

    sudo -u "$username" touch /home/"$username"/.bash_history
    # Creates an empty .bash_history file in the user's home directory as the user
    sudo -u "$username" chown "$username":"$username" /home/"$username"/.bash_history
    # Changes the ownership of the .bash_history file to the user
done

########################

# These lines are commented out and do not execute
# They show examples of how to add other specific users
# sudo adduser --home /home/mahirangi --shell /bin/bash --force-badname --gecos "" "mahirangi"
# sudo adduser --home /home/mahirangi --shell /bin/bash --force-badname --gecos "" "sharmi"
# sudo adduser --home /home/mahirangi --shell /bin/bash --force-badname --gecos "" "priyangani"
