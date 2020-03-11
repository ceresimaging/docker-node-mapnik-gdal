FROM node:12-buster-slim

ARG NODE_ENV
ENV NODE_ENV=${NODE_ENV}

# Install system dependencies
RUN apt update -y && \
    apt install -y \
        python zlib1g-dev clang g++ make pkg-config curl git \
        libgdal-dev libpng-dev libproj-dev libboost-regex-dev scons \
        libboost-filesystem-dev libboost-system-dev libharfbuzz-dev \
        libboost-program-options-dev libcurl4-gnutls-dev \
        libfreetype6-dev libharfbuzz-dev libcairo2-dev

# Clone and build Mapnik
WORKDIR /src
RUN git clone https://github.com/mapnik/mapnik.git
WORKDIR /src/mapnik
RUN git submodule update --init
RUN ./configure
RUN JOBS=4 make
RUN make install

# Clone and build Mapnik binding for Node
WORKDIR /src
RUN git clone https://github.com/mapnik/node-mapnik.git
WORKDIR /src/node-mapnik
RUN make release_base