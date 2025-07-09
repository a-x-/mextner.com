#!/bin/bash

# Exit on error
set -e

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Configuration
REMOTE_USER="www-data"
REMOTE_HOST="104.248.84.190"
REMOTE_PATH="/var/www/mextner.com"

echo -e "${YELLOW}🚀 Starting deployment to mextner.com${NC}"

# Build the site
echo -e "${YELLOW}📦 Building Hugo site...${NC}"
hugo --minify

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Hugo build successful${NC}"
else
    echo -e "${RED}❌ Hugo build failed${NC}"
    exit 1
fi

# Deploy to server
echo -e "${YELLOW}📤 Deploying to server...${NC}"
rsync -avz --delete \
    --exclude '.DS_Store' \
    --exclude '*.swp' \
    --exclude 'Thumbs.db' \
    --progress \
    public/ \
    ${REMOTE_USER}@${REMOTE_HOST}:${REMOTE_PATH}/

if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Deployment complete!${NC}"
    echo -e "${GREEN}🌐 Site is live at: https://mextner.com${NC}"
else
    echo -e "${RED}❌ Deployment failed${NC}"
    exit 1
fi