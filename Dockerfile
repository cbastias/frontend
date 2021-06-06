FROM node:alpine as builder
WORKDIR /user/app
COPY package.json .
RUN npm install
COPY . .
RUN npm run build

FROM nginx
COPY --from=builder /user/app/build /usr/share/nginx/html
