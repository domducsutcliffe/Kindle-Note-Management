#!/bin/bash

# Check if a filename has been provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Get the filename
filename=$1

# Navigate to the required directory
cd ..
cd imports

# Check if the file exists
if [ ! -f $filename ]; then
    echo "File not found!"
    exit 1
fi

# Read the file and perform markdown formatting
while IFS= read -r line
do
    # Detect the type of the line and apply the appropriate markdown formatting
    if [[ $line == "# "* ]]; then
        # This is a title
        echo "$line" >> Formatted$filename
    elif [[ $line == "* "* ]]; then
        # This is a bullet point
        echo "$line" >> Formatted$filename
    elif [[ $line == "> "* ]]; then
        # This is a blockquote
        echo "$line" >> Formatted$filename
    elif [[ $line == "---"* ]]; then
        # This is a horizontal rule
        echo "$line" >> Formatted$filename
    fi
done < $filename
