# Copy balena fleet variables from fleet A to fleet B 📝

This Bash script allows you to copy environment variables from a balena fleet or device to another.

## Prerequisites🚀
1) balena cli : https://github.com/balena-io/balena-cli
2) jq : https://stedolan.github.io/jq/

## Usage 🔥
### Copying envs from fleet A to B
```
./balena-copy.sh <source_fleet_name> <destination_fleet_name>
```
Where ```<source_fleet_name>``` is the name of the fleet where the environment variables will be copied from, and ```<destination_fleet_name>``` is the name of the fleet where the environment variables will be copied to.

### Copying envs from device A to B
```
./balena-copy-device.sh <source_device_uuid> <destination_device_uuid>
```
Where ```<source_device_uuid``` is the source device uuid, and ```<destination_device_uuid``` is the destination device uuid

> [!NOTE]
> You must be logged in to the Balena CLI with an account that has access to both fleets in order to use this script.

> [!TIP]
> ```--service='my-service'``` can be used to copy specific variables from a single service or several.
