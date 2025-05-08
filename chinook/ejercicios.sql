SELECT LastName, FirstName FROM employees order by LastName, FirstName ASC ;
SELECT Title, Milliseconds FROM albums a inner join tracks t on a.AlbumId = t.AlbumId WHERE t.AlbumId = 5 order by Milliseconds desc ;
SELECT g.name, count(t.TrackId) FROM genres g INNER join tracks t on t.GenreId = g.GenreId --no terminado

