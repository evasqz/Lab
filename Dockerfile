FROM node:16.14.0-alpine

# set working directory
WORKDIR /app

# install app dependencies
COPY package.json ./
COPY package-lock.json ./
RUN npm install --silent
RUN npm install react-scripts@3.4.1 -g --silent
RUN apk add sed

# add app
COPY . ./

# Replace text change_variable
RUN export change_variable="EDWIN VASQUEZ" ; sed -i -r "s/CHANGE_VARIABLE/${change_variable}/g" /app/src/App.js

# start app
CMD ["npm", "start"]




