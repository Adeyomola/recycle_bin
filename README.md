## ABOUT THIS SHELL SCRIPT
This script is a recycle bin for Linux terminals. It can do the following:
* Delete files by moving them to a recycle bin
* Restore files to their original directory
* Autodelete files after 30 days (30 days of running your computer for at least 10 minutes)
* If an incoming file has the same name as a file in the trash folder, it prompts the user to rename the file 
before moving it to the trash folder.

## HOW TO SET IT UP
* Download the installer:
```
$ wget -0 trsh_installer https://raw.githubusercontent.com/Adeyomola/recycle_bin/main/installer
$ chmod +x trsh_installer
$ ./trsh_installer
```


## COMMANDS
* Run ```trsh -h``` or ```trsh --help``` to see the commands
