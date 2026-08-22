-- CELESTIAL BODIES RELATIONAL DATASE

--Instructions
--For this project, you need to log in to PostgreSQL with psql to create your database. Do that by entering 
psql --username=freecodecamp --dbname=postgres

--You should create a database named universe
CREATE DATABASE universe;

--Be sure to connect to your database with \c universe. Then, you should add tables named galaxy, star, planet, and moon
\c unviverse
CREATE TABLE galaxy(
	galaxy_id							SERIAL PRIMARY KEY,
	name								VARCHAR(255) UNIQUE NOT NULL,
	shape								VARCHAR(50) NOT NULL,
	age_in_years						BIGINT,
	num_of_stars						BIGINT,
	size_in_light_years					BIGINT,
	distance_in_light_years_from_earth 	BIGINT
);

CREATE TABLE star(
	star_id						SERIAL PRIMARY KEY,
	name						VARCHAR(255) UNIQUE NOT NULL,
	diameter_in_km				BIGINT NOT NULL,
	age_in_years				BIGINT,
	galaxy_id					INT,
	CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);

--Case Sensitivity: Enum values are case-sensitive ('Pending' is not the same as 'pending').
CREATE TYPE water_status AS ENUM ('YES','NO','POSSIBLE');

CREATE TABLE planet(
	planet_id					SERIAL PRIMARY KEY,
	name 						VARCHAR(255) UNIQUE NOT NULL,
	description					TEXT NOT NULL,
	age_in_million_years		INT NOT NULL,
	diameter_in_km				INT,
	mass_in_kg					FLOAT, 
	surface_gravity				FLOAT,
	has_life					BOOLEAN,
	has_water					water_status,
	star_id						INT,
	CONSTRAINT fk_star FOREIGN KEY (star_id) REFERENCES star(star_id)
);

CREATE TABLE moon(
	moon_id						SERIAL PRIMARY KEY,
	name						VARCHAR(255) UNIQUE NOT NULL,
	age_in_years				BIGINT,
	diameter_in_km				BIGINT NOT NULL,
	weight_in_ton				FLOAT,
	gravity						NUMERIC(5,2) NOT NULL,
	temp_average_in_celsius		NUMERIC(6,2),
	has_life					BOOLEAN DEFAULT FALSE,
	planet_id					INT,
	CONSTRAINT fk_planet FOREIGN KEY (planet_id) REFERENCES planet(planet_id)
);

CREATE TABLE celestial_object(
	celestial_object_id			SERIAL PRIMARY KEY,
	name						VARCHAR(255) UNIQUE NOT NULL,
	description					TEXT NOT NULL,
	diameter_in_light_years		FLOAT,
	weight_in_solar_mass		BIGINT,
	galaxy_id					INT,
	CONSTRAINT fk_galaxy FOREIGN KEY (galaxy_id) REFERENCES galaxy(galaxy_id)
);



--Each table should have a primary key
--Each primary key should automatically increment
--Each table should have a name column

--You should use the INT data type for at least two columns that are not a primary or foreign key
--You should use the NUMERIC data type at least once
--You should use the TEXT data type at least once
--You should use the BOOLEAN data type on at least two columns

--Each "star" should have a foreign key that references one of the rows in galaxy
--Each "planet" should have a foreign key that references one of the rows in star
--Each "moon" should have a foreign key that references one of the rows in planet
--Your database should have at least five tables

'
===========================
Usage in PostgreSQL 16+
Underscores (_) can be inserted between digits in integer and numeric constants for visual grouping and have no effect on the value itself. 

==========================
'

--The galaxy and star tables should each have at least six rows
INSERT INTO galaxy(name,				shape, 			age_in_years,	size_in_light_years,	num_of_stars,		distance_in_light_years_from_earth)
VALUES  ('Milky Way',						'spiral',	 13600000000,				 120000,	400000000000,			 							 0),
		('Canis Major Dwarf',			 'irregular', 	 12000000000,	  			   5000,  	  1000000000,	 	 							 25000),
		('Sagittarius Dwarf Spheroidal','spheroidal',	 13000000000,	 			  10000,       100000000,	 	 							 70000),
		('Large Magellanic Cloud',		 'irregular',	 13000000000,	 			  14000, 	 30000000000,									163000),
		('Small Magellanic Cloud',		 'irregular',	 13000000000,	  			   7000,  	  3000000000,									200000),
		('Draco Dwarf',					'spheroidal',	 13000000000,	  			   2000,     	30000000,									260000);

