SELECT * FROM INHABITANT 
SELECT * FROM INHABITANT WHERE state = "friendly"
SELECT * FROM INHABITANT WHERE state = "friendly" AND job = "weaponsmith"
SELECT * FROM INHABITANT WHERE job = "weaponsmith"
SELECT * FROM INHABITANT WHERE job LIKE '%smith' AND state LIKE "friendly"
SELECT personid FROM INHABITANT WHERE name = "Stranger"
SELECT gold FROM INHABITANT WHERE name = "Stranger"
SELECT * FROM ITEM WHERE owner IS NULL
UPDATE item SET owner = 20 WHERE owner IS NULL
SELECT item FROM ITEM WHERE owner = 20
SELECT * FROM INHABITANT WHERE state ="friendly" AND job ="dealer" OR job = "merchant"  
/*count() si queres algo especifico pones el nombre de la columna, si queres contar*/
/*todo usas (*)*/