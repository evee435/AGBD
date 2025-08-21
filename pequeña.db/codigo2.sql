Gmail	evelyn villarreal <evelyn.villarreal245@gmail.com>
Codigo con orden
Rocio Albarracin <ralbarracintrab@gmail.com>	21 de agosto de 2025, 8:50 a.m.
Para: evelyn.villarreal245@gmail.com
------------------------------------COMENZAMOS DE NUEVO
--Primero creamos tablas
BEGIN TRANSACTION;
CREATE TABLE IF NOT EXISTS "categoria" (
 "id_category" INTEGER,
 "categoria" varchar(30) NOT NULL UNIQUE,
 PRIMARY KEY("id_category" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "productos" (
 "id_producto" INTEGER,
 "name" varchar(30) NOT NULL,
 "id_categoria" INTEGER NOT NULL,
 "precio" INTEGER NOT NULL,
 FOREIGN KEY("id_categoria") REFERENCES "categoria"("id_category"),
 PRIMARY KEY("id_producto" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "registro_productos" (
 "id_inventario" INTEGER,
 "id_producto" INTEGER NOT NULL,
 "id_tienda" INTEGER NOT NULL,
 FOREIGN KEY("id_tienda") REFERENCES "tiendas"("id_tienda"),
 FOREIGN KEY("id_producto") REFERENCES "productos"("id_producto"),
 PRIMARY KEY("id_inventario" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "tiendas" (
 "id_tienda" INTEGER,
 "nombre" VARCHAR(40) NOT NULL UNIQUE,
 "ubicación" VARCHAR(50) NOT NULL UNIQUE,
 PRIMARY KEY("id_tienda" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "cant_productos" (
 "id_cantidad" INTEGER NOT NULL,
 "id_producto" INTEGER NOT NULL,
 "cantidad" NUMERIC NOT NULL,
 PRIMARY KEY("id_cantidad" AUTOINCREMENT),
 FOREIGN KEY("id_producto") REFERENCES "productos"("id_producto")
);
CREATE TABLE IF NOT EXISTS "tickets" (
    "id_ticket" INTEGER NOT NULL,
    "id_cliente" INTEGER NOT NULL,
    "id_producto" INTEGER NOT NULL,
    "id_cantidad" INTEGER NOT NULL,
    "id_tienda" INTEGER NOT NULL,
    PRIMARY KEY ("id_ticket" AUTOINCREMENT),
    FOREIGN KEY ("id_cliente") REFERENCES "clientes"("id_cliente") 
    FOREIGN KEY ("id_producto") REFERENCES "productos"("id_producto")
    FOREIGN KEY ("id_cantidad") REFERENCES "cant_productos"("id_cantidad")
    FOREIGN KEY ("id_tienda") REFERENCES "tiendas"("id_tienda")
)
CREATE TABLE IF NOT EXISTS "metodos_pagos" (
 "id_metodo_pago" INTEGER,
 "name" varchar(30) NOT NULL UNIQUE,
 PRIMARY KEY("id_metodo_pago" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "clientes" (
 "id_cliente" INTEGER,
 "name" varchar(30) NOT NULL,
 "apellido" varchar(30) NOT NULL,
 "genero" varchar(15) NOT NULL,
 "email" varchar(30) NOT NULL UNIQUE,
 PRIMARY KEY("id_cliente" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "clientes_pago" (
 "id_pago" INTEGER,
 "id_cliente" INTEGER,
 "id_metodo_pago" INTEGER,
 FOREIGN KEY("id_cliente") REFERENCES "clientes"("id_cliente"),
 FOREIGN KEY("id_metodo_pago") REFERENCES "metodos_pagos"("id_metodo_pago"),
 PRIMARY KEY("id_pago" AUTOINCREMENT)
);
CREATE TABLE IF NOT EXISTS "empleados" (
 "id_empleado" INTEGER,
 "nombre" VARCHAR(40) NOT NULL UNIQUE,
 "apellido" VARCHAR(40) NOT NULL UNIQUE,
 "id_tienda" INTEGER NOT NULL,
 "puesto_trabajo" VARCHAR(50) NOT NULL,
 "email" VARCHAR(50) NOT NULL,
 "telefono" NUMERIC NOT NULL,
 FOREIGN KEY("id_tienda") REFERENCES "tiendas"("id_tienda"),
 PRIMARY KEY("id_empleado" AUTOINCREMENT)
);

CREATE TABLE IF NOT EXISTS "registro_ventas" (
 "id_venta" INTEGER,
 "dia" NUMERIC NOT NULL,
 "mes" NUMERIC NOT NULL,
 "anio" NUMERIC NOT NULL,
 "id_pago" INTEGER NOT NULL,
 "costo_total" INTEGER NOT NULL,
 "id_empleado" INTEGER NOT NULL,
 "id_cantidad" INTEGER,
 FOREIGN KEY("id_empleado") REFERENCES "empleados"("id_empleado"),
 PRIMARY KEY("id_venta" AUTOINCREMENT),
 FOREIGN KEY("id_pago") REFERENCES "clientes_pago"("id_pago"),
 FOREIGN KEY("id_cantidad") REFERENCES "cant_productos"("id_cantidad")
);

-- Insertamos (primero) en tablas independientes
INSERT INTO "categoria" ("id_category","categoria") VALUES (1,'carteras');
INSERT INTO "categoria" ("id_category","categoria") VALUES (2,'uñas');
INSERT INTO "categoria" ("id_category","categoria") VALUES (3,'guantes');
INSERT INTO "categoria" ("id_category","categoria") VALUES (4,'bufanda');
INSERT INTO "categoria" ("id_category","categoria") VALUES (5,'gorras');
INSERT INTO "categoria" ("id_category","categoria") VALUES (6,'lentes');
INSERT INTO "categoria" ("id_category","categoria") VALUES (7,'reloj');
INSERT INTO "categoria" ("id_category","categoria") VALUES (8,'anillos');
INSERT INTO "categoria" ("id_category","categoria") VALUES (9,'collares');
INSERT INTO "categoria" ("id_category","categoria") VALUES (10,'pulseras');
INSERT INTO "categoria" ("id_category","categoria") VALUES (11,'broches');
INSERT INTO "categoria" ("id_category","categoria") VALUES (12,'vinchas');
INSERT INTO "categoria" ("id_category","categoria") VALUES (13,'scrunchies');

INSERT INTO "tiendas" ("id_tienda","nombre","ubicación") VALUES (1,'Tienda online','Plataforma Web');
INSERT INTO "tiendas" ("id_tienda","nombre","ubicación") VALUES (2,'Sucursal física EUNOIA','Boedo 1749');

INSERT INTO "metodos_pagos" ("id_metodo_pago","name") VALUES (1,'Efectivo');
INSERT INTO "metodos_pagos" ("id_metodo_pago","name") VALUES (2,'mercado pago');
INSERT INTO "metodos_pagos" ("id_metodo_pago","name") VALUES (3,'Tarjeta debito');
INSERT INTO "metodos_pagos" ("id_metodo_pago","name") VALUES (4,'Tarjeta credito');
INSERT INTO "metodos_pagos" ("id_metodo_pago","name") VALUES (5,'Transferencia');

INSERT INTO "clientes" ("id_cliente","name","apellido","genero","email") VALUES (1,'ayelen','quispe','F','ayelenquispe@etec.uba.ar');
INSERT INTO "clientes" ("id_cliente","name","apellido","genero","email") VALUES (5,'leonel','ordoñez','M','ordoñezleo@etec.uba.ar');
INSERT INTO "clientes" ("id_cliente","name","apellido","genero","email") VALUES (7,'antonela','gonzales','F','antogonzales22@etec.uba.ar');
INSERT INTO "clientes" ("id_cliente","name","apellido","genero","email") VALUES (9,'rocio','albarracin','F','ralbarracintrab@etec.uba.ar');

INSERT INTO "empleados" ("id_empleado","nombre","apellido","id_tienda","puesto_trabajo","email","telefono") VALUES (1,'Ariana','Villa Medina',2,'Cajera','ariana@gmail.com',1123452413);
INSERT INTO "empleados" ("id_empleado","nombre","apellido","id_tienda","puesto_trabajo","email","telefono") VALUES (2,'Ayelen','Quispe Aguilar',2,'Manager','ayelen@gmail.com',1123452423);
INSERT INTO "empleados" ("id_empleado","nombre","apellido","id_tienda","puesto_trabajo","email","telefono") VALUES (3,'Evelyn','Villarreal',1,'Manager','evelyn@gmail.com',1123452433);
INSERT INTO "empleados" ("id_empleado","nombre","apellido","id_tienda","puesto_trabajo","email","telefono") VALUES (4,'Rocio','Albarracin',1,'Diseño visual','rocio@gmail.com',1123452453);

-- Y ahora la tablas dependientes que usan forinkey
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (1,'Broche hawaiano celeste',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (2,'Broche hawaiano rosa',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (3,'Broche flor violeta mate',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (4,'Broche rectangular verde mate',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (5,'Broche rectangular amarillo',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (6,'Broche flor rojo mate',11,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (7,'Diadema trenza de flor dorada',12,2700);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (8,'Diadema trenza de flor plateada',12,2700);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (9,'Diadema con perlas',12,2700);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (10,'Vincha en trenza tejida color negro',12,2900);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (11,'Vincha en tela básica color blanco',12,2900);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (12,'Vincha en tela básica color beige',12,2900);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (13,'Scrunchie basica lisa',13,600);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (14,'Scrunchie color liso con perlas',13,1000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (15,'Scrunchie estampado con perlas',13,900);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (16,'Scrunchie estampado',13,600);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (17,'Bolso de cuerina',1,17000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (18,'Bolso de cuero',1,23000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (19,'Guantes de lana lisos',3,2000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (20,'Guantes estampados de lana',3,3000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (21,'Bufanda lisa',4,7000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (22,'Bufanda estampada',4,7500);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (23,'Anillo basico laminado en plata',8,6000);
INSERT INTO "productos" ("id_producto","name","id_categoria","precio") VALUES (24,'Anillo con perla laminado en oro',8,6000);

INSERT INTO "registro_productos" ("id_inventario","id_producto","id_tienda") VALUES (1,4,1);
INSERT INTO "registro_productos" ("id_inventario","id_producto","id_tienda") VALUES (2,5,2);
INSERT INTO "registro_productos" ("id_inventario","id_producto","id_tienda") VALUES (3,8,1);
INSERT INTO "registro_productos" ("id_inventario","id_producto","id_tienda") VALUES (4,6,1);

INSERT INTO "cant_productos" ("id_cantidad","id_producto","cantidad") VALUES (1,4,2);
INSERT INTO "cant_productos" ("id_cantidad","id_producto","cantidad") VALUES (2,4,2);
INSERT INTO "cant_productos" ("id_cantidad","id_producto","cantidad") VALUES (3,4,3);
INSERT INTO "cant_productos" ("id_cantidad","id_producto","cantidad") VALUES (4,1,2);

INSERT INTO "clientes_pago" ("id_pago","id_cliente","id_metodo_pago") VALUES (1,1,5);
INSERT INTO "clientes_pago" ("id_pago","id_cliente","id_metodo_pago") VALUES (2,9,3);
INSERT INTO "clientes_pago" ("id_pago","id_cliente","id_metodo_pago") VALUES (3,5,1);
INSERT INTO "clientes_pago" ("id_pago","id_cliente","id_metodo_pago") VALUES (4,7,3);

INSERT INTO "registro_ventas" ("id_venta","dia","mes","anio","id_pago","costo_total","id_empleado","id_cantidad") VALUES (1,26,6,2025,1,6000,3,4);
INSERT INTO "registro_ventas" ("id_venta","dia","mes","anio","id_pago","costo_total","id_empleado","id_cantidad") VALUES (5,26,6,2025,2,9000,2,3);
INSERT INTO "registro_ventas" ("id_venta","dia","mes","anio","id_pago","costo_total","id_empleado","id_cantidad") VALUES (6,26,6,2025,3,6000,3,2);
INSERT INTO "registro_ventas" ("id_venta","dia","mes","anio","id_pago","costo_total","id_empleado","id_cantidad") VALUES (7,26,6,2025,4,3000,1,1);

COMMIT;


--falta que rocio me pase los datos de la tabla ticket, INSERT
-- hoy 21/08 agregamos una tabla de ticket que es para los clientes, cmabiamos el nombre de ventas a registro_ventas