
FROM aalboori/trytond:latest
MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

#install pre-requisites using apt
RUN  apt-get update && apt-get install -y \
	unoconv \
	libldap2-dev \
	libsasl2-dev \
	libssl-dev \
&& rm -rf /var/lib/apt/lists/*

#download list of modules

ADD https://downloads.tryton.org/modules.txt /

RUN sed -i 's/^.*/trytond_&/' modules.txt

# install additional modules

RUN pip install --requirement  modules.txt
