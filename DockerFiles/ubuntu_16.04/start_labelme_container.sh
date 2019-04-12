#!/bin/bash

docker run \
--name labelme \
-p 8087:80 \
-d \
--entrypoint "/bin/bash" \
-t labelme

# restart apache inside the container
docker exec labelme service apache2 restart
