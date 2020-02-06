# Proxy pass & healthcheck responder

Useful for utility containers running on AWS ECS which don't easily let you respond to ELB healthchecks.

## Usage
Set the env var `LISTEN_PORT` to the port you nginx to listen on; It's used in the config like so:
```
server {
    listen ${LISTEN_PORT};
}
```

Set the env var `APP_HOST` to your application container host name & port; It's used in the config like so:
```
    location / {
        proxy_pass http://${APP_HOST};
        ...
    }
```

Set the env var `HEALTHCHECK_PATH` to the elb healthcheck path that you're using. It's used in the config like so:

```
    location ${HEALTHCHECK_PATH} {
       ...
    }
```

Set up ECS to use this container & link it to the other container your service is on.
