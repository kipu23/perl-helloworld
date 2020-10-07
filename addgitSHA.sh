#!/bin/bash

sha=`git rev-parse HEAD`

echo "Git commit SHA: $sha"

`cp *.pl /home/azureuser/`