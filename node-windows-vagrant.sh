#!/bin/bash

#Setup directories
#$DIRECTORY is ~/.node-windows-vagrant
#$WDIR is current working directory
DIRECTORY=$HOME/.node-windows-vagrant
WDIR=${PWD##*/}
BOWERRC=".bowerrc"
BOWERCOMP="bower_components"

#Check if $DIRECTORY/$WDIR exists. If it does, delete it.
if [ -d "$DIRECTORY/$WDIR" ]; then
  echo "Cleaning up."
  echo 
  rm -rf $DIRECTORY/$WDIR
fi

#Check if there is an alternative for the bower_components directory
if [ -e $BOWERRC ]
then
  while read -r line
  do
    if echo "$line" | grep -q -s -i directory
    then
      BOWERCOMP=`echo "$line" | tr -d '" ' | tr -d "'" | cut -d ":" -f2-`
    fi
  done < "$BOWERRC"
fi

#Make new directories
mkdir -p $DIRECTORY/$WDIR/node_modules
mkdir -p $DIRECTORY/$WDIR/bower_components

#Remove symlinks
rm -rf node_modules
rm -rf $BOWERCOMP

#Create new symlinks
ln -s $DIRECTORY/$WDIR/node_modules node_modules
ln -s $DIRECTORY/$WDIR/bower_components $BOWERCOMP

echo "All done. You are set for doing 'npm install' and 'bower install'"