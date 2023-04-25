CREATE TABLE stars (
  name text PRIMARY KEY,
  temperature text
);

CREATE TABLE moons (
  name text PRIMARY KEY
);

CREATE TABLE planets (
  id serial PRIMARY KEY,
  name VARCHAR(50) not null,
  orbital_period NUMERIC(5, 3) not null,
  star_name text not null REFERENCES stars,
  moon_name text REFERENCES moons,
  unique (name, star_name, moon_name)
);


-- INSERT INTO planets
-- (id, name, orbital_period, star_code, moon_code)
--   VALUES (
--     'earth', 1.00, 1
--   )


