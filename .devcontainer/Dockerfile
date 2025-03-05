FROM node:16-alpine # Use a more recent LTS Node.js version

LABEL maintainer="vuegger@gmail.com"

# Install system dependencies (combine into a single RUN layer)
RUN apk update && apk upgrade && \
    apk add --no-cache \
    bash \
    git \
    openssh \
    python3 \  # Use python3 instead of python2 (python2 is deprecated)
    py3-pip \
    alpine-sdk \
    gcc \
    make \
    curl \
    && rm -rf /var/cache/apk/* # Clean up apk cache

WORKDIR /app

# Copy package.json and package-lock.json first for better caching
COPY package*.json ./

# Set npm configurations (can be done in a single line)
RUN npm config set registry https://registry.npmjs.org/ && npm config set network-timeout 600000

# Install dependencies (use a single command)
RUN npm install --legacy-peer-deps # Consider removing --legacy-peer-deps if possible

# Copy the rest of the application code
COPY . .

# Build client (only if necessary - depends on your project structure)
RUN if [ -d "client" ]; then \
      cd client && \
      npm run build; \
    fi

# Build root project (likely unnecessary if you already built in the previous step)
# Consider if this step is actually needed. If the client build produces the final output, this might be redundant.
# RUN npm run build  # Remove this if the client build handles everything

EXPOSE 8080

CMD ["npm", "run", "start"]
