#!/bin/bash

#checks if /trash directory exists
if [[ -d /trash ]]
then
:
else
( sudo mkdir /trash )
fi

#checks if /trash/.metadata directory exists
if [[ -d /trash/.metadata ]]
then
:
else
( sudo mkdir /trash/.metadata; sudo chmod o+w /trash/.metadata )
fi

#define positional arguments
arg1=$1
arg2=$2
arg3=$( sudo ls -i $arg2 | awk '{print $1}' )
wd=$( pwd )

#delete function
function delete() {
( sudo echo $wd > /trash/.metadata/${arg3} )
( sudo mv -i "$arg2" /trash )
}

#restore function
function restore() {
( sudo mv -i "$arg2" $( cat /trash/.metadata/${arg3} ) )
( sudo rm /trash/.metadata/${arg3} )
}

#case switch
case $arg1 in
"-d")
delete;;
"-r")
restore;;
esac

