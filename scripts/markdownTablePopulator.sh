#!/bin/bash

# Navigate to the required directory
cd ..
cd imports

# Get filename from user input
filename=$1

# Process the file to extract title, author, and notes
while IFS= read -r line
do
    if [[ $line == "# "* ]]
    then
        # Remove leading '# ' from line
        line=${line:2}

        # Split at the last occurrence of ' by '
        title=${line% by *}
        author=${line##* by }
    elif [[ $line == "* Notes from:"* ]]
    then
        # Extract reading dates
        reading_dates=${line:14}
    else
        # Append all remaining lines as notes
        notes+="$line<br>"
    fi
done <"$filename"

# Write to new markdown file with table
echo "| | |" > "$filename"_table.md
echo "| - | - |" >> "$filename"_table.md
echo "| **Full title** | $title |" >> "$filename"_table.md
echo "| **Authors** | $author |" >> "$filename"_table.md
echo "| **Publication Year** | |" >> "$filename"_table.md
echo "| **Recommended By** | |" >> "$filename"_table.md
echo "| **Status** | #book/status/unread |" >> "$filename"_table.md
echo "| **Reading Dates** | $reading_dates |" >> "$filename"_table.md
echo "| **Initial Thoughts** | |" >> "$filename"_table.md
