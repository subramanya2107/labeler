#!/bin/bash

docker run \
--name labeler \
-p 8089:80 \
-d \
--entrypoint "/bin/bash" \
-t labeler

# restart apache inside the container
docker exec labeler service apache2 restart
