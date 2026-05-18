#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Usage: bash find_repeats.sh <input_file>"
    exit 1
fi

if [ ! -f "$1" ]; then
    echo "Error: File '$1' not found"
    exit 1
fi

data=$(cat "$1")
total=${#data}
i=0

while (( i < total )); do
    matched=0
    pattern="${data:i:3}"

    for (( j=0; j < i; j++ )); do
        candidate="${data:j:3}"
        if [[ "$candidate" == "$pattern" ]]; then
            offset=$(( i - j ))
            echo "(${offset},3)"
            matched=1
            (( i += 3 ))
            break
        fi
    done

    if (( matched == 0 )); then
        echo "${data:i:1}"
        (( i += 1 ))
    fi
done
