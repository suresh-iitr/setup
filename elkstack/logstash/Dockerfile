FROM ubuntu:20.04

RUN useradd -d /home/esuser -m esuser
WORKDIR /home/esuser
COPY --chown=esuser:esuser ./logstash-8.10.2 logstash
COPY --chown=esuser:esuser docker-entrypoint.sh docker-entrypoint.sh
ADD logstash.conf /home/esuser/logstash/logstash.conf
EXPOSE 5044

CMD ["bash","./docker-entrypoint.sh"]
