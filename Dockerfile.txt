# Use Ubuntu base for scientific tools
FROM ubuntu:22.04

# Prevent interactive prompts during package installation
ENV DEBIAN_FRONTEND=noninteractive

# Install system dependencies and scientific tools
RUN apt-get update && \
    apt-get install -y \
    curl gnupg2 ca-certificates \
    wget autodock-vina openbabel \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js v20
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - && \
    apt-get install -y nodejs

# Install n8n globally
RUN npm install -g n8n

# Create n8n user and directories
RUN useradd -m -s /bin/bash node && \
    mkdir -p /home/node/.n8n && \
    chown -R node:node /home/node

# Switch to node user
USER node
WORKDIR /home/node

# Expose port
EXPOSE 5678

# Start n8n
CMD ["n8n", "start"]
