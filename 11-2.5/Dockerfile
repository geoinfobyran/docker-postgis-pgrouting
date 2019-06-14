FROM postgres:11
MAINTAINER Mike Dillon <mike@appropriate.io>

ENV POSTGIS_MAJOR 2.5
ENV POSTGIS_VERSION 2.5.2+dfsg-1~exp1.pgdg90+1

RUN apt-get update \
      && apt-cache showpkg postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR \
      && apt-get install -y --no-install-recommends \
           wget \
           ca-certificates \
           build-essential \
           cmake \
           libboost-graph-dev \
           libcgal-dev \
           postgresql-server-dev-$PG_MAJOR \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR=$POSTGIS_VERSION \
           postgresql-$PG_MAJOR-postgis-$POSTGIS_MAJOR-scripts=$POSTGIS_VERSION \
           postgis=$POSTGIS_VERSION \
      && rm -rf /var/lib/apt/lists/*

RUN wget -O pgrouting-2.6.1.tar.gz https://github.com/pgRouting/pgrouting/archive/v2.6.1.tar.gz
COPY ./make-pgrouting.sh /make-pgrouting.sh
RUN /make-pgrouting.sh

RUN mkdir -p /docker-entrypoint-initdb.d
COPY ./initdb-postgis.sh /docker-entrypoint-initdb.d/postgis.sh
COPY ./update-postgis.sh /usr/local/bin

