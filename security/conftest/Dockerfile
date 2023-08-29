ARG VERSION=20
FROM node AS builder

WORKDIR /app

ADD package.json .
ADD package-lock.json .

RUN apt install -y telnetd
RUN npm ci

ADD main.js .
ADD metrics.js .
ADD public public
ADD views views

ENV PORT=3000 METRICS_PORT=3100

EXPOSE ${PORT} ${METRICS_PORT}

ENTRYPOINT node main
