#docker pull jwilder/nginx-proxy
docker stop nginx-proxy
docker rm nginx-proxy
docker run --name="nginx-proxy" -d -p 80:80 -v /opt/docker-files/ansible-docker-nginx/docker/nginx-proxy/extra-proxy.conf:/etc/nginx/conf.d/my_proxy.conf:ro -v /var/run/docker.sock:/tmp/docker.sock:ro jwilder/nginx-proxy 
