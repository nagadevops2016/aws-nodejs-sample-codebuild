#!/bin/bash

# Get the current version tag
CURRENT_TAG=$(git describe --abbrev=0)

# Increment the version number
NEW_TAG=$(echo $CURRENT_TAG | awk -F. -v OFS=. 'NF==1{print ++$NF}; NF>1{if(length($NF+1)>length($NF))$(NF-1)++; $NF=sprintf("%0*d", length($NF), ($NF+1)); print}')

# Create the git tag
git tag -a "$NEW_TAG" -m "Auto-tagging new version $NEW_TAG"

# Push the git tag
git push origin --tags
