#!/bin/bash

docker run \
-v /data:/var/www/html \
--name labelmetest \
-p 8086:80 \
-d \
--entrypoint "/bin/bash" \
-t labelmetest

# restart apache inside the container
docker exec labelmetest service apache2 restart
