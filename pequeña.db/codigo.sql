CREATE TABLE "categoria" (
	"id_category"	INTEGER,
	"categoria"	varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY("id_category" AUTOINCREMENT)
	--esta tabla no tiene foreing key porque no tiene refenrencia con productos ("producto tiene categoria pero categori no tiene producto")
);


CREATE TABLE "productos" (
	"id_producto"	INTEGER,
	"name"	INTEGER NOT NULL,
	"id_categoria" INTEGER NOT NULL,
	PRIMARY KEY("id_producto" AUTOINCREMENT),
	FOREIGN KEY ("id_categoria") REFERENCES categoria("id_category")
);

CREATE TABLE "clientes" (
	"id_cliente" INTEGER,
	"name" varchar(30) NOT NULL UNIQUE,
	"apellido" varchar(30) NOT NULL UNIQUE, 
	"genes" INTEGER NOT NULL UNIQUE,--quizas alguien no quiera decir su genero
	"email" varchar(30) NOT NULL UNIQUE, 
	PRIMARY KEY("id_cliente" AUTOINCREMENT)
);
CREATE TABLE "compras_clientes" (
	"id_producto" INTEGER,
	"id_cliente" INTEGER NOT NULL,
	"id_venta" INTEGER NOT NULL,
	PRIMARY KEY("id_venta" AUTOINCREMENT),
	FOREIGN KEY ("id_cliente") REFERENCES clientes("id_cliente")
	FOREIGN KEY ("id_producto") REFERENCES productos("id_producto")
);
CREATE TABLE "clientes_pago" (
	"id_cliente" INTEGER,
	"id_metodo_pago" INTEGER,
	"id_pago" INTEGER,
	PRIMARY KEY("id_pago" AUTOINCREMENT)
	FOREIGN KEY ("id_cliente") REFERENCES clientes("id_cliente")
	FOREIGN KEY ("id_metodo_pago") REFERENCES clientes("id_metodo_pago")

);
CREATE TABLE "metodos_pagos" (
	"id_metodo_pago" INTEGER,
	"name" varchar(30) NOT NULL UNIQUE,
	PRIMARY KEY("id_metodo_pago" AUTOINCREMENT)
);