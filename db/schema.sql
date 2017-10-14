\c toiletteer
-- users
CREATE TABLE users(
  id SERIAL PRIMARY KEY,
  email VARCHAR(256) NOT NULL UNIQUE,
  name VARCHAR (64) NOT NULL,
  password CHAR(40) NOT NULL,
  salt CHAR(40) NOT NULL,
  facebook_token VARCHAR(512) NULL DEFAULT NULL
);

CREATE INDEX idx_users_facebook_token ON users (facebook_token);


-- toilets
CREATE TABLE address(
  id SERIAL PRIMARY KEY,
  line1 VARCHAR(128) NOT NULL,
  line2 VARCHAR(128) NULL DEFAULT NULL,
  city VARCHAR(64) NOT NULL,
  state VARCHAR(64) NOT NULL,
  country VARCHAR(128) NOT NULL,
  zipcode VARCHAR(16) NOT NULL
);

CREATE TYPE TOILET_TYPE AS ENUM (
  'RESTAURANT',
  'GAS_STATION',
  'BUSINESS',
  'GOVERNMENT',
  'OTHER'
);

CREATE TABLE toilets(
  id SERIAL PRIMARY KEY,
  name VARCHAR(64) NOT NULL,
  description VARCHAR(256) NULL DEFAULT NULL,
  address_id INTEGER NOT NULL,
  geo_location GEOGRAPHY NOT NULL,
  type TOILET_TYPE NOT NULL DEFAULT 'OTHER'
);

CREATE INDEX idx_toilets_address_id ON toilets (address_id);
CREATE INDEX idx_toilets_geo_location ON toilets USING GIST (geo_location);

--ratings
CREATE DOMAIN RATING_VALUE AS SMALLINT
  CHECK(
    VALUE > 0 AND VALUE <= 5
  );

CREATE TABLE ratings(
  id SERIAL PRIMARY KEY,
  toilet_id INTEGER NOT NULL,
  user_id INTEGER NOT NULL,
  rating RATING_VALUE NOT NULL,
  comment TEXT NULL DEFAULT NULL
);

CREATE INDEX idx_ratings_toilet_id ON ratings (toilet_id);
CREATE INDEX idx_ratings_user_id ON ratings (user_id);