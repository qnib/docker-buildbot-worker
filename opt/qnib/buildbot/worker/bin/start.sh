#!/usr/local/bin/dumb-init /bin/bash

source /opt/qnib/consul/etc/bash_functions.sh
wait_for_srv buildbot-master

/usr/bin/buildbot-worker create-worker /var/lib/buildbot/ buildbot-master example-worker pass
/usr/bin/buildbot-worker start --nodaemon

