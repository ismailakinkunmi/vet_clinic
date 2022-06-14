-- create database and table with columns 
create database vet_clinic;
create table animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth date,escape_attempts INT,neutered boolean,weight_kg DECIMAL, PRIMARY KEY(id));
alter table animals add species varchar;

---create tables for owners and species
 create table owners(ownerId int generated always as identity primary key, full_name varchar, age int);
 create table spcies(speciesId int generated always as identity primary key, name varchar);

 --modify animals table
-----Make sure that id is set as autoincremented PRIMARY KEY
\d+ animals;
-------Remove column species
alter table animals drop column species;

------add awnersId and speciesId as foreign key to animals table
----------- TWO STEPS : first add column and second add foreign key_____________
-------------  for species

alter table animals add column speciesId int;
alter table animals add foreign key(speciesId) references species(speciesId); 
----------------for owners
alter table animals add column ownerId int;
alter table animals add foreign key(ownerId) references owners(ownerId); 

-----create table for vets
create table vets(id int generated always as identity primary key, name varchar(255), age int, date_of_graduation date);

-----create join table named specializations
create table specializations(id int generated always as identity primary key, species_Id int, vet_id int);

---add foreign keys
alter table specializations add foreign key(species_id) references species(speciesid);
alter table specializations add foreign key(vet_id) references vets(id);


-----create join table named visits
create table visits(id int generated always as identity primary key, animal_Id int, vet_id int, visit_date date);

 alter table visits add foreign key(vet_id) references vets(id);
 alter table visits add foreign key(animal_id) references animals(id);


---------------------- database performance

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);



 