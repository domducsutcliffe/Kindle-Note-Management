#!/bin/bash

# Check if a filename has been provided
if [ "$#" -ne 1 ]; then
    echo "Usage: $0 filename"
    exit 1
fi

# Get the filename
filename=$1

# Navigate to the required directory
cd ../imports

# Check if the file exists
if [ ! -f $filename ]; then
    echo "File not found!"
    exit 1
fi

# Prepare the table template
echo "# Title" > Formatted$filename
echo "" >> Formatted$filename
echo "| | |" >> Formatted$filename
echo "| - | - |" >> Formatted$filename
echo "| **Full title** |  |" >> Formatted$filename
echo "| **Authors** |  |" >> Formatted$filename
echo "| **Publication Year** | |" >> Formatted$filename
echo "| **Recommended By** | |" >> Formatted$filename
echo "| **Status** | #book/status/unread |" >> Formatted$filename
echo "| **Reading Dates** |  |" >> Formatted$filename
echo "| **Initial Thoughts** | |" >> Formatted$filename

# Variables to keep track of the fields
readingDates=""
title=""
author=""

# Read the file and perform markdown formatting
while IFS= read -r line
do
    if [[ $line == "# "* ]]; then
        # This is a title
        title=$(echo $line | sed 's/# //')
    elif [[ $line == "* "* ]]; then
        # This is a bullet point
        readingDates=$(echo $line | sed 's/\* //')
    elif [[ $line == "> "* ]]; then
        # This is a blockquote
        author=$(echo $line | sed 's/> By //')
    fi
done < $filename

# Update the table
sed -i "s|^| **Full title** | $title |" Formatted$filename
sed -i "s|^| **Authors** | $author |" Formatted$filename
sed -i "s|^| **Reading Dates** | $readingDates |" Formatted$filename

# Continue reading the file and add the remaining notes below the table
echo "" >> Formatted$filename
echo "## Full Notes, including quotes" >> Formatted$filename

# Read the file again and add the notes
while IFS= read -r line
do
    if [[ $line == "---"* ]] || [[ $line == "* "* ]]; then
        echo "$line" >> Formatted$filename
    fi
done < $filename
