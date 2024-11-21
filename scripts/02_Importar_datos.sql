-- Inicia la transacción
BEGIN;

-- Esquema para las tablas auxilareas que ayudan a importar los datos
create schema tmp;

-- tabla para almacenar los datos del archivo cliente.csv 
create table tmp.tmp_cliente (
    cliente_id int,
    nombre_cliente varchar(255),
    email varchar(255),
    telefono varchar(15),
    direccion varchar(255)
);

-- para almacenar los datos del archivo producto.csv
create table tmp.tmp_producto (
    producto_id int,
    nombre_producto varchar(255),
    categoria varchar(255),
    precio_unitario decimal(10,2)
);

-- para almacenar los datos del archivo ventas.csv
create table tmp.tmp_venta (
    venta_id int,
    cliente_id int,
    producto_id int,
    cantidad int,
    fecha_venta date,
    region varchar(50)
);

/* 	Para poblar las tablas auxiliares con los datos de los archivos CSV
	Para efectos de esta entrega, los archivos se han ubicado en C:/ventas_ecommerce/
	Es necesario modificar la ruta en los siguientes queries cuando los archivos 
	están almacenados en otra ubicación
*/
-- importar el archivo clientes.csv
COPY tmp.tmp_cliente(cliente_id, nombre_cliente, email, telefono, direccion)
FROM 'C:/ventas_ecommerce/clientes.csv' DELIMITER ',' CSV HEADER;

-- importar el archivo productos.csv
COPY tmp.tmp_producto(producto_id, nombre_producto, categoria, precio_unitario)
FROM 'C:/ventas_ecommerce/productos.csv' DELIMITER ',' CSV HEADER;

-- importar el archivo ventas.csv
COPY tmp.tmp_venta(venta_id, cliente_id, producto_id, cantidad, fecha_venta, region)
FROM 'C:/ventas_ecommerce/ventas.csv' DELIMITER ',' CSV HEADER;


-- finaliza la transacción
COMMIT;