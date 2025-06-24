#!/bin/bash

# Splunk Universal Forwarder Setup Script for AWS EC2 (Linux)

echo "🚀 Installing Splunk Universal Forwarder on EC2 instance..."

# === Configurable Variables ===
SPLUNK_VERSION="9.2.0"
SPLUNK_FILENAME="splunkforwarder-${SPLUNK_VERSION}-d843a6301d41-Linux-x86_64.tgz"
SPLUNK_URL="https://download.splunk.com/products/universalforwarder/releases/${SPLUNK_VERSION}/linux/${SPLUNK_FILENAME}"
SPLUNK_HOME="/opt/splunkforwarder"
SPLUNK_USER="splunk"
SPLUNK_PASS="changeme"  # NOTE: Change this in production
SPLUNK_INDEXER_IP="10.0.0.50"  # Placeholder IP
SPLUNK_INDEXER_PORT="9997"

# === Download & Install ===
wget $SPLUNK_URL -O /tmp/$SPLUNK_FILENAME
tar -xzf /tmp/$SPLUNK_FILENAME -C /opt

# === Create Splunk User and Set Permissions ===
useradd -r $SPLUNK_USER
chown -R $SPLUNK_USER:$SPLUNK_USER $SPLUNK_HOME

# === Start and Configure Forwarder ===
$SPLUNK_HOME/bin/splunk start --accept-license --answer-yes --no-prompt --seed-passwd $SPLUNK_PASS
$SPLUNK_HOME/bin/splunk enable boot-start
$SPLUNK_HOME/bin/splunk add monitor /var/log -auth admin:$SPLUNK_PASS
$SPLUNK_HOME/bin/splunk add forward-server $SPLUNK_INDEXER_IP:$SPLUNK_INDEXER_PORT -auth admin:$SPLUNK_PASS

echo "✅ Splunk Universal Forwarder installation complete."
