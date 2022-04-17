FROM node:12-alpine3.14 as node

COPY . /tmp/app
WORKDIR /tmp/app

RUN sudo curl -L https://yt-dl.org/downloads/latest/youtube-dl -o /usr/local/bin/youtube-dl \
    && chmod a+rx /usr/local/bin/youtube-dl \ 
    && mkdir temp && npm install

CMD [ "npm", "start" ]