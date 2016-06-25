FROM aalboori/trytond:latest
MAINTAINER  Ahmed AlBoori <ahmed.boori@gmail.com>

# install additional modules
COPY modules.txt /

RUN pip install --requirement  modules.txt
