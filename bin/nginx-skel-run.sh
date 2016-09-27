docker stop container 
docker rm container
cd /opt/docker-files/ansible-docker-nginx/docker
docker build -t slac/nginx /opt/docker-files/ansible-docker-nginx/docker/
docker run -d \
    --name container \
    -e WEB_DOCUMENT_ROOT=/app/container \
    -e WEB_ALIAS_DOMAIN="container.org,*.container.org" \
    -e VIRTUAL_HOST="container.org,*.container.org" \
    --restart=always \
    --volumes-from nginx-data \
    --env-file=env_file \
    --link slac-mysql \
    --link memcache \
    -p 82:80 \
    -m 256m \
    -d slac/nginx
