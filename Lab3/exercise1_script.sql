--EXERCISE 1
DROP TABLE IF EXISTS Professor;
DROP TABLE IF EXISTS Project;
DROP TABLE IF EXISTS Dept;
DROP TABLE IF EXISTS Graduate;

--entities
CREATE TABLE Professor(prof_SSN NUMERIC(10, 0), name TEXT, age REAL, rank REAL, specialty TEXT, PRIMARY KEY(prof_SSN));
CREATE TABLE Project(PNO INT, sponsor TEXT, start_date DATE, end_date DATE, budget REAL, PRIMARY KEY(PNO));
CREATE TABLE Dept(DNO INT, dname TEXT, office TEXT, PRIMARY KEY(DNO));
CREATE TABLE Graduate(grad_SSN NUMERIC(10, 0), name TEXT, age REAL, degree TEXT, PRIMARY KEY(grad_SSN));

--relationships
CREATE TABLE work_in(prof_SSN NUMERIC(10, 0), PNO INT, PRIMARY KEY(prof_SSN, PNO), FOREIGN KEY(prof_SSN) REFERENCES Professor, FOREIGN KEY(PNO) REFERENCES Project);
CREATE TABLE manage(prof_SSN NUMERIC(10, 0), PNO INT, PRIMARY KEY(PNO), FOREIGN KEY(prof_SSN) REFERENCES Professor, FOREIGN KEY(PNO) REFERENCES Project);
CREATE TABLE supervise(prof_SSN NUMERIC(10, 0), PNO INT, grad_SSN NUMERIC(10, 0), PRIMARY KEY(PNO, grad_SSN), FOREIGN KEY(prof_SSN) REFERENCES Professor, FOREIGN KEY(PNO) REFERENCES Projects, FOREIGN KEY(grad_SSN) REFERENCES Graduate);

CREATE TABLE work_dept(time_pc INT, prof_SSN NUMERIC(10, 0), DNO INTEGER, PRIMARY KEY(prof_SSN, DNO), FOREIGN KEY(prof_SSN) REFERENCES Professor, FOREIGN KEY(DNO) REFERENCES Dept);
CREATE TABLE runs(prof_SSN NUMERIC(10, 0), DNO INTEGER, PRIMARY KEY(DNO), FOREIGN KEY(prof_SSN) REFERENCES Professor, FOREIGN KEY(DNO) REFERENCES Dept);

CREATE TABLE major(grad_SSN NUMERIC(10, 0), DNO INT, PRIMARY KEY(grad_SSN), FOREIGN KEY(grad_SSN) REFERENCES Graduate, FOREIGN KEY(DNO) REFERENCES Dept);

CREATE TABLE work_proj(since DATE, grad_SSN NUMERIC(10, 0), PNO INT, PRIMARY KEY(grad_SSN, PNO), FOREIGN KEY(grad_SSN) REFERENCES Graduate, FOREIGN KEY(PNO) REFERENCES Project);

CREATE TABLE advise(senior_SSN NUMERIC(10, 0), grad_SSN(10, 0), PRIMARY KEY(grad_SSN), FOREIGN KEY(senior_SSN) REFERENCES Graduate, FOREIGN KEY(grad_SSN) REFERENCES Graduate);

--EXERCISE 2
DROP TABLE IF EXISTS Musicians;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS Songs;

--entities
CREATE TABLE Musicians(ssn NUMERIC(10, 0), name TEXT, PRIMARY KEY(ssn));
CREATE TABLE Album(album_id INT, title TEXT, copyright_date DATE, speed INT, PRIMARY KEY(identifier));
CREATE TABLE Instrument(instrument_id INT, dname TEXT, key TEXT, PRIMARY KEY(instrument_id));
CREATE TABLE Songs(song_id INT, title TEXT, author TEXT, PRIMARY KEY(song_id));
CREATE TABLE Place(address TEXT, PRIMARY KEY(address));
CREATE TABLE Telephone(phone_no TEXT);

--relationships
CREATE TABLE Home(address TEXT NOT NULL, phone_no TEXT NOT NULL, UNIQUE(phone_no), FOREIGN KEY(address) REFERENCES Place, FOREIGN KEY(phone_no) REFERENCES Telephone);
CREATE TABLE Lives(ssn NUMERIC(10, 0), address TEXT, phone_no TEXT, PRIMARY KEY(ssn, address), FOREIGN KEY(address, phone_no) REFERENCES Home, FOREIGN KEY(ssn) REFERENCES Musicians);

CREATE TABLE Plays(ssn NUMERIC(10, 0), instrument_id INT, PRIMARY KEY(ssn, instrument_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(instrument_id) REFERENCES Instrument);

CREATE TABLE Perform(ssn NUMERIC(10, 0), song_id INT, PRIMARY KEY(ssn, song_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(song_id) REFERENCES Songs);

CREATE TABLE Produce(ssn NUMERIC(10, 0), album_id INT, PRIMARY KEY(album_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(album_id) REFERENCES Album);

CREATE TABLE Appears(album_id INT, song_id INT, PRIMARY KEY(song_id), FOREIGN KEY(album_id) REFERENCES Album, FOREIGN KEY(song_id) REFERENCES Songs);