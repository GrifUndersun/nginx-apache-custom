FROM alpine:3.20.3

#COPY --chown=nginx:nginx fcgiwrap.socket		    /var/run/fcgiwrap.socket
COPY --chown=nginx:nginx letsencrypt/                       /etc/letsencrypt/
COPY --chown=nginx:nginx nginx/nginx.conf                   /etc/nginx/nginx.conf
#COPY --chown=nginx:nginx nginx/fastcgi_params               /etc/nginx/fastcgi_params
#COPY --chown=nginx:nginx nginx/fastcgi*                     /etc/nginx/
COPY --chown=nginx:nginx nginx/sites-available/default      /etc/nginx/conf.d/default.conf
#COPY --chown=nginx:nginx nginx/*gi_params*                  /etc/nginx/
#COPY --chown=nginx:nginx nginx/modules-enabled              /etc/nginx/modules-enabled
COPY --chown=nginx:nginx www/			            /var/www/

RUN apk add --no-cache \
    nginx \
    spawn-fcgi \
    fcgiwrap \
    procps \
    nginx-mod-http-image-filter \
    fcgi && \
    mkdir -p /var/cache/nginx /var/www/html /var/run && \
    chown -R nginx:nginx /etc/nginx /etc/letsencrypt /var/cache/nginx /var/www/html /var/log/nginx /run /var/run && \
    chmod 755 /var/run && \
    chmod +x /var/www/html/cpu.sh

USER nginx

EXPOSE 80 443

#CMD ["sh", "-c", "fcgiwrap -s unix:/var/run/fcgiwrap.socket & nginx -g 'daemon off;'"]
CMD ["sh", "-c", "fcgiwrap -s unix:/var/run/fcgiwrap.socket & nginx -g 'daemon off;'"]
#CMD ["sh", "-c", "exec nginx -g 'daemon off;' && fcgiwrap -s unix:/var/run/fcgiwrap.socket"]
#CMD ["sh", "-c", "exec nginx -g 'daemon off;'"]
#CMD "spawn-fcgi -s /var/run/fcgiwrap.socket -U nginx -G nginx /usr/bin/fcgiwrap & exec nginx -g 'daemon off;'"
