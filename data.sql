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
