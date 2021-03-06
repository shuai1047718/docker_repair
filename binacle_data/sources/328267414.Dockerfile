# This is a base Docker image used in prod/preview Jenkinsfile
FROM artifactory.wikia-inc.com/sus/php-wikia-base:225a68a

ADD app /usr/wikia/slot1/current/src
ADD config /usr/wikia/slot1/current/config

# WIKIA_ENVIRONMENT and WIKIA_DATACENTER - needed for maintenance scripts to run, but they are not used by rebuildLocalisationCache.php
RUN mkdir -p /usr/wikia/slot1/current/cache/messages && \
  chmod 777 /usr/wikia/slot1/current/cache/messages && \
  WIKIA_ENVIRONMENT=prod WIKIA_DATACENTER=sjc SERVER_ID=177 php maintenance/rebuildLocalisationCache.php --threads=16

USER nobody
