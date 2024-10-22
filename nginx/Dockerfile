FROM alpine:3.20.3

RUN addgroup -S nginx && adduser -S nginx -G nginx

#COPY --chown=nginx:nginx fcgiwrap.socket		    /var/run/fcgiwrap.socket

RUN apk add --no-cache \
    nginx \
    spawn-fcgi \
    fcgiwrap \
    procps \
    nginx-mod-http-image-filter \
    fcgi && \
    mkdir -p /var/cache/nginx /var/www/html /var/run && \
    chown -R nginx:nginx /etc/nginx /var/cache/nginx /var/www/html /var/log/nginx /run /var/run && \
    chmod 755 /var/run && \
    chmod +x /var/www/html/cpu.sh

COPY --chown=nginx:nginx nginx/nginx.conf                   /etc/nginx/nginx.conf
COPY --chown=nginx:nginx nginx/sites-available/default      /etc/nginx/conf.d/default.conf
COPY --chown=nginx:nginx www/			            /var/www/

USER nginx

EXPOSE 80 443

#CMD ["sh", "-c", "fcgiwrap -s unix:/var/run/fcgiwrap.socket & nginx -g 'daemon off;'"]
CMD ["sh", "-c", "fcgiwrap -s unix:/var/run/fcgiwrap.socket & nginx -g 'daemon off;'"]
#CMD ["sh", "-c", "exec nginx -g 'daemon off;' && fcgiwrap -s unix:/var/run/fcgiwrap.socket"]
#CMD ["sh", "-c", "exec nginx -g 'daemon off;'"]
#CMD "spawn-fcgi -s /var/run/fcgiwrap.socket -U nginx -G nginx /usr/bin/fcgiwrap & exec nginx -g 'daemon off;'"
