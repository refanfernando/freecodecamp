# build-a-celestial-bodies-database

Instructions
For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering psql --username=freecodecamp --dbname=postgres in the terminal. Make all the tests below pass to complete the project. Be sure to get creative, and have fun!

Don't forget to connect to your database after you create it 😄

Here's some ideas for other column and table names: description, has_life, is_spherical, age_in_millions_of_years, planet_types, galaxy_types, distance_from_earth.
s-U  universe\
Notes:
If you leave your virtual machine, your database may not be saved. You can make a dump of it by entering pg_dump -cC --inserts -U freecodecamp universe > universe.sql in a bash terminal (not the psql one). It will save the commands to rebuild your database in universe.sql. The file will be located where the command was entered. If it's anything inside the project folder, the file will be saved in the VM. You can rebuild the database by entering psql -U postgres < universe.sql in a terminal where the .sql file is.

If you are saving your progress on freeCodeCamp.org, after getting all the tests to pass, follow the instructions above to save a dump of your database. Save the universe.sql file in a public repository and submit the URL to it on freeCodeCamp.org.

## EXERCISE
```sql
CREATE DATABASE universe;
\c universe;

CREATE TABLE galaxy (
  galaxy_id SERIAL PRIMARY KEY, 
  name VARHCAR(30) NOT NULL UNIQUE,
  num_of_stars INT,
  num_of_planets INT NOT NULL,
  diameter NUMERIC(10, 2),
  has_black_hole BOOLEAN,
  is_barred_spiral BOOLEAN,
  description TEXT
);

CREATE TABLE star (
  star_id SERIAL PRIMARY KEY,
  name VARHCAR(30) NOT NULL UNIQUE,
  distance_light_years NUMERIC(10, 2) NOT NULL,
  temperature_kelvin INT,
  is_main_sequence BOOLEAN,
  is_binary_star BOOLEAN,
  description TEXT,
  galaxy_id INT,
  FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

CREATE TABLE planet (
  planet_id SERIAL PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  diameter_km NUMERIC(10, 2) NOT NULL,
  distance_from_sun_km NUMERIC(12, 2),
  has_ring_system BOOLEAN,
  is_inhabited BOOLEAN,
  description TEXT,
  star_id INT,
  FOREIGN KEY(star_id) REFERENCES star(star_id)
);

CREATE TABLE moon (
  moon_id INT PRIMARY KEY,
  name VARCHAR(30) NOT NULL UNIQUE,
  diameter_km NUMERIC(10, 2) NOT NULL,
  distance_from_planet_km NUMERIC(12, 2),
  is_inhabited BOOLEAN,
  description TEXT,
  planet_id INT,
  FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE celestial_body (
  celestial_body_id SERIAL PRIMARY KEY,
  body_name VARCHAR(30) NOT NULL,
  body_type VARCHAR(10) NOT NULL,
  diameter_km NUMERIC(10, 2),
  distance_from_sun_km NUMERIC(12, 2),
  has_ring_system BOOLEAN,
  is_inhabited BOOLEAN,
  description TEXT,
  parent_body_id INT, -- For moons, this references the planet it orbits
  FOREIGN KEY (parent_body_id) REFERENCES celestial_body(celestial_body_id)
);

INSERT INTO galaxy (name, num_of_stars, num_of_planets, diameter, has_black_hole, is_barred_spiral, description)
VALUES
    ('Milky Way', 200 billion, 8, 100000, TRUE, TRUE, 'Our home galaxy.'),
    ('Andromeda', 1000 billion, 10, 120000, FALSE, FALSE, 'The nearest spiral galaxy to the Milky Way.'),
    ('Triangulum', 40 billion, 5, 60000, FALSE, TRUE, 'A smaller spiral galaxy in our local group.'),
    ('Sombrero', 200 million, 2, 50000, TRUE, FALSE, 'Known for its distinct shape.'),
    ('Whirlpool', 300 million, 3, 70000, FALSE, FALSE, 'Famous for its interacting galaxies.'),
    ('Pinwheel', 150 million, 2, 55000, FALSE, TRUE, 'A beautiful spiral galaxy.');

INSERT INTO star (name, distance_light_years, temperature_kelvin, is_main_sequence, is_binary_star, description)
VALUES
    ('Sun', 93 million, 5778, TRUE, FALSE, 'Our closest star.'),
    ('Proxima Centauri', 4.24, 3040, TRUE, TRUE, 'The closest known star to the Sun.'),
    ('Sirius', 8.6, 9940, TRUE, FALSE, 'The brightest star in Earth is night sky.'),
    ('Betelgeuse', 642, 3500, TRUE, FALSE, 'A red supergiant in the constellation Orion.'),
    ('Rigel', 860, 12100, TRUE, FALSE, 'A blue supergiant in the constellation Orion.'),
    ('Alpha Centauri A', 4.37, 5790, TRUE, FALSE, 'A close neighbor of Proxima Centauri.');

INSERT INTO planet (name, diameter_km, distance_from_sun_km, has_ring_system, is_inhabited, description)
VALUES
    ('Mercury', 4879, 57910000, FALSE, FALSE, 'The closest planet to the Sun.'),
    ('Venus', 12104, 108200000, FALSE, FALSE, 'Known for its thick, toxic atmosphere.'),
    ('Earth', 12742, 149600000, FALSE, TRUE, 'The only known planet to support life.'),
    ('Mars', 6779, 227900000, FALSE, FALSE, 'Known as the Red Planet.'),
    ('Jupiter', 139822, 778300000, TRUE, FALSE, 'The largest planet in our solar system.'),
    ('Saturn', 116464, 1427000000, TRUE, FALSE, 'Famous for its beautiful ring system.'),
    ('Uranus', 50724, 2871000000, TRUE, FALSE, 'Rotates on its side.'),
    ('Neptune', 49244, 4497100000, TRUE, FALSE, 'Known for its deep blue color.'),
    ('Pluto', 2370, 5913520000, FALSE, FALSE, 'Dwarf planet in the Kuiper belt.'),
    ('Makemake', 1500, 6834000000, FALSE, FALSE, 'Another dwarf planet in the Kuiper belt.'),
    ('Eris', 2326, 10184000000, FALSE, FALSE, 'Dwarf planet beyond Pluto.'),
    ('Haumea', 1960, 6480000000, TRUE, FALSE, 'Dwarf planet with an elongated shape.');

INSERT INTO moon (name, diameter_km, distance_from_planet_km, is_inhabited, description, parent_body_id)
VALUES
    ('Moon', 3475, 384400, FALSE, 'Earth''s only natural satellite.', 3),
    ('Phobos', 22.4, 9377, FALSE, 'One of Mars''s two moons.', 4),
    ('Deimos', 12.4, 23460, FALSE, 'Mars''s smaller moon.', 4),
    ('Io', 3643.2, 421800, FALSE, 'A moon of Jupiter with active volcanoes.', 5),
    ('Europa', 3121.6, 671034, FALSE, 'A moon of Jupiter with a subsurface ocean.', 5),
    ('Ganymede', 5270.8, 1070412, FALSE, 'Jupiter''s largest moon.', 5),
    ('Callisto', 4820.6, 1882709, FALSE, 'A moon of Jupiter with a heavily cratered surface.', 5),
    ('Titan', 5151, 1221870, FALSE, 'Saturn''s largest moon with a thick atmosphere.', 6),
    ('Enceladus', 504.2, 237948, FALSE, 'A moon of Saturn with geysers of water ice.', 6),
    ('Miranda', 472.4, 129390, FALSE, 'A moon of Uranus with a fractured surface.', 7),
    ('Triton', 2706.8, 354800, FALSE, 'A moon of Neptune with geysers and a retrograde orbit.', 8),
    ('Charon', 1208, 19571, FALSE, 'Pluto''s largest moon.', 9),
    ('Hydra', 65, 64738, FALSE, 'Another moon of Pluto.', 9),
    ('Nix', 49, 48694, FALSE, 'A small moon of Pluto.', 9),
    ('Oberon', 1522.8, 583520, FALSE, 'One of Uranus''s moons.', 7),
    ('Proteus', 420, 117647, FALSE, 'A moon of Neptune.', 8),
    ('Iapetus', 1436, 3560820, FALSE, 'A moon of Saturn with a two-tone appearance.', 6),
    ('Dione', 1122.8, 377396, FALSE, 'A moon of Saturn with distinctive wispy streaks.', 6),
    ('Hyperion', 270, 1481019, FALSE, 'A moon of Saturn with a spongy appearance.', 6),
    ('Tethys', 1062, 294619, FALSE, 'A moon of Saturn with a large impact crater.', 6);

INSERT INTO celestial_body (body_name, body_type, diameter_km, distance_from_sun_km, has_ring_system, is_inhabited, description, parent_body_id)
VALUES
    ('Milky Way', 'Galaxy', 100000, NULL, NULL, NULL, 'Our home galaxy.', NULL),
    ('Sun', 'Star', NULL, NULL, NULL, NULL, 'Our closest star.', NULL),
    ('Earth', 'Planet', 12742, 149600000, FALSE, TRUE, 'The only known planet to support life.', NULL);

```