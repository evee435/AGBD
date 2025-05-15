--1
SELECT LastName, FirstName FROM employees order by LastName, FirstName ASC ;
--2
SELECT Title, Milliseconds FROM albums a inner join tracks t on a.AlbumId = t.AlbumId WHERE t.AlbumId = 5 order by Milliseconds desc ;
--3
SELECT g.name, count(t.TrackId) FROM genres g INNER join tracks t on t.GenreId = g.GenreId --no terminado
--4
select a.Title,  count(TrackId) as canciones_album from tracks t 
inner join albums a on a.AlbumId = t.AlbumId 
GROUP by a.AlbumId
having canciones_album >= 5
order by canciones_album ASC --fila agregada
--6
SELECT a.Title as nombreDeldisco, t.UnitPrice as precio, g.Name AS genero,t.name as tema  from tracks t
inner join genres g on g.GenreId = t.GenreId
inner join albums a on a.AlbumId = t.AlbumId
where UnitPrice = 0.99
--8
SELECT a.Title as nombreDeldisco, ar.name as artista, t.Milliseconds as duracion, t.name as tema  from tracks t
inner join genres g on g.GenreId = t.GenreId
inner join albums a on a.AlbumId = t.AlbumId
inner join artists ar on a.ArtistId = a.ArtistId
order by Milliseconds ASC
LIMIT 20
--9
INSERT INTO tracks (name, MediaTypeId, Milliseconds, UnitPrice) 
values ('kLoUfReNdS' , '1', '343719', '0,99' ) 