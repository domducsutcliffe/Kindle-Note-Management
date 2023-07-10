# Kindle Note Management Tool

A simple pair of scripts for automating Kindle note management. 

Project has been briefly tested on Kindle Oasis 2019


## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Installation and Usage](#installation-and-usage)


## Project Description

A pair of scripts for importing Kindle notes and reformatting them into markdown.

## Features

- Imports the notes
- Formats the book's metadata into a markdown table describing the book
- Formats the notes taken in markdown to distinguish between the text and the user's input

## Installation and Usage

1. Install the [clippy-kindle](https://github.com/dangbert/clippy-kindle) plugin and decide how you wish to install it. To align with how I did it, create a folder called `pythonScripts` in `user/applications` and place `clippy-kindle-r1.1` in there.
   
```shell
$ git clone https://github.com/domducsutcliffe/Kindle-Note-Management.git
$ chmod +x Kindle-Note-Management/kindleNotesScript.sh && chmod +x Kindle-Note-Management/markdownNotesFormatter.sh
$ ./Kindle-Note-Management/kindleNotesScript.sh

Change the locations in the kindleNotesScript.sh script to match the location of the clippy application and the desired storage location for imported notes.
Plug in your Kindle and wait for five seconds.
In the terminal, make the scripts executable:
$ chmod +x Kindle-Note-Management/kindleNotesScript.sh && chmod +x Kindle-Note-Management/markdownNotesFormatter.sh

Run the kindleNotesScript.sh script:
$ ./Kindle-Note-Management/kindleNotesScript.sh

This should import all the notes from your Kindle, with each note being a Markdown file in the format $nameOfBook by $nameOfAuthor.

Drag the notes you wish to reformat from the imported files to a clone of this repository and place them in the imports folder.
Rename the notes to remove any spaces, e.g., Fluent Forever.md -> fluentForever.md.
Run the markdownNotesFormatter.sh script with the raw Kindle note as an argument

$ ./Kindle-Note-Management/markdownNotesFormatter.sh fluentForever.md

Check the output in the imports folder and drag them over to your notes.

