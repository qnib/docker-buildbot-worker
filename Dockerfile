FROM qnib/buildbot-base

ADD opt/qnib/buildbot/worker/bin/start.sh /opt/qnib/buildbot/worker/bin/
ADD etc/supervisord.d/buildbot-worker.ini /etc/supervisord.d/
