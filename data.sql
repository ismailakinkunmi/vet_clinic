-- insert data
insert into animals(name, date_of_birth,escape_attempts,neutered,weight_kg) values('Agumon','2020-02-03',0,true,10.23);
insert into animals(name, date_of_birth,escape_attempts,neutered,weight_kg) values('Gabumon','2018-11-15',2,true,8);
insert into animals(name, date_of_birth,escape_attempts,neutered,weight_kg) values('Pikachu','2021-01-07',1,false,15.04);
insert into animals(name, date_of_birth,escape_attempts,neutered,weight_kg) values('Devimon','2017-05-12',5,true,11);

-- query and update animals table
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Charmander','2020-2-08',0,false,11);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Plantmon','2021-11-15',2,true,5.7);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Squirtle','1993-4-02',3,true,12.13);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Angemon','2005-6-12',1,true,45);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Boarmon','2005-6-07',7,true,20.4);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Blossom','1998-10-13',3,true,17);
insert into animals(name,date_of_birth,escape_attempts,neutered,weight_kg) values('Ditto','2022-5-14',4,true,22);

----------------------- insert data into the owners table
insert into owners(full_name, age) values('Sam Smith',34),('Jennifer Orwell',19),('Bob',45),('Melody Pond',77),('Dean Winchester',14),('Jodie Whittaker',38);

----------------insert data into the species table

insert into species(name) values('Pokemon'),('Digimon');


----------------Modify your inserted animals so it includes the species_id value:-------------

----If the name ends in "mon" it will be Digimon
 update animals set speciesId = 2 where name like'%mon';

-----All other animals are Pokemon
update animals set speciesId = 1 where speciesId is null;

---------Modify your inserted animals to include owner information (owner_id)

update animals set ownerId = 1 where name = 'Agumon';
update animals set ownerId = 2 where name in ('Gabumon','Pikachu');
update animals set ownerId = 3 where name in ('Devimon','Plantmon');
update animals set ownerId = 4 where name in ('Charmander','Squirtle','Blossom');
update animals set ownerId = 5 where name in ('Angemon', 'Boarmon');


----------------Insert the following data for vets
insert into vets(name, age, date_of_graduation) values ('William Tatcher',45,'2000-4-23');
insert into vets(name, age, date_of_graduation) values ('Maisy Smith', 26, '2019-1-17');
insert into vets(name, age, date_of_graduation) values ('Stephanie Mendez', 64, '1981-5-04');
insert into vets(name, age, date_of_graduation) values ('Jack Harkness', 38, '2008-6-08');


--------Insert the following data for specialties
insert into specializations(species_id, vet_id) values (1,1);
insert into specializations(species_id, vet_id) values (2,3);
insert into specializations(species_id, vet_id) values (1,3);
insert into specializations(species_id, vet_id) values (2,4);


---------------Insert the following data for visits:------
--Agumon
insert into visits(animal_id, vet_id, visit_date) values (1,1,'2020-5-24');
insert into visits(animal_id, vet_id, visit_date) values (1,3,'2020-7-22');
--Gabumon
 insert into visits(animal_id, vet_id, visit_date) values (2,4,'2021-2-02');

 ----Pikachu
 insert into visits(animal_id, vet_id, visit_date) values (3,2,'2020-1-05');
insert into visits(animal_id, vet_id, visit_date) values (3,2,'2020-3-08');
insert into visits(animal_id, vet_id, visit_date) values (3,2,'2020-5-14');

--- Devimon
insert into visits(animal_id, vet_id, visit_date) values (4,3,'2021-5-04')

-----Chamander
insert into visits(animal_id, vet_id, visit_date) values (5,4,'2021-2-24');

-----plantmon
insert into visits(animal_id, vet_id, visit_date) values (6,2,'2019-12-21');
insert into visits(animal_id, vet_id, visit_date) values (6,1,'2020-08-10');
insert into visits(animal_id, vet_id, visit_date) values (6,2,'2021-04-07');

----squirtle
 insert into visits(animal_id, vet_id, visit_date) values (7,3,'2019-9-29');

----Angemon
insert into visits(animal_id, vet_id, visit_date) values (8,4,'2020-10-03');
insert into visits(animal_id, vet_id, visit_date) values (8,4,'2020-11-04');

---Boarmon
insert into visits(animal_id, vet_id, visit_date) values (9,2,'2019-1-24');
insert into visits(animal_id, vet_id, visit_date) values (9,2,'2019-5-15');
insert into visits(animal_id, vet_id, visit_date) values (9,2,'2020-2-27');
insert into visits(animal_id, vet_id, visit_date) values (9,2,'2020-8-03');

---blossom
 insert into visits(animal_id, vet_id, visit_date) values (10,3,'2020-5-24');
insert into visits(animal_id, vet_id, visit_date) values (10,1,'2021-1-11');

-- database performance

INSERT INTO visits (animal_id, vet_id, visit_date) SELECT * FROM (SELECT id FROM animals) animal_id, (SELECT id FROM vets) vets_ids, generate_series('1980-01-01'::timestamp, '2021-01-01', '4 hours') visit_timestamp;
insert into owners (full_name, email) select 'Owner ' || generate_series(1,2500000), 'owner_' || generate_series(1,2500000) || '@mail.com';