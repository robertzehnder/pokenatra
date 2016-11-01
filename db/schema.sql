DROP TABLE IF EXISTS pokemons;

CREATE TABLE pokemons(
  id SERIAL PRIMARY KEY,
  name VARCHAR(100),
  poke_type VARCHAR(100),
  cp int,
  img_url VARCHAR(100)
);
