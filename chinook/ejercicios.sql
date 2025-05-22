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
--5
select al.title, t.UnitPrice from tracks t
inner join albums al on t.AlbumId = al.AlbumId
group by al.title
order by t.UnitPrice ASC
limit 10
--6
SELECT a.Title as nombreDeldisco, t.UnitPrice as precio, g.Name AS genero,t.name as tema  from tracks t
inner join genres g on g.GenreId = t.GenreId
inner join albums a on a.AlbumId = t.AlbumId
where UnitPrice = 0.99
--7
SELECT a.Title as nombreDeldisco, ar.name as artista, t.Milliseconds as duracion, t.name as tema  from tracks t
inner join genres g on g.GenreId = t.GenreId
inner join albums a on a.AlbumId = t.AlbumId
inner join artists ar on a.ArtistId = a.ArtistId
order by Milliseconds ASC
LIMIT 20
--8
--FALTAAAA
--9
INSERT INTO tracks (name, MediaTypeId, Milliseconds, UnitPrice) 
values ('kLoUfReNdS' , '1', '343719', '0,99' ),
 ('lately' , '2', '343719', '0,99' ),
 ('VeLDA' , '1', '343719', '0,99' ),
 ('el muñeco de la ciudad' , '2', '343719', '0,99' );
--10
select name from tracks 
where TrackId >= 3504
--11
update tracks set name = 'loco'
where TrackId = 3506;
update tracks set name = 'clima'
where TrackId = 3507;
--12
select * from tracks 
where TrackId >= 3506
--13
DELETE from tracks
where TrackId in (3506, 3507);