⚠️ Observação importante
Para galáxias anãs, valores como size e number of stars variam conforme o método observacional, pois muitas estão em processo de canibalização gravitacional pela Via Láctea.

INSERT INTO star(name,			  			  				diameter_in_km,		age_in_years,	galaxy_id) 
VALUES			('Sol',											   1390000,		  4600000000,			1),
				('Betelgeuse',									1230000000,			10000000,	  		1),
				('Sirius A',	   								   2380000,		   242000000,		 	1),
				('Canis Major Giant Star',						 100000000,		 10000000000,	   		2),
				('Sagittarius Red Giant',						 120000000,		 10000000000,	   		3),
				('R136a1', 										  35000000,			 2000000, 	 		4),
				('SN 1987A Progenitor (Sanduleak -69 202)',	  	  40000000,			20000000, 			4),
				('SMC AB 8', 									  20000000,			 5000000, 			5),
				('NGC 346 Massive Star', 						  25000000,			 3000000, 			5),
				('Draco Red Giant Star',						  90000000,		 13000000000, 	 		6);

⚠️ Nota científica rápida: fora da Via Láctea, não conseguimos catalogar estrelas individuais em grande detalhe. 
Assim, as “principais estrelas” em galáxias anãs e nas Nuvens de Magalhães são as mais massivas, brilhantes ou cientificamente relevantes.
OBS.:
- As estrelas listadas são representativas, não necessariamente “nomes próprios famosos”
- Diâmetros de estrelas gigantes são altamente variáveis
CANIS MAJOR DWARF GALAXY

⭐ Esta galáxia está sendo despedaçada pela Via Láctea, então poucas estrelas individuais são bem caracterizadas.

--Each table should have at least three rows
INSERT INTO celestial_object(name, description, diameter_in_light_years, weight_in_solar_mass, galaxy_id)
VALUES ('Sagittarius A*',
		'A supermassive black hole located at the center of the Milky Way. It governs the orbital motion of stars in the galactic core and is one of the strongest pieces of evidence for black holes in the universe.',
		4.65080367e-6,
		4300000,
		1),	
		('Tarantula Nebula',
		'The largest and most active star-forming nebula in the Local Group. It contains extremely massive stars and intense radiation fields.',
		1000,
		800000,
		4),
		('Omega Centauri',
		'The largest known globular cluster in the Milky Way. It may be the remnant core of a dwarf galaxy that was absorbed by the Milky Way.',
		150,
		4000000,
		1),
		('Draco Dwarf Dark Matter Halo',
		'A massive dark matter structure surrounding the Draco Dwarf Galaxy. Draco is one of the most dark-matter-dominated galaxies known, making it a key object for cosmological studies.',
		10000,
		100000000,
		6),
		('Sagittarius Stellar Stream',
		'A vast tidal stream of stars and gas created as the Sagittarius Dwarf Spheroidal Galaxy is torn apart by the Milky Way’s gravity. It wraps around the Milky Way.',
		300000,
		100000000,
		3);
		
⚠️ Observação importante: para muitos objetos celestes (como nebulosas e aglomerados), 
“weight” = mass (massa) é sempre estimada, pois não há limites físicos definidos como em corpos sólidos.

