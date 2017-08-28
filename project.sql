todolist=# CREATE TABLE todos (id SERIAL PRIMARY KEY, title VARCHAR(255) NOT NULL, details VARCHAR(800) NULL, priority INTEGER NOT NULL DEFAULT '1', createdAt TIMESTAMP NOT NULL, completedAt TIMESTAMP NULL);
CREATE TABLE
todolist=# \dt
        List of relations
 Schema | Name  | Type  | Owner
--------+-------+-------+--------
 public | todos | table | Drobek
(1 row)

todolist=# INSERT INTO todos (title, details, priority, createdAt, completedAt) VALUES ('wash the car', 'make sure to use wax, and lint-free rags', '5','2017-08-28 02:33:00', '2017-08-28 02:40:00');
todolist=# INSERT INTO todos (title, details, priority, createdAt) VALUES ('go grocery shopping', 'please dont forget the peanut butter', '6', '2017-08-28 15:11:00');
todolist=# INSERT INTO todos (title, details, priority, createdAt) VALUES ('walk charlie dog', 'charlie only likes to make left hand turns on his walks', '3', '2017-08-28 15:19:00');
todolist=# INSERT INTO todos (title, details, priority, createdAt) VALUES ('make a psql todo list', 'make sure you close all your quotes and dont use apostrophes', '2', '2017-08-28 15:24:00');
todolist=# INSERT INTO todos (title, details, priority, createdAt) VALUES ('jack hammer the sidewalks', 'be sure avoid pedestrians', '4', '2017-08-28 15:27:00');

todolist=# SELECT * FROM todos;
 id |           title           |                           details                            | priority |      createdat      |     complet
----+---------------------------+--------------------------------------------------------------+----------+---------------------+------------
  1 | wash the car              | make sure to use wax, and lint-free rags                     |        5 | 2017-08-28 02:33:00 | 2017-08-28
  2 | go grocery shopping       | please dont forget the peanut butter                         |        6 | 2017-08-28 15:11:00 |
  3 | walk charlie dog          | charlie only likes to make left hand turns on his walks      |        3 | 2017-08-28 15:19:00 |
  4 | make a psql todo list     | make sure you close all your quotes and dont use apostrophes |        2 | 2017-08-28 15:24:00 |
  5 | jack hammer the sidewalks | be sure avoid pedestrians                                    |        4 | 2017-08-28 15:27:00 |
(5 rows)

todolist=# SELECT title FROM todos WHERE completedAt IS NULL;
           title
---------------------------
 go grocery shopping
 walk charlie dog
 make a psql todo list
 jack hammer the sidewalks
(4 rows)

todolist=# SELECT title FROM todos WHERE priority > '1';
           title
---------------------------
 wash the car
 go grocery shopping
 walk charlie dog
 make a psql todo list
 jack hammer the sidewalks
(5 rows)

todolist=# UPDATE todos SET completedAt = '2017-08-28 15:38:00' WHERE id = 3;
UPDATE 1
todolist=# SELECT * FROM todos;
 id |           title           |                           details                            | priority |      createdat      |     complet
----+---------------------------+--------------------------------------------------------------+----------+---------------------+------------
  1 | wash the car              | make sure to use wax, and lint-free rags                     |        5 | 2017-08-28 02:33:00 | 2017-08-28
  2 | go grocery shopping       | please dont forget the peanut butter                         |        6 | 2017-08-28 15:11:00 |
  4 | make a psql todo list     | make sure you close all your quotes and dont use apostrophes |        2 | 2017-08-28 15:24:00 |
  5 | jack hammer the sidewalks | be sure avoid pedestrians                                    |        4 | 2017-08-28 15:27:00 |
  3 | walk charlie dog          | charlie only likes to make left hand turns on his walks      |        3 | 2017-08-28 15:19:00 | 2017-08-28
(5 rows)

todolist=# DELETE FROM todos WHERE completedAt IS NOT NULL;
DELETE 2
todolist=# SELECT * FROM todos;
 id |           title           |                           details                            | priority |      createdat      | completedat
----+---------------------------+--------------------------------------------------------------+----------+---------------------+------------
  2 | go grocery shopping       | please dont forget the peanut butter                         |        6 | 2017-08-28 15:11:00 |
  4 | make a psql todo list     | make sure you close all your quotes and dont use apostrophes |        2 | 2017-08-28 15:24:00 |
  5 | jack hammer the sidewalks | be sure avoid pedestrians                                    |        4 | 2017-08-28 15:27:00 |
(3 rows)
