CREATE TABLE stars (
  name TEXT PRIMARY KEY,
  temperature INT NOT NULL
);
-- TODO: make TEXT things VARCHAR

-- TODO: make temperature an int not null

CREATE TABLE moons (
  name TEXT PRIMARY KEY,
  planet_name VARCHAR(50) NOT NULL REFERENCES planets
);

-- TODO: remove the planets_to_moons, add a planets to moons

CREATE TABLE planets (
  name VARCHAR(50) PRIMARY KEY,
  orbital_period NUMERIC(5, 3) NOT NULL,
  star_name TEXT NOT NULL REFERENCES stars
);

INSERT INTO stars (name, temperature)
  VALUES
    ('The Sun', 5800),
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO moons (name, planet_name)
  VALUES
    ('The Moon', 'Earth'),
    ('Phobos', 'Mars'),
    ('Deimos', 'Mars');

INSERT INTO planets (name, orbital_period, star_name)
  VALUES
    ('Earth', 1.00, 'The Sun'),
    ('Mars', 1.882, 'The Sun'),
    ('Venus', 0.62, 'The Sun'),
    ('Proxima Centauri b', 0.03, 'Proxima Centauri'),
    ('Gliese 876 b', 0.236, 'Gliese 876');

SELECT p.name, star_name, COUNT(m.name)
  FROM planets AS p
  LEFT OUTER JOIN moons AS m
    ON p.name = m.planet_name
  GROUP BY p.name
  ORDER BY p.name;

-- TODO: be consistent in aliases