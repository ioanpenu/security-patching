#!/bin/bash

VAULT_PASS_FILE=~/.vault_pass.txt
HOSTVARS_DIR="host_vars"

# Create the host_vars directory if it doesn't exist
mkdir -p "$HOSTVARS_DIR"

# Prompt for list of hosts (space-separated)
read -p "Enter hostnames (space-separated): " -a HOSTS

# Loop over each hostname
for HOST in "${HOSTS[@]}"; do
  mkdir -p "$HOSTVARS_DIR/$HOST"

  echo -n "Enter sudo password for $HOST: "
  read -s PASSWORD
  echo

  # Temporary file to hold the YAML content
  TMPFILE=$(mktemp)
  echo "ansible_become_password: \"$PASSWORD\"" > "$TMPFILE"

  # Encrypt and store with ansible-vault
  ansible-vault encrypt "$TMPFILE" \
    --output "$HOSTVARS_DIR/$HOST/vault.yml" \
    --vault-password-file "$VAULT_PASS_FILE"

  echo "Vault created for $HOST at $HOSTVARS_DIR/$HOST/vault.yml"
  rm "$TMPFILE"
done
