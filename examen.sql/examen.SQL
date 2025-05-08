--act1
SELECT Title, count(t.name) from albums a inner join tracks t on a.AlbumId = t.AlbumId
 WHERE t.AlbumId= 73

 --act2
SELECT a.name,count(t.TrackId) as cancion, al.Title from artists a 
inner join albums al on al.ArtistId = a.ArtistId
inner join tracks t on al.AlbumId = t.AlbumId
GROUP by a.ArtistId 
HAVING cancion >= 30 
ORDER by cancion DESC;