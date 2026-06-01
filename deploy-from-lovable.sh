#!/bin/bash
set -e

# Download the entire Lovable website
echo "Downloading website from Lovable..."
wget --mirror \
  --convert-links \
  --adjust-extension \
  --page-requisites \
  --no-parent \
  --wait=1 \
  --timeout=10 \
  -P ./lovable-download \
  https://openroad-gold-drive.lovable.app/

# Extract the downloaded files
echo "Extracting files..."
cd lovable-download/openroad-gold-drive.lovable.app
find . -type f -exec chmod 644 {} \;

# Move all files to repo root (keeping CNAME and .git)
echo "Preparing deployment..."
cd ../..
cp -r lovable-download/openroad-gold-drive.lovable.app/* .

# Clean up
rm -rf lovable-download

echo "✅ Website downloaded and ready to commit!"
