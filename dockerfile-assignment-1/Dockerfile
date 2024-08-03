# use this empty Dockerfile to build your assignment
FROM node:6-alpine
# NOTE: The instructions are now in the README.md file in this directory.

RUN apk add --no-cache tini

WORKDIR /user/src/app

COPY package.json package.json

RUN npm install && npm cache clean --force

EXPOSE 3000

CMD ["/sbin/tini", "--", "node", "./bin/www"]