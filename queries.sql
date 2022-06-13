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

----Inside a transaction
begin
delete from animals * where  date_of_birth > '2022-1-01';
savepoint savepoint1
update animals set weight_kg = weight_kg * -1;
rollback to savepoint savepoint1;
update animals set weight_kg = weight_kg * -1;
commit

-- Write queries to answer the following questions:

----How many animals are there?
select * from animals;

----How many animals have never tried to escape?
select * from animals where escape_attempts = 0;

---- What is the average weight of animals?
select avg(weight_kg) from animals;

----Who escapes the most, neutered or not neutered animals?
select name from animals where escape_attempts = (select max(escape_attempts) from animals);

----What is the minimum and maximum weight of each type of animal?
 select species, min(weight_kg), max(weight_kg) from animals group by species;




 ----What is the average number of escape attempts per animal type of those born between 1990 and 2000?
select species, avg(escape_attempts) from animals where extract(year from date_of_birth) between 1990 and 2000 group by species;


-------------Write queries (using JOIN) to answer the following questions

---What animals belong to Melody Pond?
select full_name, name from owners O join animals A on O.ownerId = A.ownerId where full_name = 'Melody Pond';


------------------List of all animals that are pokemon (their type is Pokemon)
select S.name, A.name from species S join animals A on S.speciesId = A.speciesId where S.name = 'Pokemon';

----------------List all owners and their animals, remember to include those that don't own any animal.
select full_name, name from owners O full join animals A on O.ownerId = A.ownerId;

--------How many animals are there per species?
select count(*) as Animals, S.name from animals Animals inner join species S on S.speciesId = Animals.speciesId group by S.name;

----List all Digimon owned by Jennifer Orwell.
select A.name, O.full_name, S.name FROM animals A FULL JOIN owners O ON A.ownerid = O.ownerId  FULL JOIN species S ON A.Speciesid = S.speciesId WHERE O.full_name = 'Jennifer Orwell' AND S.name = 'Digimon';


-------List all animals owned by Dean Winchester that haven't tried to escape.
select name, escape_attempts, full_name from animals FULL JOIN owners ON animals.ownerId = owners.ownerId WHERE full_name = 'Dean Winchester' AND escape_attempts = 0;

---Who owns the most animals?
select count(name), full_name from animals join owners on animals.ownerId =owners.ownerId group by full_name order by count desc limit 1;






-----------------------------------------------Write queries to answer the following -------------------------------------------------------
------Who was the last animal seen by William Tatcher?
select a.name as last_seen_animal from animals a JOIN visits On visits.animal_id = a.id JOIN vets v ON v.id = visits.vet_id where v.name = 'William Tatcher' order by visits.visit_date desc limit 1;


---------------How many different animals did Stephanie Mendez see
select count (a.name) as different_animals_see  from animals a JOIN visits On visits.animal_id = a.id JOIN vets v ON v.id = visits.vet_id where v.name = 'Stephanie Mendez';


-----List all vets and their specialties, including vets with no specialties.
select v.name as vets, sp.name as specialties from specializations s full join vets v on s.vet_id = v.id full join species sp on s.species_id = sp.speciesid;


------List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.
select a.name as visited_Stephanie_Mendez_between_April_1st_and_August_30th_2020      from animals a join visits v on v.animal_id = a.id join vets vet on v.vet_id = vet.id where vet.name = 'Stephanie Mendez' and v.visit_date between '2020-04-01' and '2020-08-30';

----------------------What animal has the most visits to vets?

select a.name as most_visit from animals a FULL JOIN visits ON a.id = visits.animal_id Full JOIN vets v  ON v.id = visits.vet_id group by a.name order by count(visits.vet_id) desc limit 1;




-------Who was Maisy Smith's first visit?
select a.name as first_visit from animals a JOIN visits ON a.id = visits.id join vets v ON v.id = visits.vet_id
 where v.name = 'Maisy Smith' order by a.name limit 1;

--------Details for most recent visit: animal information, vet information, and date of visit

select a.*, v.*, visits.visit_date from animals a JOIN visits  ON a.id = visits.animal_id JOIN vets v ON v.id = visits.vet_id order by visits.visit_date desc limit 1;

-----How many visits were with a vet that did not specialize in that animal's species?
select count(*) as count_visits from visits Join vets ON vets.id = visits.vet_id where vets.id = 2;




SELECT species.name AS potential_specialty, COUNT(A.species_id) as visits FROM visits
JOIN animals A On A.id = visits.animal_id JOIN species ON species.id = A.species_id
JOIN vets ON vets.id = visits.vet WHERE vets.name = 'Maisy Smith' GROUP BY species.name
ORDER BY COUNT(A.species_id) DESC LIMIT 1;







