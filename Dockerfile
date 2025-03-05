FROM ubuntu:18.04

LABEL maintainer="vuegger@gmail.com"

WORKDIR /app

RUN apt-get update && apt-get install -y \
    python2.7 \
    python2.7-dev \
    python3 \
    python3-pip \
    build-essential \
    curl \
    git \
    && rm -rf /var/lib/apt/lists/*

# Python 2 ve Python 3 bağlantılarını ayarla
RUN ln -sf /usr/bin/python2.7 /usr/bin/python
RUN ln -sf /usr/bin/python2.7 /usr/bin/python2

# pip güncelle
RUN python2 -m pip install --upgrade pip

# node-gyp ve gerekli modülleri yükle
RUN npm install -g node-gyp node-pre-gyp

# copy sources
COPY . /app

# install dependencies and build dist
RUN npm install && npm run build

# expose server
EXPOSE 443

CMD ["npm", "run", "start"]
