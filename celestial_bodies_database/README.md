<code>Relational Database</code> <code>SQL</code> <code>PostgreSQL</code>

# 🌌 Celestial Bodies Database

<p>Celestial Bodies Database Workshop from <a href="https://www.freecodecamp.org/learn/relational-databases-v9/lab-celestial-bodies-database/lab-celestial-bodies-database">freeCodeCamp</a>. This project was built using <strong>PostgreSQL</strong>.</p>

<img src="https://github.com/Gehm-Nicolas/free_code_camp_relational_databases_certification/blob/main/celestial_bodies_database/galactic_star_map.png" alt="Galactic Star Map">

<br>

## 📐 Relational Database Diagram

<picture>
  <img src="https://github.com/Gehm-Nicolas/free_code_camp_relational_databases_certification/blob/main/celestial_bodies_database/SQL_shema.png" alt="Database Schema Diagram">
</picture>

---

## 📌 Project Overview

This database models astronomical entities in a hierarchical structure across **5 tables**:
1. **`galaxy`**: Core galactic structures and their dimensions.
2. **`star`**: Stars linked to their parent galaxy via `galaxy_id`.
3. **`planet`**: Planets (Solar System & Exoplanets) linked to their parent star via `star_id`. Uses a custom `ENUM` for water availability.
4. **`moon`**: Natural satellites linked to their parent planet via `planet_id`.
5. **`celestial_object`**: Deep-space objects (black holes, nebulae, clusters) linked to their parent galaxy via `galaxy_id`.

---

## 🛠 Database Schema & Architecture

### Custom ENUM Types
```sql
CREATE TYPE water_status AS ENUM ('YES', 'NO', 'POSSIBLE');
```

### Table Definitions

```sql
-- GALAXY TABLE
CREATE TABLE galaxy(
    galaxy_id                           SERIAL PRIMARY KEY,
    name                                VARCHAR(255) UNIQUE NOT NULL,
    shape                               VARCHAR(50) NOT NULL,
    age_in_years                        BIGINT,
    num_of_stars                        BIGINT,
    size_in_light_years                 BIGINT,
    distance_in_light_years_from_earth  BIGINT
);

-- STAR TABLE
CREATE TABLE star(
    star_id         SERIAL PRIMARY KEY,
    name            VARCHAR(255) UNIQUE NOT NULL,
    diameter_in_km  BIGINT NOT NULL,
    age_in_years    BIGINT,
    galaxy_id       INT REFERENCES galaxy(galaxy_id)
);

-- PLANET TABLE
CREATE TABLE planet(
    planet_id             SERIAL PRIMARY KEY,
    name                  VARCHAR(255) UNIQUE NOT NULL,
    description           TEXT NOT NULL,
    age_in_million_years  INT NOT NULL,
    diameter_in_km        INT,
    mass_in_kg            FLOAT, 
    surface_gravity       FLOAT,
    has_life              BOOLEAN,
    has_water             water_status,
    star_id               INT REFERENCES star(star_id)
);

-- MOON TABLE
CREATE TABLE moon(
    moon_id                  SERIAL PRIMARY KEY,
    name                     VARCHAR(255) UNIQUE NOT NULL,
    age_in_years             BIGINT,
    diameter_in_km           BIGINT NOT NULL,
    weight_in_ton            FLOAT,
    gravity                  NUMERIC(5,2) NOT NULL,
    temp_average_in_celsius  NUMERIC(6,2),
    has_life                 BOOLEAN DEFAULT FALSE,
    planet_id                INT REFERENCES planet(planet_id)
);

-- CELESTIAL OBJECT TABLE
CREATE TABLE celestial_object(
    celestial_object_id       SERIAL PRIMARY KEY,
    name                      VARCHAR(255) UNIQUE NOT NULL,
    description               TEXT NOT NULL,
    diameter_in_light_years   FLOAT,
    weight_in_solar_mass      BIGINT,
    galaxy_id                 INT REFERENCES galaxy(galaxy_id)
);
```

---

## 🔭 Astronomical & Data Notes

> ⚠️ **Dwarf Galaxies:** For dwarf galaxies like *Canis Major Dwarf* or *Sagittarius Dwarf*, parameters like size and number of stars vary depending on observational methods due to ongoing gravitational cannibalization by the Milky Way.

> ⚠️ **Extragalactic Stars:** Individual stars outside the Milky Way cannot always be individually resolved with standard proper names. Major stars listed for dwarf galaxies and Magellanic Clouds represent the most massive, luminous, or scientifically significant targets cataloged.

> ⚠️ **Celestial Object Mass:** Mass estimates ("weight") for continuous diffuse objects (like the Tarantula Nebula or Sagittarius Stellar Stream) are approximations based on gravitational interaction and light emission model calculations.

---

## 🚀 How to Run locally

1. **Connect to PostgreSQL terminal:**
   ```bash
   psql --username=freecodecamp --dbname=postgres
   ```

2. **Create and connect to database:**
   ```sql
   CREATE DATABASE universe;
   \c universe
   ```

3. **Execute SQL scripts:**
   Copy and run the table creation and insertion queries inside `universe`.

---

## 📋 freeCodeCamp Checklist Validation

- [x] Database named `universe`
- [x] 5 Tables: `galaxy`, `star`, `planet`, `moon`, `celestial_object`
- [x] All primary keys follow `<table_name>_id` with auto-increment (`SERIAL`)
- [x] Foreign keys correctly configured with reference constraints
- [x] Proper data types utilized (`INT`, `BIGINT`, `NUMERIC`, `FLOAT`, `VARCHAR`, `TEXT`, `BOOLEAN`, `ENUM`)
- [x] Non-null (`NOT NULL`) and uniqueness (`UNIQUE`) constraints implemented
- [x] Minimum row requirements satisfied (6 Galaxies, 10 Stars, 15 Planets, 20 Moons, 5 Celestial Objects)
