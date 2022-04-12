FROM node:8-alpine

ADD . app/

WORKDIR /app

RUN npm i

CMD sleep 5 && node src/app.js