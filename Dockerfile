# Dockerfile

# base image
FROM node:alpine AS base
FROM base AS deps
# set an env variable to let npm commands know that the commands are running inside a container, and halt execution otherwise.
ENV IS_CONTAINER=1
# create & set working directory and user
RUN mkdir -p /app && chown node:node /app
WORKDIR /app
# copy package.json, install dependencies, copy source files & build app
COPY --chown=node:node package.json /app
RUN npm install
FROM deps AS builder
COPY --chown=node:node pages /app/pages
COPY --chown=node:node public /app/public
COPY --chown=node:node styles /app/styles
COPY --chown=node:node next.config.js /app
USER node
EXPOSE 3000
RUN npm run build
FROM builder AS runner
# start app
CMD ["npm", "run", "dev"]
