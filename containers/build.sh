#!/usr/bin/env bash

REPO=fstnetwork

GO_ETHEREUM_TAG="$REPO/go-ethereum:v1.8.21"
PARITY_ETHEREUM_TAG="$REPO/parity-ethereum:v2.3.3"
ETHEREUM_DASHBOARD_TAG="$REPO/ethereum-dashboard:v0.1.1"
AZURE_ETHEREUM_LAUNCHER_TAG="$REPO/azure-ethereum-launcher:v0.1.1"
AZURE_ETHEREUM_SERVICE_TAG="$REPO/azure-ethereum-service:v0.1.1"

echo ">>> Building Go-Ethereum image: ($GO_ETHEREUM_TAG)"
docker build -t $GO_ETHEREUM_TAG go-ethereum/

echo ">>> Building Parity-Ethereum image: ($PARITY_ETHEREUM_TAG)"
docker build -t $PARITY_ETHEREUM_TAG parity-ethereum/

echo ">>> Building Ethereum Launcher ($AZURE_ETHEREUM_LAUNCHER_TAG)"
docker build -t $AZURE_ETHEREUM_LAUNCHER_TAG azure-ethereum-launcher/

echo ">>> Building Azure Ethereum Service ($AZURE_ETHEREUM_SERVICE_TAG)"
docker build -t $AZURE_ETHEREUM_SERVICE_TAG azure-ethereum-service/

echo ">>> Building Ethereum Dashboard ($ETHEREUM_DASHBOARD_TAG)"
docker build -t $ETHEREUM_DASHBOARD_TAG ethereum-dashboard/
