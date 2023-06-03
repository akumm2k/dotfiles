#!/bin/bash

hsk_file=$1
all_args=("$@")
rest_args=("${all_args[@]:1}")

# Check if the "-v" flag is present in the arguments
verbose=false
if [[ " ${all_args[@]} " =~ " -v " ]]; then
    verbose=true
fi


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

    # Check if the "-d" flag is present in the arguments
    if [[ " ${all_args[@]} " =~ " -d " ]]; then
        # Remove the executable and compilation files
        rm -rf "$file_name" "./*.hi" "./*.o"
    else
        # Remove only the compilation files
        rm -rf "./*.hi" "./*.o"
    fi
else
    echo "Missing Haskell file argument"
fi
