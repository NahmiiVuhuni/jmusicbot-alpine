FROM alpine:3.13.1

LABEL Maintainer="Hubok <docker-maint@hubok.net>" \
      Description="JMusicBot (Discord music bot) on Alpine."

ARG VERSION_JMB=0.3.3
ARG VERSION_JAVA=11

COPY src /

RUN addgroup -g 1000 jmb \
 && adduser -D -u 1000 -G jmb jmb

WORKDIR /opt/jmb

RUN apk -U upgrade --no-cache \
 && apk add --no-cache openjdk${VERSION_JAVA}-jre \
 && apk add --no-cache --virtual .setup curl \
 && curl -L https://github.com/jagrosh/MusicBot/releases/download/{$VERSION_JMB}/JMusicBot-{$VERSION_JMB}.jar -o /opt/jmb/jmusicbot.jar \
 && apk del --no-cache .setup \
 && ln -s /opt/jmb/config/config.txt /opt/jmb/config.txt \
 && ln -s /opt/jmb/config/serversettings.json /opt/jmb/serversettings.json \
 && chown -R jmb:jmb /opt/jmb \
 && chmod 700 /opt/jmb/docker-entrypoint.sh

STOPSIGNAL SIGTERM

ENV VERSION_JMB     $VERSION_JMB
ENV VERSION_JAVA    $VERSION_JAVA

USER jmb

ENTRYPOINT [ "/opt/jmb/docker-entrypoint.sh" ]
