FROM node:boron

MAINTAINER Ivan Font <ifont@redhat.com>

# Create app directory
RUN mkdir -p /usr/src/app
WORKDIR /usr/src/app

# Clone game source code
#UN sudo rm -r pacman
RUN git clone https://github.com/ramonpizana/pacman .

# Install app dependencies
RUN rm -rf node_modules
RUN npm install pug --save --legacy-peer-deps

# Expose port 8080
EXPOSE 8080

# Run container
CMD ["npm", "start"]
