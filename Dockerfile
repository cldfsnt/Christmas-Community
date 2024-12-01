FROM node:20-alpine

RUN apk --no-cache add curl

ENV PORT=3000
ENV DB_PREFIX=/data/dbs/
ENV DB_LOG_FILE=/dev/null

ENV SECRET_DIRNAME=/data

WORKDIR /usr/src/app

COPY . .
RUN npm install --silent && \
    npm run build && \
    rm -rf node_modules && \
    npm install --production --silent && \
    mkdir -p /data/dbs

CMD ["./Dockerstart.sh"]
