# General
This repository contains scripts and commands to simplify system setup, maintenance, and configuration.

--- 
# Scripts
## Check free ips
Scans a subnet and lists used/free IP addresses.
- **Dependency:** `nmap`

## Config cleanup
Moves selected config folders to a backup directory for easier and safer manual removal.  
⚠️ **Note:** This script does *not* scan for orphaned or unused config folders. You must manually choose which folders to move.

## System update
As the name says, this script is used together with an alias, to easily update, delete orphaned packages and clean package cache.

# Usage
To use these scripts, firstly they need execute rights. 
```bash
sudo chmod +x fileName
```

Then they can be executed using:  
```bash
./fileName
```

---

# Useful commands (personal cheat sheet)

## Ssh key creation and registration
### Key generation
```bash
ssh-keygen -t ed25519 
```
### Key registration
This is needed if the needed ssh key has a passphrase.
```bash
eval "$(ssh-agent -s)"
ssh-add ~/.ssh/{KEY_NAME}
```
⚠️ **Note:** Use the private key name.

### Testing the key (github)
```bash
ssh -T git@github.com
```
