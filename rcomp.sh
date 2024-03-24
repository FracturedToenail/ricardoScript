#!/usr/bin/env sh

# Initialize flag
no_warn=0

# Parse command-line arguments
while [ "$#" -gt 0 ]; do
    case "$1" in
        --no-warn|-n)
            no_warn=1  # Set the flag
            shift  # Move to next argument
            ;;
        *)
            file_path="$1"  # Assume the first non-flag argument is the file path
            shift  # Move to next argument
            ;;
    esac
done

# Check if at least one argument is provided
if [ -z "$file_path" ]; then
    echo "Usage: rcomp <path-to-file> [--no-warn|-n]"
    exit 1
fi

# check if file exists
if [ ! -f "$file_path" ]; then
    echo "File does not exist: $file_path"
    exit 1
fi

# check if the file has the .ric extension unless no-warn flag is set
if [ "$no_warn" -ne 1 ] && [ "${file_path##*.}" != "ric" ]; then
    echo "Warning: file does not end in the .ric extension. You may be trying to evaluate a non ricardoScript file. To suppress this warning, run the --no-warn flag or the -n shorthand"
fi

echo "1"
