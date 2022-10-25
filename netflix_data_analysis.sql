CREATE DATABASE Netflix_data;

USE Netflix_data;

-- import error shown when importing table so dropping table titles so I can import again 

DROP TABLE titles;

-- Selecting all from titles to check data imported correctly 

SELECT * FROM titles;

-- creating a new table to sort the imdb_data separately to start normalising the data 

CREATE TABLE imdb_data
(
imbd_id VARCHAR(20) NOT NULL PRIMARY KEY, 
imdb_score DOUBLE NOT NULL
);

-- trying to insert imdb_id and imdb_score from titles table into imdb_data 

INSERT INTO imdb_data (imdb_id, imdb_score)
SELECT imdb_id, imdb_score FROM titles;

-- error - noticing that imdb_id column has been labelled imbd_id (d and b transposed) so updating column name to correct this 

ALTER TABLE imdb_data 
RENAME COLUMN imbd_id 
TO imdb_id;

-- trying insert data again 

INSERT INTO imdb_data (imdb_id, imdb_score)
SELECT imdb_id, imdb_score FROM titles;

-- selecting all from imdb_data to check copied over in correct format 

SELECT * FROM imdb_data;

-- removing imdb_score from titles table as no longer needed as it is contained in imdb_data table now 

ALTER TABLE titles
DROP COLUMN imdb_score;

-- query to show top 10 titles in Netflix by imdb_score 

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
ORDER BY i.imdb_score DESC
LIMIT 10;

-- changing query to show top 10 titles where type = movie 

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
WHERE t.type = 'movie'
ORDER BY i.imdb_score DESC
LIMIT 10;

-- changing query to show top 10 titles where type = show 

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
WHERE t.type = 'show'
ORDER BY i.imdb_score DESC
LIMIT 10;

-- changing query to show top 10 titles where genre includes 'comedy'

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
WHERE t.genres LIKE ('%comedy%') 
ORDER BY i.imdb_score DESC
LIMIT 10;

-- changing query to show top 10 titles where genre includes 'drama' 

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
WHERE t.genres LIKE ('%drama%') 
ORDER BY i.imdb_score DESC
LIMIT 10;

-- changing query to show top 10 titles where genre includes 'romance' 

SELECT t.title, i.imdb_score 
FROM titles AS t
LEFT JOIN imdb_data AS i 
ON t.imdb_id = i.imdb_id
WHERE t.genres LIKE ('%romance%') 
ORDER BY i.imdb_score DESC
LIMIT 10;

-- selecting count of various genres and grouping by genre, ordering by count desc to ascertain most popular genre classifications 

SELECT count(title), genres
FROM titles 
GROUP BY genres
ORDER BY count(title) DESC;

-- then filtering groups to show those including 'comedy' as a genre - showing most popular movie genre combinations with comedy included 

SELECT count(title), genres
FROM titles 
GROUP BY genres
HAVING genres LIKE '%comedy%'
ORDER BY count(title) DESC;

-- removing having filter, then limit by top 10 

SELECT count(title), genres
FROM titles 
GROUP BY genres
ORDER BY count(title) DESC
LIMIT 10;



