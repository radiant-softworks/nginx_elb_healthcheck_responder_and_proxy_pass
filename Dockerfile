from docker:1.17.8

COPY ./default.template /etc/nginx/conf.d/default.template

CMD ["/bin/bash", "-c", "envsubst < /etc/nginx/conf.d/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
