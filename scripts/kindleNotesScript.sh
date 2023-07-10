#!/bin/bash
cd /Applications/pythonScripts/clippy-kindle-r1.1 #this will depend on how exactly you install clippy

{ echo 'y'; yes '2'; } | ./clippy.py /Volumes/Kindle/documents/My\ Clippings.txt && ./marky.py collection.json output --settings settings.json --update-outdate 

cd output

rm -f *.csv
code .

cd /Users/williewonka/Documents/kindleFinishedNotes #change to where you wish to store the notes

code .
