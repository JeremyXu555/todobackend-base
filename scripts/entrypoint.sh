#!/bin/bash
. /appenv/bin/activate
# the exec command will make the applicaiton and the the entrypoint.sh share the same process
# which matters when the docker container is shut down
exec $@
