#!/bin/bash
echo "move" "$1" "->" "$2"
mv "$1" "$2"/"$1"
ln -sf "$2"/"$1" "$1"
