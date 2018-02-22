FROM ubuntu:xenial

ENV PRITUNL_VERSION "1.29.1618.85-0ubuntu1~xenial"

RUN echo "deb http://repo.pritunl.com/stable/apt xenial main" > /etc/apt/sources.list.d/pritunl.list \
    && apt-key adv --keyserver hkp://keyserver.ubuntu.com --recv 7568D9BB55FF9E5287D586017AE645C0CF8E292A \
    && apt-get -y update \
    && apt-get -y upgrade \
    && apt-get -y install iptables pritunl=${PRITUNL_VERSION}

EXPOSE 80
EXPOSE 443

CMD ["/opt/run.sh"]
COPY run.sh /opt/run.sh
