## ABOUT THIS SHELL SCRIPT
This script is a mock recycle bin for Linux terminals. So far, it can do the following:
* Delete files by moving them to a recycle bin
* Restore files to their original directory
* Autodelete files after 30 days (30 days of running your computer for at least 10 minutes)
* If an incoming file has the same name as a file in the trash folder, this script automatically adds "1"
to the name of the new file. This ensures the old file is not overwritten by the new one.

## HOW TO SET IT UP
* Download the trash script.
* Move the trash script to the /usr/bin folder.
```sudo mv -i [trash script path] /usr/bin```
The ```-i``` ensures that you do not automatically overwrite any existing binary with the same name.
* cd to the /usr/bin
```cd /usr/bin```
* Make the trash script executable for others
```sudo chmod o+x trash```

### Activate Autodelete After 30 days
* Activate the autodelete-after-30 days function by adding the following to your anacrontab (sudo nano /etc/anacrontab)
```1       10      count-autodelete        trash -c```

## COMMANDS
* Move a file to the /trash directory:
```trash -d [FILE]```
* Restore a file from the /trash folder to its original directory:
```trash -r [FILE]``` 
