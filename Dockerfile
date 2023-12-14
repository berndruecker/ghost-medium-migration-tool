FROM ubuntu:22.04
ENV NODE_VERSION=18

RUN apt-get update \
    && apt-get install -y curl \
    && curl -fsSL https://deb.nodesource.com/setup_${NODE_VERSION}.x | bash - \
    && apt-get install -y nodejs
RUN apt-get update \
    && apt-get install -y make \
    && apt-get install -y build-essential

WORKDIR /usr/app
COPY ./ /usr/app

# Install https://github.com/TryGhost/migrate/tree/main/packages/mg-medium-export
RUN npm install --global @tryghost/migrate
RUN npm install @tryghost/mg-medium-export --save

# Migrate
CMD migrate medium --pathToZip /input.zip

# Run with
# docker run -v ${PWD}/medium-export.zip:/input.zip
# docker run -v %cd%/medium-export.zip:/input.zip