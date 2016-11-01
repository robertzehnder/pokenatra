DROP TABLE IF EXISTS pokemons;
DROP TABLE IF EXISTS trainer;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  poke_type VARCHAR(100),
  cp int,
  trainer_id int,
  img_url VARCHAR(1000)
);

CREATE TABLE trainers(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  level VARCHAR(100),
  img_url VARCHAR(1000)
);
