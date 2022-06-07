-- animal name ends in "mon"
SELECT name FROM animals WHERE EXTRACT(YEAR FROM date_of_birth) BETWEEN 2016 AND 2019;
SELECT name FROM animals WHERE (neutered IS true AND escape_attempts < 3);