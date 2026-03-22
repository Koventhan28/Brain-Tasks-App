FROM nginx:latest
WORKDIR /usr/share/nginx/html
RUN mkdir -p /var/cache/nginx /run && \
    chown -R nginx:nginx /var/cache/nginx /etc/nginx/conf.d /run
# For testing the port have changed from  80 to 3000 .Only in 80 the container 
# works in AWS EKS but it does not work in 3000
COPY default.conf /etc/nginx/conf.d/default.conf 
COPY /dist .
USER nginx
EXPOSE 3000
CMD ["nginx", "-g", "daemon off;"]
