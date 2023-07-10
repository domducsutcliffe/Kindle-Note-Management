# Kindle Note Management Tool

A simple pair of scripts for automating kindle note management. 

Project has been briefly tested on Kindle Oasis 2019


## Table of Contents

- [Project Description](#project-description)
- [Features](#features)
- [Installation and Usage](#installation-and-usage)


## Project Description

A pair of scripts for importing kindle notes and reformating them into markdown.

## Features

- Imports the notes
- Formats the Books metadata into a markdown table describing the book
- Formats the notes taken in markdown to distinguish between the text and the user's input

## Installation and Usage


1. Install the clippy plugin https://github.com/dangbert/clippy-kindle and decide how you wish to install. To align with how I did it create a folder in 'user/applications' called 'pythonScripts' and place 'clippy-kindle-r1.1' in there.
2. ```shell
$ git clone https://github.com/domducsutcliffe/Kindle-Note-Management.git
3. Change the locations in the kindleNotesScript script so they align with where you put the clippy application and where you wish to store the imported notes
4. Plugin in your Kindle and wait for five seconds
5. In terminal run 
```shell
$chmod +x kindleNotesScript.sh && $chmod +x markdownNotesFormatter.sh
4. Run ```shell
$bash kindleNotesScript.sh
5. This should have imported all the notes from your kindle with each note being a Markdown file in the format $nameOfBook by $nameOfAuthor
5. Drag the notes you wish to reformat from the imported files to a clone of this repo and place in the imports folder
6. Rename to remove any spaces e.g. Fluent Forever.md --> fluentForever.md
7. Run the script with the raw kindle note as an argument
```shell 
$bash markdownNotesFormatter.sh fluentForever.md
8. Check the output in the imports file and drag over to the notes.
