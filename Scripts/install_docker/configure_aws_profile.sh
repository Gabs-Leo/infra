#!/bin/bash

# Prompt for profile details
read -p "Enter AWS Profile Name: " profile_name
read -p "Enter AWS Access Key ID: " aws_access_key_id
read -p "Enter AWS Secret Access Key: " aws_secret_access_key
read -p "Enter Default Region (e.g., us-east-1): " default_region
read -p "Enter Output Type (e.g., json, text, table): " output_type

credentials_file="$HOME/.aws/credentials"
config_file="$HOME/.aws/config"

mkdir -p "$HOME/.aws"

echo "" >> "$credentials_file"
echo "[$profile_name]" >> "$credentials_file"
echo "aws_access_key_id = $aws_access_key_id" >> "$credentials_file"
echo "aws_secret_access_key = $aws_secret_access_key" >> "$credentials_file"

echo "" >> "$config_file"
echo "[profile $profile_name]" >> "$config_file"
echo "region = $default_region" >> "$config_file"
echo "output = $output_type" >> "$config_file"

echo "AWS profile '$profile_name' has been successfully added to the credentials and config files."