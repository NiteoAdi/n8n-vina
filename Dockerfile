# Use Ubuntu as the base so apt-get works
FROM ubuntu:22.04

# Install system dependencies and tools
RUN apt-get update && \
    apt-get install -y \
    curl gnupg2 ca-certificates \
    wget autodock-vina openbabel \
    && rm -rf /var/lib/apt/lists/*

# Install Node.js (needed for n8n)
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get install -y nodejs

# Install n8n globally
RUN npm install -g n8n

# Optional: Create persistent n8n folder
RUN mkdir -p /home/node/.n8n

USER node

CMD ["n8n", "start"]
