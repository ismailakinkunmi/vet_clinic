 SELECT * FROM animals WHERE name like '%mon';
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE (neutered IS true AND escape_attempts < 3);
SELECT date_of_birth FROM animals WHERE name IN('Agumon','Pikachu');
SELECT (name,escape_attempts) FROM animals WHERE weight_kg > 10.5;
SELECT * FROM animals WHERE neutered is true;
SELECT name FROM animals WHERE name !='Gabumon';
 SELECT * FROM animals WHERE weight_kg BETWEEN 10.4 AND 17.3 OR weight_kg = 10.4 OR weight_kg = 17.3;

  --in transaction update the animals table by setting the species column to unspecified. Verify that change was made. Then roll back the change
  begin transaction;
  update animals set species = 'unspecified';
  rollback;

  --in transaction 
  -- Update the animals table by setting the species column to digimon for all animals that have a name ending in mon
begin;
update animals set species ='digimon' where name like '%mon';
-- Update the animals table by setting the species column to pokemon for all animals that don't have species already set.
update animals set species ='pokemon' where species is null;
commit;

--  Inside a transaction delete all records in the animals table, then roll back the transaction
begin;
delete from animals *;
rollback;


-- Write queries to answer the following questions:

----How many animals are there?
select * from animals;

----How many animals have never tried to escape?
select * from animals where escape_attempts = 0;

---- What is the average weight of animals?
-15.5500000000000000

----Who escapes the most, neutered or not neutered animals?
Boarmon

----What is the minimum and maximum weight of each type of animal?
 species | min | max
---------+-----+------
 pokemon | -17 |  -11
 digimon | -45 | -5.7

 ----What is the average number of escape attempts per animal type of those born between 1990 and 2000?
  species |        avg
---------+--------------------
 pokemon | 3.0000000000000000