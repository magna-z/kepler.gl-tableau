FROM node:10-alpine AS builder
COPY . /tmp/
WORKDIR /tmp
RUN set -ex \
    && npm install \
    && npm run build

FROM nginx:alpine
COPY --from=builder /tmp/build /var/www
COPY nginx.conf /etc/nginx/nginx.conf
