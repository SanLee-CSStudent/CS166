--EXERCISE 2
DROP TABLE IF EXISTS Musicians;
DROP TABLE IF EXISTS Album;
DROP TABLE IF EXISTS Instrument;
DROP TABLE IF EXISTS Songs;

--entities
CREATE TABLE Musicians(ssn NUMERIC(10, 0), name TEXT, PRIMARY KEY(ssn));
CREATE TABLE Album(album_id INT, title TEXT, copyright_date DATE, speed INT, PRIMARY KEY(album_id));
CREATE TABLE Instrument(instrument_id INT, dname TEXT, key TEXT, PRIMARY KEY(instrument_id));
CREATE TABLE Songs(song_id INT, title TEXT, author TEXT, PRIMARY KEY(song_id));
CREATE TABLE Place(address TEXT, PRIMARY KEY(address));

--relationships
CREATE TABLE Telephone_Home(address TEXT, phone_no TEXT, PRIMARY KEY(phone_no), FOREIGN KEY(address) REFERENCES Place);
CREATE TABLE Lives(ssn NUMERIC(10, 0), address TEXT, phone_no TEXT, PRIMARY KEY(ssn, address), FOREIGN KEY(phone_no) REFERENCES Telephone_Home, FOREIGN KEY(address) REFERENCES Place, FOREIGN KEY(ssn) REFERENCES Musicians);

CREATE TABLE Plays(ssn NUMERIC(10, 0), instrument_id INT, PRIMARY KEY(ssn, instrument_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(instrument_id) REFERENCES Instrument);

CREATE TABLE Perform(ssn NUMERIC(10, 0), song_id INT, PRIMARY KEY(ssn, song_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(song_id) REFERENCES Songs);

CREATE TABLE Produce(ssn NUMERIC(10, 0), album_id INT, PRIMARY KEY(album_id), FOREIGN KEY(ssn) REFERENCES Musicians, FOREIGN KEY(album_id) REFERENCES Album);

CREATE TABLE Appears(album_id INT, song_id INT, PRIMARY KEY(song_id), FOREIGN KEY(album_id) REFERENCES Album, FOREIGN KEY(song_id) REFERENCES Songs);