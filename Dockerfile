FROM nginx:alpine
LABEL org.opencontainers.image.source https://github.com/RuthW-Ssi/SpringBoot
COPY ./html /usr/share/nginx/html

