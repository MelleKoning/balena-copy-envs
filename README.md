
# Copy balena fleet variables from fleet A to fleet B 📝  

This Bash script allows you to copy environment variables from one Balena fleet to another.

## Prerequisites🚀  
1) balena cli : https://github.com/balena-io/balena-cli
2) jq : https://stedolan.github.io/jq/

## Usage 🔥  
### To use this script, run the following command:
```
./balena-copy.sh <source_fleet_name> <destination_fleet_name>
```
Where <source_fleet_name> is the name of the fleet where the environment variables will be copied from, and <destination_fleet_name> is the name of the fleet where the environment variables will be copied to.

For example, to copy environment variables from a fleet named my-source-fleet to a fleet named my-destination-fleet, run the following command:

```
./copy-env-variables.sh my-source-fleet my-destination-fleets
```
This will retrieve the environment variables from my-source-fleet, store them in a JSON file, and then add each variable to my-destination-fleet. Once the script has finished running, you will see a message indicating that the environment variables were successfully copied.

Note: You must be logged in to the Balena CLI with an account that has access to both fleets in order to use this script.

## Upcoming features 🔥 

1) copy variables to multiple fleets
2) device variable support
3) specifying the service name for the environment variable

### Licence
developed by Firat YILDIRIM, for an open source contribution for balena cloud