# Rebuild Database
```sh
psql -U postgres < students.sql
```

# Mencari kata yang memiliki spasi
```sql
SELECT * FROM students WHERE first_name LIKE '% %';
```

# Mencari kata yang berakhiran tertentu
Contoh mencari 2 kata terakhir diawali r
```sql
-- LIKE : untuk case sensitive
-- ILIKE: untuk case insensitive
SELECT * FROM students WHERE first_name LIKE '%r_';
```

# Mencari kata setelah atau sebelum abjad

```sql
-- Mencari first_name diawali hurup b
SELECT * FROM students WHERE first_name > 'a';
-- Mencari first_name diawali hurup a
SELECT * FROM students WHERE first_name < 'b';
```

# DISTINCT DAN GROUP BY

distinct dan group by manghasilkan query yang sama tetapi dengan menggunakan group by kita bisa menggunakan aggregate function (MIN, MAX, COUNT, etc) pada query select <br />

contoh:
```sql
SELECT major_id, MIN(gpa), MAX(gpa) FROM students GROUP BY major_id;
```

# USING

using digunakan jika join dan column antar join memiliki nama yang sama

```sql
SELECT * FROM students FULL JOIN majors USING(major_id);
-- sama dengan
SELECT * FROM students FULL JOIN majors ON students.major_id = majors.major_id;
```