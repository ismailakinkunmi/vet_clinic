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
----------- TWO STEPS_____________
------------- for species
alter table animals add column speciesId int;
alter table add foreign key(speciesId) references species(speciesId); 
----------------for owners
alter table animals add column ownerId int;
alter table add foreign key(ownerId) references owners(ownerId); 


