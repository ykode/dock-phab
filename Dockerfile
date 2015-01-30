FROM ykode/php5-fpm:azure

MAINTAINER Didiet Noor <didiet@ykode.com>

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get -y update && apt-get -y install git-core supervisor \
    python-pygments sendmail && apt-get -y clean && rm -fr /var/lib/apt/lists/* /tmp/* /var/tmp/*

ENV PHAB_WORKDIR /phab

VOLUME ${PHAB_WORKDIR}

WORKDIR ${PHAB_WORKDIR}

ADD phab-docker-install /phab/phab-install

COPY phd.conf /etc/supervisor/conf.d/phd.conf

EXPOSE 9000

CMD [ "sh", "/phab/phab-install" ]
