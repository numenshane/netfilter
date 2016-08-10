FROM outcoldman/splunk:6.3.1-forwarder 
MAINTAINER Denis Gladkikh <docker-stats-splunk-forwarder@denis.gladkikh.email> 
ENV DOCKER_VERSION 1.11.1 
ENV PATH /bin:$PATH
ENV SPLUNK_BACKUP_DOCKER_APP ${SPLUNK_BACKUP_DEFAULT_ETC}/etc/apps/docker 
#RUN apt-get update \
#   && apt-get install -y wget jq \
#   && apt-get install -y curl
RUN mkdir -p ${SPLUNK_BACKUP_DOCKER_APP}/bin
#RUN wget -qO ${SPLUNK_BACKUP_DOCKER_APP}/bin/docker https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}
#RUN curl -SL -O https://get.docker.com/builds/Linux/x86_64/docker-${DOCKER_VERSION}.tgz && sudo tar zxf docker-1.11.1.tgz -C ${SPLUNK_BACKUP_DOCKER_APP}/bin/
#COPY ./docker ${SPLUNK_BACKUP_DOCKER_APP}/bin/
COPY docker /usr/bin/
#RUN chmod +x ${SPLUNK_BACKUP_DOCKER_APP}/bin/docker 
RUN chmod +x /usr/bin/docker
#RUN apt-get purge -y --auto-remove wget curl \
#    && rm -rf /var/lib/apt/lists/*
COPY inputs.conf ${SPLUNK_BACKUP_DOCKER_APP}/default/
COPY props.conf ${SPLUNK_BACKUP_DOCKER_APP}/default/
COPY docker_inspect.sh ${SPLUNK_BACKUP_DOCKER_APP}/bin/
COPY docker_stats.sh ${SPLUNK_BACKUP_DOCKER_APP}/bin/
COPY docker_top.sh ${SPLUNK_BACKUP_DOCKER_APP}/bin/
COPY docker_events.sh ${SPLUNK_BACKUP_DOCKER_APP}/bin/
RUN chmod +x ${SPLUNK_BACKUP_DOCKER_APP}/bin/*.sh
