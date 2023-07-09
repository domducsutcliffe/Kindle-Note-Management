#!/bin/bash

# Navigate to the required directory
cd ..
cd imports

# Replace all newline characters with <br>, insert a break at every '<<'
# then remove every instance of '<' and '>' where they are not part of '<br>'
echo $(tr '\n' '<br>' < StopReadingtheNews.md | sed 's/<</<br><</g' | perl -pe 's/<(?!br>|<)//g; s/(?!<)>//g') > StopReadingtheNews_processed.md
