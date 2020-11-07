FROM node:14.15.0 AS shared

FROM shared AS develop
RUN yarn global add @vue/cli

#FROM shared AS server
#WORKDIR /usr/src/app
#COPY package*.json ./
#RUN npm install
#COPY . .
