FROM postgres:11

COPY twitter-collector.sql /docker-entrypoint-initdb.d/
