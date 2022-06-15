create database vet_clinic;

-- tables
create table species(id int generated always as identity primary key, name varchar(20));

create table owners(id int generated always as identity primary key, full_name varchar(35), age int, email varchar(55));

create table vets(id int generated always as identity primary key, name varchar(35), age int, graduation_date date);

create table animals(id INT GENERATED ALWAYS AS IDENTITY primary key, name text, date_of_birth date,escape_attempts INT,neutered boolean,weight_kg DECIMAL(3,2), species_id int not null, owners_id int,
 foreign key (species_id) references species(id), foreign key (owners_id) references owners(id));

 create table visits(animal_id int not null, vet_id int not null , foreign key (animal_id) references animals(id), foreign key (vet_id) references vets(id), visit_date date);