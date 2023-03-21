#!/bin/bash

# check 2 parameters
if [ $# -ne 2 ]; then
    echo "Erreur: Veuillez fournir deux arguments : nom de la flotte source et nom de la flotte de destination."
    exit 1
fi

# check balena cli installation
if ! [ -x "$(command -v balena)" ]; then
  echo "Error: Balena CLI tool is not installed. Please install it by following the instructions at https://www.balena.io/docs/reference/cli/"
  exit 1
fi

# Get environment variables from the source fleet and store them in a JSON file
balena envs --fleet $1 --json > envs.json

# Add each environment variable to the destination fleet
for env in $(jq -c '.[]' envs.json); do
  name=$(echo "$env" | jq -r '.name')
  value=$(echo "$env" | jq -r '.value')

  if [ -z "$value" ]; then
    value="none"
  fi

  if [ -z "$name" ]; then
    name="none"
  fi
  echo "Copying variable $name to fleet $2 in progress..."    
  # Escape special characters in value
  value_escaped=$(printf '%s\n' "$value" | sed -e 's/\\/\\\\/g; s/\//\\\//g; s/"/\\"/g')

  # Add variable to destination fleet using retrieved values
  balena env add "$name" "$value_escaped" --fleet "$2"
done

echo "Environment variables successfully copied from fleet $1 to fleet $2."