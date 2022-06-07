-- create database and table with columns 
create database vet_clinic;
create table animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth date,escape_attempts INT,neutered boolean,weight_kg DECIMAL, PRIMARY KEY(id));
