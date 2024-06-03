# Connect DB
```sh
psql --username=freecodecamp --dbname=postgres
# IF database students already exist
psql --username=freecodecamp --dbname=students
```

# View existing databases
```sh
\l
```

# Latihan
```sh
# CASE 1 CREATE TABLE
CREATE DATABASE students; 
\c students # connect to database
CREATE TABLE students();
CRAETE TABLE majors();
CREATE TABLE courses();
CREATE TABLE majors_courses();
\d # describe all tables in db students

# CASE 2 ADD COLUMN
## students
ALTER TABLE students ADD COLUMN student_id SERIAL PRIMARY KEY;
ALTER TABLE students ADD COLUMN first_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN last_name VARCHAR(50) NOT NULL;
ALTER TABLE students ADD COLUMN major_id INT;
ALTER TABLE students ADD COLUMN gpa NUMERIC(2, 1);

## majors
ALTER TABLE majors ADD COLUMN major_id SERIAL PRIMARY KEY;
ALTER TABLE majors ADD COLUMN major VARCHAR(50) NOT NULL;
ALTER TABLE students ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);

## courses
ALTER TABLE majors ADD COLUMN course_id SERIAL PRIMARY KEY;
ALTER TABLE courses ADD COLUMN course  VARCHAR(100) NOT NULL;

## majors_courses => junction table majors and courses
ALTER TABLE majors_courses ADD COLUMN major_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(major_id) REFERENCES majors(major_id);
ALTER TABLE majors_courses ADD COLUMN course_id INT;
ALTER TABLE majors_courses ADD FOREIGN KEY(course_id) REFERENCES courses(course_id);

## create a composite primary key majors_courses
ALTER TABLE majors_courses ADD PRIMARY KEY (course_id, major_id);

## INSERT VALUE INTO majors
INSERT INTO majors(major) VALUES ('Database Administration');
## INSERT VALUE INTO courses
INSERT INTO courses(course) VALUES ('Data Structures and Algorithms');
## INSERT INTO majors_courses
INSERT INTO majors_courses(major_id, course_id) VALUES (1,1);
## INSERT INTO students
INSERT INTO students (first_name,last_name,major_id,gpa) VALUES ('Rhea','Kellems',1,2.5);
```

# Membuat Single Command PSQL

command dibawah ini akan memberikan izin untuk mengakses database melalui bash scripting yang akan kita buat
```sh
PSQL="psql -X --username=freecodecamp --dbname=students --no-align --tuples-only -c"
# -c flag that is for running a single command and exiting. The rest of the flags are for formatting
```

# INSERT VALUES TABLES OTOMATIS MENGGUNAKAN BASH SCRIPTING

```sh
touch insert_data.sh
```

# Menghapus semua data pada table
```sh
TRUNCATE majors;
# lebih dari satu table karena terikat dengan forigen key
TRUNCATE majors, majors_courses, students;
```
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql in the terminal to dump the database into a students.sql file. It will save all the commands needed to rebuild it. Take a quick look at the file when you are done.


```sh
pg_dump --clean --create --inserts --username=freecodecamp students > students.sql
```