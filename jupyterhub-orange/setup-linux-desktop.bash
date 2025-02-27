#!/bin/bash
set -e

# Install Openbox and dependencies for GUI support
apt-get update && \
    apt-get install -y --no-install-recommends \
    openbox \
    tigervnc-standalone-server \
    supervisor \
    libgl1-mesa-glx \
    libxrender1 \
    x11-xserver-utils && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Create configuration directories
mkdir -p /etc/xdg/openbox
