FROM node:8.2.1

RUN mkdir /home/node/app
WORKDIR /home/node/app

RUN npm install -g create-react-app

RUN chown -R node:node .
USER node

ENTRYPOINT ["create-react-app"]
