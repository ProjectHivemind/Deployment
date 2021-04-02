# Stage for certificate generation
FROM debian:buster as certificate-generator

# Set DOMAIN environment variables used by lets-encrypt
ARG DOMAIN
ENV DOMAIN=$DOMAIN

# Copy and run certificate generation script
COPY tls.sh /tmp/tls.sh
RUN bash /tmp/tls.sh

# Stage for minimal production image
FROM nginx:alpine as prod

# Copy generated TLS files from generation stage
COPY --from=certificate-generator /tmp/server.crt /etc/nginx/server.crt
COPY --from=certificate-generator /tmp/server.key /etc/nginx/server.key

# Copy in nginx configuration
COPY proxy.conf /etc/nginx/conf.d/default.conf
