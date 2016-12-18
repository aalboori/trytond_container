FROM debian:jessie

MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

# explicitly set user/group IDs
RUN groupadd -r trytond --gid=999 && useradd -r -g trytond --uid=999 trytond

#install GOSU
ENV GOSU_VERSION 1.9
RUN set -x \
    && apt-get update && apt-get install -y --no-install-recommends ca-certificates wget && rm -rf /var/lib/apt/lists/* \
    && dpkgArch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" \
    && wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch" \
    && wget -O /usr/local/bin/gosu.asc "https://github.com/tianon/gosu/releases/download/$GOSU_VERSION/gosu-$dpkgArch.asc" \
    && export GNUPGHOME="$(mktemp -d)" \
    && gpg --keyserver ha.pool.sks-keyservers.net --recv-keys B42F6819007F00F88E364FD4036A9C25BF357DD4 \
    && gpg --batch --verify /usr/local/bin/gosu.asc /usr/local/bin/gosu \
    && rm -r "$GNUPGHOME" /usr/local/bin/gosu.asc \
    && chmod +x /usr/local/bin/gosu \
    && gosu nobody true \
    && apt-get purge -y --auto-remove ca-certificates wget

#install pre-requisites using apt
RUN  apt-get update && apt-get install -y \
	python-pip \
	python-dev \
	python-psycopg2 \
	python-lxml \
	npm\
	git\
&& rm -rf /var/lib/apt/lists/*

#install pre-requisites using pip packages
RUN pip install \
	relatorio \
	python-dateutil \
	polib \
	python-sql \
	python-levenshtein \
	wrapt \
	simplejson \
	pydot

# customization scripts
RUN mkdir /docker-entrypoint-initdb.d

# install main server
RUN pip install trytond

# getting trytond sao web client

RUN apt-get update && apt-get install -y wget && rm -rf /var/lib/apt/lists/* \
	&& mkdir -p /var/www/localhost/ \
	&& wget https://downloads.tryton.org/current/tryton-sao-last.tgz \  
	&& tar -zxvf tryton-sao-last.tgz -C /var/www/localhost/ \
	&& mv /var/www/localhost/package /var/www/localhost/tryton \
	&& apt-get purge -y --auto-remove wget

WORKDIR /var/www/localhost/tryton

RUN ln -s /usr/bin/nodejs /usr/bin/node

RUN npm install  \
	&& ./node_modules/bower/bin/bower --allow-root install \
	&& ./node_modules/grunt-cli/bin/grunt

WORKDIR /

#running the server
EXPOSE 8000
ENV TRYTOND_DATA=/var/lib/trytond

# default environment for the server
COPY trytond.conf /

# volume for storing trytond files

VOLUME  /var/lib/trytond

COPY docker-entrypoint.sh /

ENTRYPOINT ["/docker-entrypoint.sh"]

CMD ["trytond"]
