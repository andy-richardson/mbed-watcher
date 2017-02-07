#!/bin/bash
inotifywait -m -e create,modify ~/Downloads |
while read path action file; do
        if [[ "$file" =~ .*bin$ ]]; then
	    sleep 1
            rm /media/MBED/*.bin 2> /dev/null
	    mv "$HOME/Downloads/$file" /media/MBED/.
	    echo "new file detected and transferred"
        fi
done
