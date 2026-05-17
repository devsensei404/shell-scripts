#!/bin/bash

file1=$1
file2=$2

if [ $# -ne 2 ]; then
    echo "Error: Exactly 2 arguments required (file1 and file2)."
 exit 1
fi

if [ ! -f "$file1" ] || [ ! -f "$file2" ]; then
    echo "Error: One or both files do not exist"
    exit 1
fi

echo "Lines only in file1 : "
comm -2 -3 <(sort "$file1") <(sort "$file2")
echo ""

echo "Lines only in file2 : "
comm -1 -3 <(sort "$file1") <(sort "$file2")
echo ""

echo "Lines common in file 1 & file 2 :"
comm -1 -2 <(sort "$file1") <(sort "$file2")
echo ""

count1=$(comm -2 -3 <(sort "$file1") <(sort "$file2") | wc -l)
count2=$(comm -1 -3 <(sort "$file1") <(sort "$file2") | wc -l)
count3=$(comm -1 -2 <(sort "$file1") <(sort "$file2") | wc -l)

echo ""
echo "Summary:"
echo "Only in file1: $count1"
echo "Only in file2: $count2"
echo "Common lines: $count3"