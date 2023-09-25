#!/bin/bash



if [ $# -ne 2 ]; then
    echo "Error: enter two arguments"
    exit 1
fi

file_path="$1"
write_str="$2"

directory=$(dirname "$file_path")

if [ ! -d "$directory" ]; then
    echo "Directory does not exist"
    exit 1
fi

if [ -e "$file_path" ]; then
    echo "$write_str" >> "$file_path"
else
    echo "$write_str" > "$file_path"
fi


