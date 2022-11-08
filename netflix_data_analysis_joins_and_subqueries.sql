USE netflix_data;

-- query to show character name, who they were played by and the title of the film they were in using a join 

SELECT c.name, c.character, t.title 
FROM credits AS c 
RIGHT JOIN titles AS t 
ON c.id = t.id;

-- using subquery and join to show titles and imdb score for those titles with higher than average imdb scores 

SELECT titles.title, imdb_data.imdb_score  
FROM titles
LEFT JOIN imdb_data 
ON titles.imdb_id = imdb_data.imdb_id
WHERE 
(SELECT avg(imdb_score)
FROM imdb_data);

