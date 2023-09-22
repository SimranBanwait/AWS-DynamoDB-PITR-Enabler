#!/bin/bash
# This script takes a txt file name as an argument and deletes the lambda functions whose names are listed in the file using the AWS CLI
# Usage: bash delete_lambda_functions_from_file.sh functions.txt

# Check if AWS CLI is installed
if ! command -v aws &> /dev/null
then
    echo "AWS CLI is not installed. Please install it first."
    exit 1
fi

# Check if the file name is provided
if [ -z "$1" ]
then
    echo "Please provide a txt file name as an argument."
    exit 2
fi

# Check if the file exists and is readable
if [ ! -f "$1" ] || [ ! -r "$1" ]
then
    echo "The file $1 does not exist or is not readable."
    exit 3
fi

# Loop through the file and delete each lambda function
while read -r function
do
    echo "Deleting lambda function $function ..."
    aws lambda delete-function --function-name $function
    echo "Done."
done < "$1"

echo "All lambda functions deleted."