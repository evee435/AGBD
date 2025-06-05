SELECT * from crime_scene_report
where type = "murder" and city like "sql city" and date = 20180115
              
 /*PROBLEMA*/
Security footage shows that there were 2 witnesses. The first witness lives at the last house on "Northwestern Dr". The second witness, named Annabel, lives somewhere on "Franklin Ave".
/*SOLUCION*/
SELECT * FROM person 
WHERE name like 'annabel%' AND address_street_name like "franklin ave"
/* el % funciona para que cuando busque en la lista name, empiece con anabel ya que name te muestra nombre y apellido y va buscar que anabel este solo al comienzo sin omportar que no tengas el apellido*/
/*el like funciona para que no especificar las mayusculas y que te lo busque igual */

SELECT * FROM person 
where address_street_name like "northwestern Dr" ORDER BY address_number DESC limit 1
/*el ORDER BY se utiliza para ordenar los resultados de una consulta en funcion de una o mas columnas, ya sea de manera ASC (menor a mayor) o DESC (mayor a menor)*/
/*y el limit 1 quiere decir que de limite lo que te va devolver la tabla solamente sea uno, en este caso el mayor de todos*/


id	     name	      license_id	address_number	     address_street_name	           ssn
16371	Annabel Miller	  490173	103	             Franklin Ave	               318771143    

id	    name	         license_id     address_number    address_street_name	    ssn
14887	Morty Schapiro	118009	             4919             Northwestern Dr	    111564949

              
SELECT * FROM person p JOIN interview i ON p.person_id = i.person_id 
WHERE p.person_id = 118009

SELECT * FROM film f
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id 
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id

/*ACT1*/SELECT a.address, f.title, c.city,co.country FROM film f  
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id 
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE f.title like "ACADEMY DINOSAUR" 
WHERE title like "ACADEMY DINOSAUR" AND adress = "address_id"

/*ACT2*/SELECT title, c.category_id, l.language_id, rental_duration, rental_rate FROM film f
INNER JOIN film_category fc ON  f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
INNER JOIN language l ON f.language_id = l.language_id 
WHEN rental_duration BETWEEN 60 AND 120; /*dudoso*/

/*ACT4*/SELECT f.title, min(rental.rental_date), max(rental.rental_date)
FROM rental
INNER JOIN inventory
ON rental.inventory_id = inventory.inventory_id
INNER JOIN film f
ON inventory.film_id = f.film_id

/*ACT5*/


/*ACT6*/select count(*), f.rating FROM film f
GROUP by rating

/*ACT7*/select count(*), c.name FROM film f
INNER JOIN film_category fc ON  f.film_id = fc.film_id
INNER JOIN category c ON fc.category_id = c.category_id
GROUP by c.category_id
/*para facilitar la busqueda en columnas siempre con nombres*/

/*ACT8*/select a.first_name,a.last_name,count(a.actor_id) as cant_actor from film f 
inner join film_actor fa on f.film_id = fa.film_id
INNER join actor a ON fa.actor_id = a.actor_id
GROUP by f.film_id
ORDER by cant_actor desc LIMIT 10;
/*con AS se cambia el nombre de una una columna en los resultados de la consulta.*/

/*ACT9*/SELECT count(film_id) as total_de_inventory, a.address, c.city, co.country FROM inventory i
INNER JOIN store s on i.store_id = s.store_id
INNER join address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER join country co on c.country_id = co.country_id
GROUP by s.store_id
/*group by agrupa filas que tienen los mismos valores en columnas especificas*/

/*ACT10*/SELECT count( DISTINCT film_id) , a.address, c.city, co.country FROM inventory i
INNER JOIN store s on i.store_id = s.store_id
INNER join address a on s.address_id = a.address_id
INNER JOIN city c on a.city_id = c.city_id
INNER join country co on c.country_id = co.country_id
GROUP by s.store_id
/*explicar distinct, arracar de inventory o film es lo mismo ya que inventory tiene las copias*/

/*ACT11*/SELECT c.name as categoria, AVG(f.rental_rate) as promedio_alquler FROM film f 
inner join film_category fc on fc.film_id = f.film_id
inner join  category c ON fc.category_id = c.category_id
GROUP BY c.name
/*avg calcula el promedio de un conjunto de valores numericos en una columna especifica*/

/*ACT12*/
select f.title, r.rental_date, r.return_date, rental_rate, rental_duration ,rental_rate * rental_duration as total_xdia from film f
inner join inventory i on i.film_id = f.film_id 
inner join rental r on r.inventory_id = i.inventory_id
where f.title = "ALABAMA DEVIL";     

/*ACT13*/
SELECT f.title, fc.category_id, rental_duration FROM film f
inner join film_category fc on fc.film_id = f.film_id
inner join category c on c.category_id = fc .category_id
order by fc.category_id, rental_duration DESC

/*ACT14*/
SELECT title, count(fa.actor_id) as cantActores
from film f
INNER JOIN film_actor fa on fa.film_id = f.film_id
WHERE title like "w%" --se busca todos los titulos que empiecen con W
group by f.film_id 
having cantActores > 5

/*ACT15*/
SELECT sum(amount) as totalPrecio, c.first_name, c.last_name from payment p
INNER JOIN customer c on p.customer_id = c.customer_id
GROUP by c.customer_id 

/*ACT16*/
SELECT a.first_name, f.title, f.length FROM film f
inner join film_actor fa on fa.film_id = f.film_id
inner join actor a on a.actor_id = fa.actor_id
order by f.length DESC

/*ACT17*/
SELECT cus.last_name, c.city, co,country, ad.adress, pay.amount, re.rental_date from customer cus
INNER JOIN address ad on cus.address_id = ad.address_id 
INNER JOIN city c on ad.city_id = c.city_id
inner join country co on c.country_id = co.country_id
INNER JOIN rental re on cus.customer_id = re.customer_id 
INNER JOIN payment pay on re.customer_id = pay.customer_id
group by cus.last_name
ORDER by pay.amount ASC

/*ACT18*/
insert into actor(actor_id, first_name, last_name, last_update)
values(201, 'evelyn', 'villarreal', '2025-05-22 09:08:55');

/*ACT19*/
insert into actor(actor_id, first_name, last_name, last_update)
values(205, 'ayelen', 'quispe', '2025-05-22 09:08:55'),
      (206, 'ariana', 'villa', '2025-05-22 09:08:55')

/*ACT20 va modificar los tres datos nuevos */
UPDATE actor 
set first_name= 'EVELYN', last_name = 'VILLARREAL'
WHERE actor_id = 201;

UPDATE actor 
set first_name= 'AYELEN', last_name = 'QUISPE'
WHERE actor_id = 205;

UPDATE actor 
set first_name= 'ARIANA', last_name = 'VILLA'
WHERE actor_id = 206;

/*ACT21 borra todos los datos ingresados finalmente*/
DELETE from actore where actor_id > 200 --borra los datos que agregamos despues del id 200       


              
              



              


              