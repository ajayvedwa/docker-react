# base image is alpine
FROM node:alpine as builder

WORKDIR /app

# copy webapp files
COPY package*.json ./

# install dependencies
RUN npm install
COPY ./ ./

#default run command
CMD ["npm","run","build"]

FROM nginx
EXPOSE 80
COPY --from=builder /app/build /usr/share/nginx/html
