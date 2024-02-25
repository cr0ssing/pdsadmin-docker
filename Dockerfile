FROM debian

LABEL org.opencontainers.image.source=https://github.com/cr0ssing/pdsadmin-docker
LABEL org.opencontainers.image.description="PDSAdmin"
LABEL org.opencontainers.image.licenses=GPL

RUN apt-get update && apt-get upgrade --yes \
  && apt-get install --yes ca-certificates curl gnupg jq lsb-release openssl sqlite3 xxd wget \
  && mkdir /pdsadmin && wget https://raw.githubusercontent.com/bluesky-social/pds/main/pdsadmin.sh -P /pdsadmin \
  && chmod +x /pdsadmin/pdsadmin.sh

VOLUME /pds pds
WORKDIR /pdsadmin

CMD rm -f /pds/pds.env; env | grep '^PDS_' > /pds/pds.env; tail -f /dev/null
