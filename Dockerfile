# Use the official Nginx image from Docker Hub
FROM nginx

# Copy the custom nginx configuration files
COPY . .

ARG FULL_CHAIN_PEM
ENV FULL_CHAIN_PEM=$FULL_CHAIN_PEM
ARG PRIV_KEY_PEM
ENV PRIV_KEY_PEM=$PRIV_KEY_PEM
ARG NGINX_PROXY_PASS
ENV NGINX_PROXY_PASS=$NGINX_PROXY_PASS

COPY nginx.conf /etc/nginx/nginx.conf
COPY ssl/fullchain.pem /etc/nginx/ssl/fullchain.pem
COPY ssl/privkey.pem /etc/nginx/ssl/privkey.pem
COPY ssl.conf /etc/nginx/ssl.conf
COPY entrypoint.sh /usr/local/bin/entrypoint.sh

# Set execute permissions for the entrypoint script 
RUN chmod +x /usr/local/bin/entrypoint.sh

# Expose ports 80 and 443
EXPOSE 80
EXPOSE 443

# Set the entrypoint to your custom script
ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]