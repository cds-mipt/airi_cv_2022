#!/bin/bash

docker exec --user "docker_user" -it airi_cv \
        /bin/bash -c "cd /home/${USER}; /bin/bash"
