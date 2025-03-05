# Use a more recent LTS version of Node.js
FROM node:20-alpine

LABEL maintainer="vuegger@gmail.com"

# Install necessary system dependencies
RUN apk add --no-cache \
    bash \
    git \
    openssh \
    python3 \
    py3-pip \
    build-base \
    curl

WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package.json package-lock.json ./
RUN npm install --frozen-lockfile

# Copy project files
COPY . /app

# Install client dependencies and build the client
WORKDIR /app/client
RUN npm install --frozen-lockfile && npm run build

# Move back to root and build the main app
WORKDIR /app
RUN npm run build

# Expose the required port
EXPOSE 8080

# Start the application
CMD ["npm", "run", "start"]