--The planet table should have at least 12 rows
--#Todos os valores são aproximações aceitas cientificamente.
INSERT INTO planet
(name, 		description, 																				age_in_million_years, diameter_in_km, mass_in_kg, surface_gravity, has_life, has_water, star_id) VALUES
('Mercury', 'Smallest planet and closest to the Sun, with extreme temperature variations.', 			4540, 4879, 3.30110E23, 3.70, FALSE, 'NO', 1),
('Venus', 	'Earth-sized planet with a dense CO2 atmosphere and runaway greenhouse effect.',  			4540, 12104, 4.86750E24, 8.87, FALSE, 'NO', 1),
('Earth', 	'Only known planet with life, abundant liquid water and breathable atmosphere.', 			4540, 12742, 5.97237E24, 9.81, TRUE, 'YES', 1),
('Mars', 	'Rocky planet known as the Red Planet with evidence of ancient water.', 					4540, 6779, 6.41710E23, 3.71, FALSE, 'YES', 1),
('Jupiter', 'Largest planet in the Solar System, a gas giant with a strong magnetic field.', 			4540, 139820, 1.89820E27, 24.79, FALSE, 'NO', 1),
('Saturn', 	'Gas giant famous for its extensive ring system.', 											4540, 116460, 5.68340E26, 10.44, FALSE, 'NO', 1),
('Uranus', 	'Ice giant that rotates on its side with a cold methane atmosphere.', 						4540, 50724, 8.68100E25, 8.69, FALSE, 'NO', 1),
('Neptune', 'Farthest known planet in the Solar System, with extremely strong winds.', 					4540, 49244, 1.02413E26, 11.15, FALSE, 'YES', 1),
-- EXOPLANETS
('Proxima Centauri b', 	'Earth-sized exoplanet orbiting within the habitable zone of Proxima Centauri.', 4800, 11400, 1.27000E25, 11.00, FALSE, 'POSSIBLE', NULL),
('Kepler-186f', 		'First Earth-sized exoplanet discovered in a habitable zone.', 					4000, 14000, 2.90000E25, 11.20, FALSE, 'POSSIBLE', NULL),
('Kepler-452b', 		'Super-Earth located in the habitable zone of a Sun-like star.', 				6000, 18000, 5.00000E25, 19.60, FALSE, 'POSSIBLE', NULL),
('HD 209458 b', 		'Hot Jupiter exoplanet with an evaporating atmosphere.', 						5000, 143000, 1.31000E27, 9.40, FALSE, 'NO', NULL),
('WASP-12b', 			'Extremely hot gas giant being tidally stretched by its star.', 				2000, 190000, 2.66000E27, 10.20, FALSE, 'NO', NULL),
('TRAPPIST-1e', 		'Rocky exoplanet in the habitable zone of a red dwarf star.', 					7600, 11500, 4.80000E24, 9.12, FALSE, 'POSSIBLE', NULL),
('GJ 1214 b', 			'Water-rich super-Earth with a thick atmosphere.', 								3000, 27000, 3.90000E25, 8.93, FALSE, 'YES', NULL);

--The moon table should have at least 20 rows
INSERT INTO moon
(name, age_in_years, diameter_in_km, weight_in_ton, gravity, temp_average_in_celsius, planet_id)
VALUES

-- EARTH
('Moon', 4500000000, 3475, 7.342E19, 1.62, -20, 3),

-- MARS
('Phobos', 4500000000, 22, 1.065E13, 0.01, -40, 4),
('Deimos', 4500000000, 12, 1.476E12, 0.00, -40, 4),

-- JUPITER (Galilean moons + extras)
('Io', 4500000000, 3643, 8.93E19, 1.80, -130, 5),
('Europa', 4500000000, 3122, 4.80E19, 1.31, -160, 5),
('Ganymede', 4500000000, 5268, 1.48E20, 1.43, -163, 5),
('Callisto', 4500000000, 4821, 1.08E20, 1.24, -139, 5),
('Amalthea', 4500000000, 167, 2.08E15, 0.02, -160, 5),
('Himalia', 4500000000, 170, 4.19E15, 0.06, -150, 5),

-- SATURN
('Titan', 4500000000, 5150, 1.35E20, 1.35, -179, 6),
('Enceladus', 4500000000, 504, 1.08E17, 0.11, -198, 6),
('Rhea', 4500000000, 1528, 2.31E18, 0.26, -174, 6),
('Iapetus', 4500000000, 1470, 1.81E18, 0.22, -143, 6),
('Dione', 4500000000, 1123, 1.10E18, 0.23, -186, 6),

-- URANUS
('Titania', 4500000000, 1578, 3.42E18, 0.38, -203, 7),
('Oberon', 4500000000, 1523, 3.01E18, 0.35, -203, 7),
('Umbriel', 4500000000, 1169, 1.27E18, 0.23, -203, 7),
('Ariel', 4500000000, 1158, 1.35E18, 0.27, -213, 7),

-- NEPTUNE
('Triton', 4500000000, 2707, 2.14E19, 0.78, -235, 8),
('Nereid', 4500000000, 340, 3.10E16, 0.07, -220, 8);

--Each table should have at least three columns
--The galaxy, star, planet, and moon tables should each have at least five columns
--At least two columns per table should not accept NULL values
--At least one column from each table should be required to be UNIQUE
--All columns named name should be of type VARCHAR

--Each primary key column should follow the naming convention table_name_id. For example, the moon table should have a primary key column named moon_id

--Each foreign key column should have the same name as the column it is referencing
