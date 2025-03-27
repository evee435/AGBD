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

SELECT a.address, f.title, c.city,co.country FROM film f  
INNER JOIN inventory i ON f.film_id = i.film_id
INNER JOIN store s ON i.store_id = s.store_id 
INNER JOIN address a ON s.address_id = a.address_id
INNER JOIN city c ON a.city_id = c.city_id
INNER JOIN country co ON c.country_id = co.country_id
WHERE f.title like "ACADEMY DINOSAUR" 

WHERE title like "ACADEMY DINOSAUR" AND adress = "address_id"
              
              



              
              



              


              
              



              


              