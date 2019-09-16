FROM node:10-alpine

ARG NODE_ENV=production
ENV NODE_ENV $NODE_ENV

# default to port 3000 for node, and 9229 for debug
ARG PORT=3000
ENV PORT $PORT
EXPOSE $PORT 9229

# you'll likely want the latest npm, regardless of node version, for speed and fixes
# but pin this version for the best stability
RUN npm i npm@latest -g

RUN mkdir /home/node//app && chown node:node /home/node/app
WORKDIR /home/node/app

USER node
COPY package.json package-lock.json* ./
RUN npm install --no-optional && npm cache clean --force
ENV PATH /home/node/app//node_modules/.bin:$PATH

WORKDIR /opt/node_app/app
COPY . .

# It's best to run node directly, rather than npm
CMD [ "node", "./bin/www" ]
