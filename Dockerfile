FROM node:0.10.32

ENV NODE_ENV production

RUN mkdir -p /tmp/nm && mkdir -p /hipache

ADD package.json /tmp/nm/package.json

RUN cd /tmp/nm && npm install --production
RUN cp -a /tmp/nm/node_modules /hipache

ADD . ./hipache
WORKDIR /hipache

EXPOSE 80

CMD ["node", "bin/hipache", "-c", "config/config_dev.json"]
