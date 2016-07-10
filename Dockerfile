FROM qnib/buildbot-base

RUN curl -fsL https://github.com/buildbot/buildbot/archive/v${BUILDBOT_VER}.tar.gz |tar xfz - -C /tmp/
COPY /buildbot/worker/ /usr/src/buildbot/
RUN pip install  "/usr/src/buildbot/" && \
    rm -r /root/.cache

ADD opt/qnib/buildbot/worker/bin/start.sh /opt/qnib/buildbot/worker/bin/
ADD etc/supervisord.d/buildbot-worker.ini /etc/supervisord.d/
