FROM ubuntu:18.04

RUN apt-get update && apt-get install -y \
    python2.7 \
    python-pip \
    git \
    && rm -rf /var/lib/apt/lists/*

# Python 2'yi varsayılan Python olarak ayarla
RUN ln -sf /usr/bin/python2.7 /usr/bin/python

# pip'i güncelleyin
RUN pip install --upgrade pip

# Çalışma dizinini ayarlayı



LABEL maintainer="vuegger@gmail.com"

# install git
RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh

WORKDIR /app

# copy sources
COPY . /app

# install dependencies and build dist
RUN npm run install:all && \
    npm run build

# expose server
EXPOSE 443

CMD ["npm", "run", "start"]
