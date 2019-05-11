CREATE USER "twitter-collector" WITH
  LOGIN
  NOSUPERUSER
  INHERIT
  NOCREATEDB
  NOCREATEROLE
  NOREPLICATION
  CONNECTION LIMIT 50
  PASSWORD 'twitter';
  
CREATE DATABASE "twitter-collector"
    WITH 
    OWNER = "twitter-collector"
    ENCODING = 'UTF8'
    LC_COLLATE = 'en_US.utf8'
    LC_CTYPE = 'en_US.utf8'
    TABLESPACE = pg_default
    CONNECTION LIMIT = 100;

\connect "twitter-collector";

CREATE SCHEMA "twitter_collector"
    AUTHORIZATION "twitter-collector";

CREATE TABLE "twitter_collector".tweet
(
    id SERIAL,
    tag text COLLATE pg_catalog."default",
    message text COLLATE pg_catalog."default",
    user_name text COLLATE pg_catalog."default",
    user_followers bigint,
    insert_date timestamp(6) with time zone DEFAULT CURRENT_TIMESTAMP,
    data json
)
WITH (
    OIDS = FALSE
)
TABLESPACE pg_default;

ALTER TABLE "twitter_collector".tweet
    OWNER to "twitter-collector";