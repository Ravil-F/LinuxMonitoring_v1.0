#!/bin/bash

TOP_FILES=$(find "$1" -type f -exec du -h {} + | sort -hr | head -n 10)

TOP_EXECUTABLES=$(find "$1" -type f -executable -exec du {} + | sort -hr | head -n 10 | while read size path; do
    hash=$(md5sum "$path" | awk '{print $1}')
    echo "$path, $size, $hash"
done)

echo "Total number of folders (including all nested ones) = $(find "$1" -type d | wc -l)"
echo "TOP 5 folders of maximum size arranged in descending order (path and size):"
echo "$(du -h --max-depth=1 "$1" | sort -hr | head -n 5)"

echo "Total number of files = $(find "$1" -type f | wc -l)"
echo "Number of:"
echo "Configuration files (with the .conf extension) = $(find "$1" -type f -name "*.conf" | wc -l)"
echo "Text files = $(find "$1" -type f -name "*.txt" | wc -l)"
echo "Executable files = $(find "$1" -type f -executable | wc -l)"
echo "Log files (with the extension .log) = $(find "$1" -type f -name "*.log" | wc -l)"
echo "Archive files = $(find "$1" -type f $ -name "*.zip" -o -name "*.tar.gz" $ | wc -l)"
echo "Symbolic links = $(find "$1" -type l | wc -l)"

echo "TOP 10 files of maximum size arranged in descending order (path, size and type):"
i=1
while read line; do
    path=$(echo "$line" | awk '{print $2}')
    size=$(echo "$line" | awk '{print $1}')
    type=$(file --mime-type "$path" | awk '{print $2}' | sed 's|/.*||')
    echo "$i - $path, $size, $type"
    i=$((i+1))
done <<< "$TOP_FILES"

echo "TOP 10 executable files of the maximum size arranged in descending order (path, size and MD5 hash of file):"
i=1
while read line; do
    path=$(echo "$line" | awk '{print $2}')
    size=$(echo "$line" | awk '{print $1}')
    hash=$(md5sum "$path" | awk '{print $1}')
    echo "$i -> $path, $size, $hash"
    i=$((i+1))
done <<< "$TOP_EXECUTABLES"

echo "Script execution time (in seconds) = $(($(date +%s)-$2))"
