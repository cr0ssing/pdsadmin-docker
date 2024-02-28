# Copyright (C) 2024 Robin Lamberti.

# This file is part of pdsadmin-docker.

# pdsadmin-docker is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# (at your option) any later version.

# pdsadmin-docker is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with pdsadmin-docker. If not, see <http://www.gnu.org/licenses/>.

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
