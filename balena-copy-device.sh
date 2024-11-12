#!/bin/bash

# check 2 parameters
if [ $# -ne 2 ]; then
    echo "Error: Please provide two arguments: source device name and destination device name."
    exit 1
fi

# check balena cli installation
if ! [ -x "$(command -v balena)" ]; then
  echo "Error: Balena CLI tool is not installed. Please install it by following the instructions at https://www.balena.io/docs/reference/cli/"
  exit 1
fi

# Get environment variables from the source device and store them in a JSON file
balena envs --device $1 --json > envs.json

# Add each environment variable to the destination device
for env in $(jq -c '.[]' envs.json); do
  name=$(echo "$env" | jq -r '.name')
  value=$(echo "$env" | jq -r '.value')
  servicename=$(echo "$env" | jq -r '.serviceName')
  
  if [ -z "$value" ]; then
    value="none"
  fi

  if [ -z "$name" ]; then
    name="none"
  fi
  echo "Copying variable $name to device $2 and service $servicename in progress..."    
  # Escape special characters in value
  value_escaped=$(printf '%s\n' "$value" | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/"/\\"/g')

  # Add variable to destination device using retrieved values
  balena env add "$name" "$value_escaped" --device "$2" --service "$servicename"
done

echo "Environment variables successfully copied from device $1 to device $2."
