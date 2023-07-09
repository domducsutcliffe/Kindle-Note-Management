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

# Process the file to extract title, author, and reading dates
title=""
author=""
reading_dates=""
notes=""
skip_next_lines=false
while IFS= read -r line
do
    if [[ $line == "# "* ]]; then
        # Extract title
        title=$(echo "$line" | sed 's/# //')
    elif [[ $line == *" by "* ]]; then
        # Extract author
        author=$(echo "$line" | sed 's/.* by //')
    elif [[ $line == "* Notes from:"* ]]; then
        # Extract reading dates
        reading_dates=$(echo "$line" | sed 's/* Notes from: //')
    elif [[ $line == "---"* ]]; then
        # Skip the horizontal rule
        skip_next_lines=true
    elif [ "$skip_next_lines" = true ]; then
        # Skip the lines after the horizontal rule
        skip_next_lines=false
    else
        # Append all other lines as notes
        notes+="$line<br>"
    fi
done < $filename

# Generate the table and append the formatted content to the same file
echo "| | |" > Formatted$filename
echo "| - | - |" >> Formatted$filename
echo "| **Full title** | $title |" >> Formatted$filename
echo "| **Authors** | $author |" >> Formatted$filename
echo "| **Publication Year** | |" >> Formatted$filename
echo "| **Recommended By** | |" >> Formatted$filename
echo "| **Status** | #book/status/unread |" >> Formatted$filename
echo "| **Reading Dates** | $reading_dates |" >> Formatted$filename
echo "| **Initial Thoughts** | |" >> Formatted$filename

# Append the formatted content to the markdown file
echo "" >> Formatted$filename
echo "# $title" >> Formatted$filename
echo "" >> Formatted$filename
echo "* Notes from: $reading_dates" >> Formatted$filename
echo "" >> Formatted$filename
echo "$notes" >> Formatted$filename
