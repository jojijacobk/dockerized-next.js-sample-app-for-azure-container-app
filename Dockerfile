# Dockerfile

# base image
FROM node:alpine

# set an env variable to let npm commands know that the commands are running inside a container, and halt execution otherwise.
ENV IS_CONTAINER=1

# create & set working directory and user
RUN mkdir -p /app
WORKDIR /app

# copy source files, install dependencies & build app
COPY . .
RUN npm install
RUN npm run build
EXPOSE 3000

# start app
ENTRYPOINT ["npm", "run", "start"]
