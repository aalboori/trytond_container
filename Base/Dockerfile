FROM debian:jessie

MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

#install pre-requisites using apt
RUN  apt-get update && apt-get install -y \
	python-pip \
	python-dev \
	python-psycopg2 \
	python-lxml \
&& rm -rf /var/lib/apt/lists/*

#install pre-requisites using pip packages
RUN pip install \
	relatorio \
	python-dateutil \
	polib \
	python-sql \
	python-levenshtein \
	simplejson \
	pydot

# install main server
RUN pip install trytond

#running the server
EXPOSE 8000

ENTRYPOINT ["/usr/local/bin/trytond"]