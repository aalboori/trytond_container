
FROM aalboori/trytond:latest
MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

#install pre-requisites using apt
RUN  apt-get update && apt-get install -y \
	unoconv \
&& rm -rf /var/lib/apt/lists/*


# install additional modules
COPY modules.txt /

RUN pip install --requirement  modules.txt
