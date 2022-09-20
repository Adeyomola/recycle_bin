This script is a mock recycle bin for Linux terminals, currently in its early stages.
So far, it can do the following:
* Delete files by moving them to a recycle bin
* Restore files to their original directory
* Autodelete files after 30 days
* If an incoming file has the same name as a file in the trash folder, this script automatically adds "1"
to the name of the new file. This ensures the old file is not overwritten by the new one.
