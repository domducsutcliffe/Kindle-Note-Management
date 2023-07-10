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
