FROM debian:stable-slim

LABEL org.opencontainers.image.source=https://github.com/cr0ssing/pdsadmin-docker
LABEL org.opencontainers.image.description="PDSAdmin"
LABEL org.opencontainers.image.licenses=GPL

RUN apt-get update && apt-get upgrade --yes \
  && apt-get install --yes --no-install-recommends ca-certificates curl jq openssl \
  && mkdir /pdsadmin && curl -O --output-dir /pdsadmin https://raw.githubusercontent.com/bluesky-social/pds/main/pdsadmin.sh \
  && chmod +x /pdsadmin/pdsadmin.sh && mkdir /pds

WORKDIR /pdsadmin

HEALTHCHECK --interval=60s --timeout=5s --start-period=5s \
  CMD /pdsadmin/pdsadmin.sh help >> /dev/null

CMD rm -f /pds/pds.env; env | grep '^PDS_' > /pds/pds.env; tail -f /dev/null
