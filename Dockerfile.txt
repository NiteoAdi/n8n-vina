FROM n8nio/n8n:latest

USER root

# Install AutoDock Vina + Open Babel (using apk for Alpine)
RUN apk update && \
    apk add --no-cache autodock-vina openbabel wget

USER node
