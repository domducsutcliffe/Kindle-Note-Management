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

List the key features and functionalities of your project. Use bullet points to make it easy to read and understand.

- Imports the notes
- Formats the Books metadata into a markdown table describing the book
- Formats the notes taken in markdown to distinguish between the text and the user's input

## Installation and Usage

Provide instructions on how to install and set up your project. Be clear and provide any dependencies or prerequisites needed.

1. Install the clippy plugin https://github.com/dangbert/clippy-kindle and related Python dependencies
2. Change the locations in the kindleNotesScript script so they align with where you wish to store the imports of Kindle files
3. In terminal $run chmod +x kindleNotesScript.sh and $chmod +x markdownNotesFormatter.sh
4. Run $bash kindleNotesScript.sh
5. Drag the notes you wish to reformat from the imported files to a clone of this repo and place in the imports folder
6. Rename to remove any spaces e.g. Fluent Forever.md --> fluentForever.md
7. Run the script with the raw kindle note as an argument $bash markdownNotesFormatter.sh fluentForever.md
8. Check the output in the imports file and drag over to the notes.



## Usage

Explain how to use your project. Provide examples or code snippets if necessary. Show the basic commands or steps to get started.

```shell
$ command-example --option
