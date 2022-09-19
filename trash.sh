#!/bin/bash

#checks if /trash directory exists
if [[ -d /trash ]]
then
:
else
( sudo mkdir /trash ) #creates /trash directory if it doesn't exist
fi

#checks if /trash/.metadata directory exists
if [[ -d /trash/.metadata ]]
then
:
else
( sudo mkdir /trash/.metadata; sudo chmod o+w /trash/.metadata ) #creates metadata directory if it doesn't exist
fi

#checks if metadata_count directory exists
if [[ -d /trash/.metadata_count ]]
then
:
else
( sudo mkdir /trash/.metadata_count; sudo chmod o+w /trash/.metadata_count ) #creates writeable metadata_count directory
fi

#define positional arguments and variables
arg1=$1 #argument 1 - indicates whether you intend to delete or restore a file
arg2=$2 #argument 2 - indiates the file
arg3=$( sudo ls -i $arg2 | awk '{print $1}' ) #argument 3 - the file's inode
wd=$( pwd ) #working directory/the file's directory of origin

#delete function
function delete() {
( sudo echo $wd > /trash/.metadata/${arg3} )
( sudo echo 0 > /trash/.metadata_count/${arg3} )
( sudo mv -i "$arg2" /trash )
}

#restore function
function restore() {
( sudo mv -i "$arg2" $( cat /trash/.metadata/${arg3} ) )
( sudo rm /trash/.metadata/${arg3} )
( sudo rm /trash/.metadata_count/${arg3} )
}

#autodelete after 30days
function autodelete() {
for i in /trash/.metadata_count/*
do

if [[ -z $i ]]
then
:
elif [[ $( cat $i ) == 31 ]]
then

arg4=$( sudo ls -i | grep ${i##*/} |awk '{print $2}' ) #retrieves filename using inode

( sudo rm /trash/${arg4} )
( sudo rm "${i}" )
fi
done
}

#counter
function counter() {
for i in /trash/.metadata_count/*
do
#echo $i
#echo $( cat $i )
echo $(( $( cat ${i} ) + 1 )) > ${i}
done

autodelete
}

#case switch
case $arg1 in
"-d")
delete;;
"-r")
restore;;
"-c")
counter;;
esac

