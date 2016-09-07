FROM ubuntu:16.04

RUN apt-get update && apt-get install -y wget apt-transport-https supervisor
RUN wget -q https://sensu.global.ssl.fastly.net/apt/pubkey.gpg -O- | apt-key add -
RUN echo "deb     https://sensu.global.ssl.fastly.net/apt sensu main" | tee /etc/apt/sources.list.d/sensu.list
RUN apt-get update && apt-get install -y sensu uchiwa
COPY ./configs/uchiwa.json /etc/sensu/uchiwa.json
COPY ./configs/sensu.conf /etc/supervisor/supervisord.conf

EXPOSE 3000 4567 5671 15672

CMD ["/usr/bin/supervisord"]