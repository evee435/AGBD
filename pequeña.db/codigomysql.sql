CREATE TABLE IF NOT EXISTS categoria (
    id_category INT AUTO_INCREMENT,
    categoria VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(id_category)
);

CREATE TABLE IF NOT EXISTS productos (
    id_producto INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    id_categoria INT NOT NULL,
    precio INT NOT NULL,
    FOREIGN KEY(id_categoria) REFERENCES categoria(id_category),
    PRIMARY KEY(id_producto)
);

CREATE TABLE IF NOT EXISTS tiendas (
    id_tienda INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL UNIQUE,
    ubicacion VARCHAR(50) NOT NULL UNIQUE,
    PRIMARY KEY(id_tienda)
);

CREATE TABLE IF NOT EXISTS `cant_productos` (
    `id_cantidad` INTEGER NOT NULL AUTO_INCREMENT,
    `cantidad` DECIMAL NOT NULL,
    PRIMARY KEY(`id_cantidad`)
);

CREATE TABLE IF NOT EXISTS registro_productos (
    id_inventario INT AUTO_INCREMENT,
    id_producto INT NOT NULL,
    id_tienda INT NOT NULL,
    FOREIGN KEY(id_tienda) REFERENCES tiendas(id_tienda),
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
    PRIMARY KEY(id_inventario)
);

CREATE TABLE IF NOT EXISTS clientes (
    id_cliente INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL,
    apellido VARCHAR(30) NOT NULL,
    genero VARCHAR(15) NOT NULL,
    email VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(id_cliente)
);

CREATE TABLE IF NOT EXISTS metodos_pagos (
    id_metodo_pago INT AUTO_INCREMENT,
    name VARCHAR(30) NOT NULL UNIQUE,
    PRIMARY KEY(id_metodo_pago)
);

CREATE TABLE IF NOT EXISTS clientes_pago (
    id_pago INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_metodo_pago INT NOT NULL,
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_metodo_pago) REFERENCES metodos_pagos(id_metodo_pago),
    PRIMARY KEY(id_pago)
);

CREATE TABLE IF NOT EXISTS empleados (
    id_empleado INT AUTO_INCREMENT,
    nombre VARCHAR(40) NOT NULL UNIQUE,
    apellido VARCHAR(40) NOT NULL UNIQUE,
    id_tienda INT NOT NULL,
    puesto_trabajo VARCHAR(50) NOT NULL,
    email VARCHAR(50) NOT NULL,
    telefono VARCHAR(15) NOT NULL,
    FOREIGN KEY(id_tienda) REFERENCES tiendas(id_tienda),
    PRIMARY KEY(id_empleado)
);

CREATE TABLE IF NOT EXISTS registro_ventas (
    id_venta INT AUTO_INCREMENT,
    dia INT NOT NULL,
    mes INT NOT NULL,
    anio INT NOT NULL,
    id_pago INT NOT NULL,
    costo_total DECIMAL(10,2) NOT NULL,
    id_empleado INT NOT NULL,
    id_cantidad INT NOT NULL,
    id_producto INT NOT NULL,
    FOREIGN KEY(id_empleado) REFERENCES empleados(id_empleado),
    FOREIGN KEY(id_pago) REFERENCES clientes_pago(id_pago),
    FOREIGN KEY(id_cantidad) REFERENCES cant_productos(id_cantidad),
    FOREIGN KEY(id_producto) REFERENCES productos(id_productos),
    PRIMARY KEY(id_venta)
);

CREATE TABLE IF NOT EXISTS tickets (
    id_ticket INT AUTO_INCREMENT,
    id_cliente INT NOT NULL,
    id_producto INT NOT NULL,
    id_cantidad INT NOT NULL,
    id_tienda INT NOT NULL,
    PRIMARY KEY(id_ticket),
    FOREIGN KEY(id_cliente) REFERENCES clientes(id_cliente),
    FOREIGN KEY(id_producto) REFERENCES productos(id_producto),
    FOREIGN KEY(id_cantidad) REFERENCES cant_productos(id_cantidad),
    FOREIGN KEY(id_tienda) REFERENCES tiendas(id_tienda)
);

