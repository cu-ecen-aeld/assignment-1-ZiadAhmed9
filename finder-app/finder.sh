#!/bin/bash

if [ $# -ne 2 ]; then

    echo "Arguments must be 2"
    exit 1
fi
filesdir="$1"
searchstr="$2"
file_count=0
string_count=0


if [ ! -d "$filesdir" ]; then
    echo "Directory does not exist"
    exit 1
fi


# Recursively search for files containing the search string in the specified directory
#find the files inside this directory then execute grep on them -q means do not list output on screen
#then  the {} is a paceholder in which carries the name of the files which changes while looping throug files
#after you find a file that has this string, grep again and -o means output only the matching part of the line
# . /dev/null means send the output to null as we don't want to show output in terminal but store it in variable
find "$filesdir" -type f -exec grep -q "$searchstr" {} \; -exec grep -o "$searchstr" {} \; > /dev/null
if [ $? -eq 0 ]; then
  string_count=$(find "$filesdir" -type f -exec grep -o "$searchstr" {} \; | wc -l)
  file_count=$(find "$filesdir" -type f -exec grep -l "$searchstr" {} \; | wc -l)
fi

echo "The number of files are $file_count and the number of matching lines are $string_count"
