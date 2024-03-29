DROP IF EXISTS test_foursquare;
DROP TABLE IF EXISTS venues;
DROP TABLE IF EXISTS locations;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS venue_categories;

CREATE TABLE IF NOT EXISTS venues (
  id serial PRIMARY KEY,
  foursquare_id VARCHAR(255) UNIQUE,
  name VARCHAR(255) NOT NULL,
  price INTEGER,
  rating DECIMAL,
  likes BIGINT,
menu_url VARCHAR(255),
  created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

CREATE INDEX IF NOT EXISTS venues_price_index ON venues (price);

CREATE TABLE IF NOT EXISTS locations (
  id serial PRIMARY KEY,
  longitude DECIMAL,
   latitude DECIMAL,
    address VARCHAR(255),
    postal_code INTEGER,
    city VARCHAR(255),
    state VARCHAR(255),
    venue_id INTEGER,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT fk_venue
      FOREIGN KEY (venue_id)
      REFERENCES venues (id)
);

CREATE INDEX IF NOT EXISTS locations_postal_code_index ON locations (postal_code);
CREATE INDEX IF NOT EXISTS city_postal_code_index ON locations (city);
CREATE INDEX IF NOT EXISTS state_postal_code_index ON locations (state);

CREATE TABLE IF NOT EXISTS categories (
  id serial PRIMARY KEY,
  name VARCHAR(255) UNIQUE
);


CREATE TABLE IF NOT EXISTS venue_categories (
  id serial PRIMARY KEY,
  category_id INTEGER,
  venue_id INTEGER,
  CONSTRAINT fk_category
  FOREIGN KEY (category_id)
    REFERENCES categories (id)
  ,
  CONSTRAINT fk_venue
  FOREIGN KEY (venue_id)
    REFERENCES venues (id)
);
