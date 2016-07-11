FROM qnib/buildbot-base

RUN mkdir -p /usr/src \
 && curl -fsL https://github.com/buildbot/buildbot/archive/v${BUILDBOT_VER}.tar.gz |tar xfz - -C /tmp/ \
 && mv /tmp/buildbot-${BUILDBOT_VER}/worker /usr/src/buildbot \
 && rm -rf /tmp/buildbot-${BUILDBOT_VER} \
 && pip install  "/usr/src/buildbot/" \
 && rm -r /root/.cache

ADD opt/qnib/buildbot/worker/bin/start.sh /opt/qnib/buildbot/worker/bin/
ADD etc/supervisord.d/buildbot-worker.ini /etc/supervisord.d/
