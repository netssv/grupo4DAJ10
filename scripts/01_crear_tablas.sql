-- creamos la base de datos ejecutar primero esta linea para evitar 
--cannot run inside a transaction block
create database ventas_ecommerce;

-- Inicia la transacción
BEGIN;

-- tabla cliente: almacena la información de los clientes
create table cliente (
    cliente_id int primary key,
    nombre_cliente varchar(255) not null,
    email varchar(255),
    telefono varchar(15),
    direccion varchar(255)
);

-- tabla categoria: almacena las categorías de los productos
create table categoria (
    categoria_id serial primary key,
    nombre_categoria varchar(255) not null
);

-- tabla producto: almacena el catálogo de productos de la tienda
create table producto (
    producto_id int primary key,
    nombre_producto varchar(255) not null,
    categoria_id int,
    precio_unitario decimal(10, 2) not null,
    foreign key (categoria_id) references categoria(categoria_id)
);

-- tabla region: almacena las regiones donde se realizan las ventas
create table region (
    region_id serial primary key,
    nombre_region varchar(50) not null
);

-- tabla venta: almacena las ventas realizadas
create table venta (
    venta_id int primary key,
    cliente_id int not null,
	producto_id int not null,
	categoria_id int not null,
	region_id int not null,
    fecha_venta date not null,
    foreign key (cliente_id) references cliente(cliente_id),
    foreign key (producto_id) references producto(producto_id),
	foreign key (categoria_id) references categoria(categoria_id),
    foreign key (region_id) references region(region_id)
);

-- tabla venta_detalle: almacena los detalles de cada venta
create table venta_detalle (
    detalle_id serial primary key,
    venta_id int not null,
    producto_id int not null,
    cantidad int not null,
    precio_unitario_venta decimal(10,2) not null,
	total decimal(10,2) not null,
    foreign key (venta_id) references venta(venta_id),
    foreign key (producto_id) references producto(producto_id)
);

-- Finaliza la transación
COMMIT;
