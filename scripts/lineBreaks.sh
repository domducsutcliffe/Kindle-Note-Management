#!/bin/bash

# Read the file and replace newline characters with <br>
cd ..
cd imports
sed 's/$/<br>/' StopReadingtheNews.md > temp.md

