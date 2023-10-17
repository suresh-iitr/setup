FROM ubuntu:20.04

RUN useradd -d /home/esuser -m esuser
WORKDIR /home/esuser

COPY --chown=esuser:esuser ./elasticsearch-8.10.2 elasticsearch

# RUN chown -R esuser:esuser elasticsearch
COPY --chown=esuser:esuser docker-entrypoint.sh docker-entrypoint.sh

EXPOSE 9200 9300

CMD ["bash","./docker-entrypoint.sh"]
