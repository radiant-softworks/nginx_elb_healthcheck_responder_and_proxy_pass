FROM nginx:1.17.8

RUN rm /etc/nginx/conf.d/default.conf && mkdir -p /etc/nginx/templates

COPY ./default.template /etc/nginx/templates/default.template

CMD ["/bin/bash", "-c", "DOLLAR='$' envsubst < /etc/nginx/templates/default.template > /etc/nginx/conf.d/default.conf && exec nginx -g 'daemon off;'"]
