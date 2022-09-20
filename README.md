## ABOUT THIS SHELL SCRIPT
This script is a mock recycle bin for Linux terminals, currently in its early stages.
So far, it can do the following:
* Delete files by moving them to a recycle bin
* Restore files to their original directory
* Autodelete files after 30 days
* If an incoming file has the same name as a file in the trash folder, this script automatically adds "1"
to the name of the new file. This ensures the old file is not overwritten by the new one.

## HOW TO SET IT UP
* Download/copy the trash script.
* Create a bin folder in your home directory
```mkdir bin```
* Move the trash script to the bin folder.
```mv [trash script path] ~/bin```
* Add the bin folder to $PATH for user.
```export PATH=$PATH:~/bin```
* Repeat the step above for root.

## COMMANDS
* Move a file to the /trash directory:
```trash -d [FILE]```
* Restore a file from the /trash folder to its original directory:
```trash -r [FILE]``` 
* Activate the autodelete-after-30 days function by adding the following to your anacrontab (sudo nano /etc/anacrontab)
```1       10      count-autodelete        trash -c```

