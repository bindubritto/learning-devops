FROM node:14

# Create app directory, all source will copy here.
WORKDIR /usr/src/app

# Install app dependencies
# A wildcard is used to ensure both package.json AND package-lock.json are copied
# where available (npm@5+)
# ./ means, everything will go inside working directory. Here, /app
COPY package*.json ./

RUN npm install
# If you are building your code for production
# RUN npm ci --only=production

# Bundle app source. Copy everything form root directory to working directory
COPY . .

# Expose with 8081 port to outer world from a container
EXPOSE 8081

# run external.js file
CMD [ "node", "external.js" ]