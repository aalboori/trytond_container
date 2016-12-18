
FROM aalboori/trytond:latest
MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

#install pre-requisites using apt
RUN  apt-get update && apt-get install -y \
	unoconv \
&& rm -rf /var/lib/apt/lists/*

#download list of modules

ADD https://downloads.tryton.org/modules.txt /

RUN sed 's/^.*/trytond_&/' modules.txt

# install additional modules

RUN pip install --requirement  modules.txt
