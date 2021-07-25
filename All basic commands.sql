CREATE DATABASE record_company;
USE record_company;
CREATE TABLE bands (
	id INT NOT NULL AUTO_INCREMENT,
	name VARCHAR(255) NOT NULL,
    PRIMARY KEY (id)
);

CREATE TABLE albums (
 id INT NOT NULL AUTO_INCREMENT,
 album_name VARCHAR(255) NOT NULL,
 release_year INT,
 band_id INT NOT NULL,
 PRIMARY KEY (id),
 FOREIGN KEY(band_id) REFERENCES bands(id)
);

INSERT INTO bands (name)
VALUES ('One Direction');

INSERT INTO bands(name)
VALUES ('Deuce'),('Linkin Park');

INSERT INTO bands(name)
VALUES ('ABC');

SELECT * FROM bands;

SELECT * FROM bands LIMIT 2;

SELECT id FROM bands;

SELECT id AS 'Identity', NAME AS 'Band Name' FROM bands;

SELECT * FROM bands ORDER BY NAME;

SELECT * FROM bands ORDER BY NAME DESC;

INSERT INTO albums(album_name,release_year, band_id)
VALUES ('Made in the AM',2014,3), ('Transformers',2010,2);
INSERT INTO albums(album_name,release_year, band_id)
VALUES ('MidNight memories',2015,3), ('Transformers',2010,2);

INSERT INTO albums(album_name,release_year, band_id) 
VALUES ('Happy',NULL,3);

SELECT * FROM albums;

SELECT DISTINCT album_name FROM albums;

 UPDATE albums SET release_year = 1982 WHERE id = 1;
 SELECT * FROM albums;
 
 SELECT * FROM albums WHERE release_year < 2000;
 
 SELECT * FROM albums WHERE album_name LIKE '%er%' OR band_id = 2;
 
 SELECT * FROM albums WHERE release_year = 1982 AND id = 1;
 
 SELECT * FROM albums WHERE release_year BETWEEN 2000 AND 2020; 
 
 SELECT * FROM albums WHERE release_year IS NULL;
 
 DELETE FROM albums WHERE release_year IS NULL;
 
 SELECT * FROM albums;
 
 SELECT * FROM bands 
 JOIN albums ON bands.id = albums.band_id;
 
SELECT * FROM bands 
INNER JOIN albums ON bands.id = albums.band_id;

SELECT * FROM bands 
LEFT JOIN albums ON bands.id = albums.band_id;

SELECT * FROM albums 
RIGHT JOIN bands ON bands.id = albums.band_id;
 
SELECT AVG(release_year) FROM albums;

SELECT SUM(release_year) FROM albums;

SELECT COUNT(album_name) FROM albums;

SELECT band_id, COUNT(band_id) FROM albums GROUP BY band_id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id;

SELECT b.name AS band_name, COUNT(a.id) AS num_albums
FROM bands AS b
LEFT JOIN albums AS a ON b.id = a.band_id
GROUP BY b.id
HAVING num_albums = 2;
 