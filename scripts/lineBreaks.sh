#!/bin/bash

# Navigate to the required directory
cd ..
cd imports

# Replace all newline characters with <br> and insert a break at every '<<'
echo $(tr '\n' '<br>' < StopReadingtheNews.md | sed 's/<</<br><</g') > StopReadingtheNews.md