COMMIT;
--se modifican las comillas dobles por las comunas
INSERT INTO `categoria` (`categoria`) VALUES ('carteras');
INSERT INTO `categoria` (`categoria`) VALUES ('uñas');
INSERT INTO `categoria` (`categoria`) VALUES ('guantes');
INSERT INTO `categoria` (`categoria`) VALUES ('bufanda');
INSERT INTO `categoria` (`categoria`) VALUES ('gorras');
INSERT INTO `categoria` (`categoria`) VALUES ('lentes');
INSERT INTO `categoria` (`categoria`) VALUES ('reloj');
INSERT INTO `categoria` (`categoria`) VALUES ('anillos');
INSERT INTO `categoria` (`categoria`) VALUES ('collares');
INSERT INTO `categoria` (`categoria`) VALUES ('pulseras');
INSERT INTO `categoria` (`categoria`) VALUES ('broches');
INSERT INTO `categoria` (`categoria`) VALUES ('vinchas');
INSERT INTO `categoria` (`categoria`) VALUES ('scrunchies');

INSERT INTO `tiendas` (`nombre`, `ubicacion`) VALUES ('Tienda online', 'Plataforma Web');
INSERT INTO `tiendas` (`nombre`, `ubicacion`) VALUES ('Sucursal física EUNOIA', 'Boedo 1749');

INSERT INTO `metodos_pagos` (`name`) VALUES ('Efectivo');
INSERT INTO `metodos_pagos` (`name`) VALUES ('mercado pago');
INSERT INTO `metodos_pagos` (`name`) VALUES ('Tarjeta debito');
INSERT INTO `metodos_pagos` (`name`) VALUES ('Tarjeta credito');
INSERT INTO `metodos_pagos` (`name`) VALUES ('Transferencia');

INSERT INTO `clientes` (`name`, `apellido`, `genero`, `email`) VALUES ('ayelen', 'quispe', 'F', 'ayelenquispe@etec.uba.ar');
INSERT INTO `clientes` (`name`, `apellido`, `genero`, `email`) VALUES ('leonel', 'ordoñez', 'M', 'ordoñezleo@etec.uba.ar');
INSERT INTO `clientes` (`name`, `apellido`, `genero`, `email`) VALUES ('antonela', 'gonzales', 'F', 'antogonzales22@etec.uba.ar');
INSERT INTO `clientes` (`name`, `apellido`, `genero`, `email`) VALUES ('rocio', 'albarracin', 'F', 'ralbarracintrab@etec.uba.ar');

INSERT INTO `empleados` (`nombre`, `apellido`, `id_tienda`, `puesto_trabajo`, `email`, `telefono`) VALUES ('Ariana', 'Villa Medina', 2, 'Cajera', 'ariana@gmail.com', 1123452413);
INSERT INTO `empleados` (`nombre`, `apellido`, `id_tienda`, `puesto_trabajo`, `email`, `telefono`) VALUES ('Ayelen', 'Quispe Aguilar', 2, 'Manager', 'ayelen@gmail.com', 1123452423);
INSERT INTO `empleados` (`nombre`, `apellido`, `id_tienda`, `puesto_trabajo`, `email`, `telefono`) VALUES ('Evelyn', 'Villarreal', 1, 'Manager', 'evelyn@gmail.com', 1123452433);
INSERT INTO `empleados` (`nombre`, `apellido`, `id_tienda`, `puesto_trabajo`, `email`, `telefono`) VALUES ('Rocio', 'Albarracin', 1, 'Diseño visual', 'rocio@gmail.com', 1123452453);

INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche hawaiano celeste', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche hawaiano rosa', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche flor violeta mate', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche rectangular verde mate', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche rectangular amarillo', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Broche flor rojo mate', 11, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Diadema trenza de flor dorada', 12, 2700);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Diadema trenza de flor plateada', 12, 2700);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Diadema con perlas', 12, 2700);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Vincha en trenza tejida color negro', 12, 2900);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Vincha en tela básica color blanco', 12, 2900);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Vincha en tela básica color beige', 12, 2900);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Scrunchie basica lisa', 13, 600);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Scrunchie color liso con perlas', 13, 1000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Scrunchie estampado con perlas', 13, 900);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Scrunchie estampado', 13, 600);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Bolso de cuerina', 1, 17000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Bolso de cuero', 1, 23000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Guantes de lana lisos', 3, 2000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Guantes estampados de lana', 3, 3000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Bufanda lisa', 4, 7000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Bufanda estampada', 4, 7500);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Anillo basico laminado en plata', 8, 6000);
INSERT INTO `productos` (`name`, `id_categoria`, `precio`) VALUES ('Anillo con perla laminado en oro', 8, 6000);

INSERT INTO `registro_productos` (`id_producto`, `id_tienda`) VALUES (4, 1);
INSERT INTO `registro_productos` (`id_producto`, `id_tienda`) VALUES (5, 2);
INSERT INTO `registro_productos` (`id_producto`, `id_tienda`) VALUES (8, 1);
INSERT INTO `registro_productos` (`id_producto`, `id_tienda`) VALUES (6, 1);

INSERT INTO `cant_productos` (`cantidad`) VALUES (2);
INSERT INTO `cant_productos` (`cantidad`) VALUES (2);
INSERT INTO `cant_productos` (`cantidad`) VALUES (3);
INSERT INTO `cant_productos` (`cantidad`) VALUES (2);

INSERT INTO `clientes_pago` (`id_cliente`, `id_metodo_pago`) VALUES (1, 5);
INSERT INTO `clientes_pago` (`id_cliente`, `id_metodo_pago`) VALUES (9, 3);
INSERT INTO `clientes_pago` (`id_cliente`, `id_metodo_pago`) VALUES (5, 1);
INSERT INTO `clientes_pago` (`id_cliente`, `id_metodo_pago`) VALUES (7, 3);

--AGREGAR LOS ID PRODUCTOS FALTANTES VIENDO LO REGISTRADO EN PHPADMIN
INSERT INTO `registro_ventas` (`dia`, `mes`, `anio`, `id_pago`, `costo_total`, `id_empleado`, `id_cantidad`,`id_producto`) VALUES (26, 6, 2025, 1, 6000, 3, 4, 4);
INSERT INTO `registro_ventas` (`dia`, `mes`, `anio`, `id_pago`, `costo_total`, `id_empleado`, `id_cantidad`,`id_producto`) VALUES (26, 6, 2025, 2, 9000, 2, 3, 4);
INSERT INTO `registro_ventas` (`dia`, `mes`, `anio`, `id_pago`, `costo_total`, `id_empleado`, `id_cantidad`,`id_producto`) VALUES (26, 6, 2025, 3, 6000, 3, 2, 4);
INSERT INTO `registro_ventas` (`dia`, `mes`, `anio`, `id_pago`, `costo_total`, `id_empleado`, `id_cantidad`, `id_producto`) VALUES (26, 6, 2025, 4, 3000, 1, 1, 1);

INSERT INTO `tickets` (`id_cliente`, `id_producto`, `id_cantidad`, `id_tienda`, `costo_total`) VALUES (1, 4, 3, 1, 9000);
INSERT INTO `tickets` (`id_cliente`, `id_producto`, `id_cantidad`, `id_tienda`, `costo_total`) VALUES (9, 4, 2, 2, 6000);
INSERT INTO `tickets` (`id_cliente`, `id_producto`, `id_cantidad`, `id_tienda`, `costo_total`) VALUES (5, 4, 3, 1, 9000);
INSERT INTO `tickets` (`id_cliente`, `id_producto`, `id_cantidad`, `id_tienda`, `costo_total`) VALUES (7, 1, 3, 1, 3000);

COMMIT;