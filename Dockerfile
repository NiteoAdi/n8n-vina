FROM n8nio/n8n:latest

USER root

# Install AutoDock Vina + Open Babel
RUN apt-get update && apt-get install -y \
    autodock-vina \
    openbabel \
    wget \
    && rm -rf /var/lib/apt/lists/*

USER node
