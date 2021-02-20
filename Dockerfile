FROM node:15.9-alpine3.13

RUN apk add dumb-init

RUN mkdir /app
WORKDIR /app

COPY package-lock.json .
COPY package.json .
COPY public public
COPY src src

RUN npm install

ENTRYPOINT [ "dumb-init" ]
CMD [ "npm", "start" ]
