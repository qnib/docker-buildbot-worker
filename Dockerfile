FROM qnib/buildbot-base

COPY /buildbot/worker/ /usr/src/buildbot/
RUN pip install  "/usr/src/buildbot/" && \
    rm -r /root/.cache

WORKDIR /var/lib/buildbot
VOLUME /var/lib/buildbot
CMD ["/usr/src/buildbot/docker/master/start_buildbot.sh"]
