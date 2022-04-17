FROM node:14-alpine3.14 as node

COPY . /tmp/app
WORKDIR /tmp/app

RUN apk add --no-cache tzdata \
    && apk --update --no-cache add curl python3 ffmpeg \
    && apk add --no-cache ca-certificates \
    && ln -sf python3 /usr/bin/python \
    && python3 -m ensurepip \
    && pip3 install --no-cache --upgrade pip setuptools \
    && curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \
    && mkdir temp && npm install

CMD [ "npm", "start"]