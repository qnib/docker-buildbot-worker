FROM qnib/buildbot-base

ENV DOCKER_HOST=unix:///var/run/docker.sock

RUN apk add --update docker
ADD opt/qnib/buildbot/worker/bin/start.sh /opt/qnib/buildbot/worker/bin/
ADD opt/qnib/docker/engine/bin/start.sh /opt/qnib/docker/engine/bin/
ADD etc/supervisord.d/buildbot-worker.ini \
    etc/supervisord.d/docker-engine.ini \
    /etc/supervisord.d/
ADD etc/consul.d/docker-engine.json /etc/consul.d/
VOLUME ["/var/lib/buildbot"]
