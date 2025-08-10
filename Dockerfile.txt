# Use Ubuntu base so apt-get and scientific tools are available
FROM ubuntu:22.04

# Install system dependencies and scientific tools
RUN apt-get update && \
    apt-get install -y \
    curl gnupg2 ca-certificates \
    wget autodock-vina openbabel \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js v20 (matches n8n engine requirements)
RUN curl -fsSL https://deb.nodesource.com/setup_20.x | bash - \
    && apt-get install -y nodejs

# Install n8n globally
RUN npm install -g n8n

# Optionally, create persistent n8n data folder
RUN mkdir -p /home/node/.n8n

USER node

# Start n8n application
CMD ["n8n", "start"]
