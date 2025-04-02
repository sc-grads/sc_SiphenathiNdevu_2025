#!/bin/bash

/ #Root the top of the file system hierarchy.
/etc #System configuration files.
/home/user #Prints the current working directory
echo #echo Displays text
/bin #Binaries and other executable programs
/opt #Optional or third party software
/tmp #Temporary space, typically cleared on reboot
/usr #User related programs.
/var #Variable data, most notably log files.

/bin/pwd  #Prints the current working directory path.
/bin/cd  #Changes the current directory to a specified path.
/bin/ls  #Lists the contents of a directory.
/bin/mkdir  #Creates a new directory.
/bin/rmdir   #Removes an empty directory.
/bin/echo  #Displays a line of text or variable value to the terminal.
/bin/help  #Provides help information for built-in shell commands (used in some shells like Bash).
/usr/bin/whoami  #Displays the username of the current user.

/usr/bin/tree  # Displays the directory structure in a tree-like format (may require installation).
/bin/chmod  #Changes the permissions of a file or directory.
/bin/chown  #Changes the owner and/or group of a file or directory.

#Permissions and Ownership:
/usr/bin/umask  # Sets default permissions for new files.
/usr/bin/stat  # Displays detailed file information.


#File and Directory Management:
/bin/touch  #Creates an empty file or updates the timestamp of an existing file.
/bin/mv  #Moves or renames files and directories.
/bin/cp  #Copies files and directories.
/bin/rm  #Removes files or directories.
/bin/find  #Searches for files and directories based on various criteria.

#File Viewing and Editing:
/bin/cat  #Displays the contents of a file.
/bin/less  #Allows viewing file content page by page.
/bin/more  #Similar to less, but less powerful.
/usr/bin/nano  # Simple text editor (if installed).
/usr/bin/vi  #Powerful text editor available in most Linux systems.

#Disk Usage and File System:
/bin/df #Displays disk space usage of file systems.
/bin/du #Shows disk usage of files and directories.
/sbin/mount  #Mounts a file system.
/sbin/umount #Unmounts a file system.

#Process Management:
/bin/ps #Displays active processes.
/usr/bin/top  #Shows real-time system resource usage.
/usr/bin/htop   #Interactive process viewer (if installed).
/bin/kill #Sends a signal to terminate a process.
/bin/killall #Kills all processes by name.
/bin/xargs  #Executes commands from standard input.

#User Management:
/usr/bin/id #Displays the user ID and group ID.
/usr/bin/passwd #Changes the user password.
/usr/bin/groups #Shows the groups a user belongs to.
/usr/sbin/useradd #Adds a new user.
/usr/sbin/usermod #Modifies a user account.
/usr/sbin/userdel #Deletes a user account.
/usr/bin/sudo #Runs a command as another user (usually root).

#List Running Programs

ps #Show running processes.  

ps -e #Show all processes.  

ps -ef #Show all processes with details.  

ps -u username #Show processes for a user.  

ps -p pid #Show info for a specific process ID (PID). 
 

#Run Commands as Others with sudo

sudo command #Run a command as root (e.g., sudo ls).  

sudo -u user command #Run as a specific user (e.g., sudo -u oracle ls).  

sudo -l #List commands you’re allowed to run.  


#Switch Users with sudo

sudo su #Switch to root.  

sudo su #Switch to root with root’s environment.  

sudo su - username # Switch to another user (e.g., sudo su - oracle).  

sudo -s # Start a shell as root.  

sudo -u user -s # Start a shell as another user. 


#Reuse Commands with ! (Exclamation Mark)

!N #Run command number N from history (e.g., !5).  

!! #Run the last command again.  

!string #Run the last command starting with "string" (e.g., !ls).  

!:0 #Use the command name (e.g., head from head file.txt).  

!:1 #Use the first argument (e.g., file.txt).  

!^ #Use the first argument (e.g., file.txt).  

!$ #Use the last argument (e.g., notes.txt from head file.txt notes.txt).  



 
