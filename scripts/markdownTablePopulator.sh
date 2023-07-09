#!/bin/bash

# Navigate to the required directory
cd ..
cd imports

# Get filename from user input
filename=$1

# Initialize table file
table_filename="$filename"_table.md
echo "| | |" > "$table_filename"
echo "| - | - |" >> "$table_filename"

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

# Append to the table file
echo "| **Full title** | $title |" >> "$table_filename"
echo "| **Authors** | $author |" >> "$table_filename"
echo "| **Publication Year** | |" >> "$table_filename"
echo "| **Recommended By** | |" >> "$table_filename"
echo "| **Status** | #book/status/unread |" >> "$table_filename"
echo "| **Reading Dates** | $reading_dates |" >> "$table_filename"
echo "| **Initial Thoughts** | |" >> "$table_filename"

# Read the file and perform markdown formatting
while IFS= read -r line
do
    # Detect the type of the line and apply the appropriate markdown formatting
    if [[ $line == "# "* ]]; then
        # This is a title
        echo "$line" >> "$table_filename"
    elif [[ $line == "* "* ]]; then
        # This is a bullet point
        echo "$line" >> "$table_filename"
    elif [[ $line == "> "* ]]; then
        # This is a blockquote
        echo "$line" >> "$table_filename"
    elif [[ $line == "---"* ]]; then
        # This is a horizontal rule
        echo "$line" >> "$table_filename"
    fi
done < $filename
