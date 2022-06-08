-- create database and table with columns 
create database vet_clinic;
create table animals(id INT GENERATED ALWAYS AS IDENTITY, name TEXT, date_of_birth date,escape_attempts INT,neutered boolean,weight_kg DECIMAL, PRIMARY KEY(id));
alter table animals add species varchar;

---create tables for owners and species
 create table owners(id int generated always as identity primary key, full_name varchar, age int);
 create table spcies(id int generated always as identity primary key, name varchar);