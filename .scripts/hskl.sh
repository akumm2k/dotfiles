#!/usr/bin/env bash

hsk_file=$1
all_args=("$@")
rest_args=("${all_args[@]:1}")

# Flags
verbose=false
delete=false

# Process flags
for arg in "${all_args[@]}"; do
    case $arg in
        -v) verbose=true ;;
        -d) delete=true ;;
    esac
done

# Check if a Haskell file argument is provided
if [ -n "$hsk_file" ]; then
    # Compile the Haskell file
    ghc "$hsk_file" &>/dev/null
    file_name="${hsk_file%.*}"

    # Display "Running $file_name" if verbose is true
    if $verbose; then
        echo "Running $file_name"
    fi

    ./"$file_name" "${rest_args[@]}"

    # Remove files based on flags
    if $delete; then
        rm -rf "$file_name" "./*.hi" "./*.o"
    else
        rm -rf "./*.hi" "./*.o"
    fi
else
    echo "Missing Haskell file argument"
fi
