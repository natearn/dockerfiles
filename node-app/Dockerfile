FROM node:alpine

RUN mkdir /home/node/app
WORKDIR /home/node/app

COPY package.json .
RUN npm install

COPY . .

RUN chown -R node:node .
USER node

CMD bash
