from    node:0.10.32

env NODE_ENV production

RUN mkdir -p /tmp/nm && mkdir -p /hipache

ADD package.json /tmp/nm/package.json

RUN cd /tmp/nm && npm install --production
RUN cp -a /tmp/nm/node_modules /hipache

add . ./hipache
workdir /hipache

expose 80

cmd ["node", "bin/hipache", "-c", "config/config_dev.json"]
