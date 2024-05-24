#!/bin/bash

# Install stress if not already installed
if ! command -v stress &> /dev/null
then
    sudo yum install -y epel-release
    sudo yum install -y stress
fi

# Stress the CPU
echo "Stressing the CPU..."
stress --cpu 1 --timeout 600 # Stress 2 CPU cores for 10 minutes
