 SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE (neutered IS true AND escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');
SELECT (name,escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered is true;
SELECT name FROM animals WHERE name !='Gabumon';
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg = 17.3;

  -- update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change
  begin transaction;
  update animals set species = 'unspecified';
  rollback;

  -- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon

