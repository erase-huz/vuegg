FROM node:9-alpine

LABEL maintainer="vuegger@gmail.com"

# Install system dependencies
RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    openssh \
    python2 \
    py2-pip \
    alpine-sdk \
    gcc \
    make \
    curl

WORKDIR /app

# Copy project files
COPY . /app

# Set npm configurations
RUN npm config set registry https://registry.npmjs.org/ && \
    npm config set network-timeout 600000

# Install dependencies with multiple fallback strategies
RUN cd client && \
    npm cache clean --force && \
    npm install --verbose || \
    npm install --legacy-peer-deps || \
    npm install

# Build client
RUN cd client && \
    npm run build

# Install root project dependencies
RUN npm install && \
    npm run build

EXPOSE 8080

CMD ["npm", "run", "start"]
