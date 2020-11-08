FROM node:14.15.0 AS shared

FROM shared AS develop
RUN yarn global add @vue/cli

FROM shared as build
WORKDIR /app
COPY package.json yarn.lock ./
RUN yarn install
COPY . .
RUN yarn build

FROM nginx:1.18.0 as server
COPY --from=build /app/dist /usr/share/nginx/html
