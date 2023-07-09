#!/bin/bash

# Navigate to the required directory
cd ..
cd imports
# Replace all newline characters with <br> and output to a single line
echo $(tr '\n' '<br>' < StopReadingtheNews.md) > StopReadingtheNews.md
