#!/bin/bash
echo "Hardware Corner text-generation-webui Pod started"

# Set the source and destination directories
SRC_DIR="/root/text-generation-webui"
DEST_DIR="/workspace/text-generation-webui"

# Check if the destination directory already exists
if [ -d "$DEST_DIR" ]; then
    echo "$DEST_DIR already exists!"
else
    # Move the source directory to the destination
    mv $SRC_DIR $DEST_DIR
    echo "Moved text-generation-webui to $DEST_DIR"
fi

# Update text-generation-webui
cd /workspace/text-generation-webui && git pull

# Update exllama
cd /workspace/text-generation-webui/repositories/exllama && git pull

# Navigate to run
cd /workspace/text-generation-webui

echo "Launching text-generation-webui"

python3 server.py --listen
