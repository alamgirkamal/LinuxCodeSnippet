#!/bin/bash

# Exit on error
set -e

# Check for root privileges
if [[ $EUID -ne 0 ]]; then
    echo "This script must be run as root."
    exit 1
fi

# Check arguments
if [[ $# -ne 1 ]]; then
    echo "Usage: $0 <username>"
    exit 1
fi

USERNAME="$1"

# Generate a complex password (16 chars: A-Z, a-z, 0-9, symbols)
PASSWORD=$(tr -dc 'A-Za-z0-9!@#$%^&*()_+=-' < /dev/urandom | head -c 16)

# Create user with home directory
if id "$USERNAME" &>/dev/null; then
    echo "User '$USERNAME' already exists."
else
    useradd -m "$USERNAME"
    echo "User '$USERNAME' created."
fi

# Assign password
echo "$USERNAME:$PASSWORD" | chpasswd
echo "Password assigned."

# Add to wheel group for sudo access
usermod -aG wheel "$USERNAME"
echo "User '$USERNAME' added to wheel (sudo) group."

echo "----------------------------------------"
echo "User creation complete."
echo "Username: $USERNAME"
echo "Password: $PASSWORD"
echo "----------------------------------------"
