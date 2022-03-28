FROM node:14.14.0-alpine

# Set working directory.
WORKDIR /usr/src/app

# Copy necessay files to build.
COPY package*.json ./

# Run NPM Install
RUN npm install

# Bundle files
COPY . .
RUN npm run build

# RUN chmod +x ./entrypoint.sh
# ENTRYPOINT ["./entrypoint.sh"]

EXPOSE 3000

CMD [ "npm", "start" ]