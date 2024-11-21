-- inicia la transacción
BEGIN;

-- poblado de tabla cliente a partir de tmp.tmp_cliente
insert into cliente (cliente_id, nombre_cliente, email, telefono, direccion)
select cliente_id, nombre_cliente, email, telefono, direccion
from tmp.tmp_cliente;

-- alimenta el catálogo de categorías a partir de tmp.tmp_producto
insert into categoria (nombre_categoria)
select distinct categoria from tmp.tmp_producto;

-- poblado de tabla producto a partir de tmp.producto
insert into producto(producto_id, nombre_producto, categoria_id, precio_unitario)
select p.producto_id, p.nombre_producto, c.categoria_id, p.precio_unitario
from tmp.tmp_producto p
join categoria c on p.categoria = c.nombre_categoria;

insert into region (nombre_region)
select distinct region from tmp.tmp_venta;

insert into venta (venta_id, cliente_id, producto_id, categoria_id,  region_id, fecha_venta)
select distinct v.venta_id, v.cliente_id, v.producto_id, p.categoria_id, r.region_id, v.fecha_venta
from tmp.tmp_venta v 
join producto p on v.producto_id = p.producto_id
join region r on v.region = r.nombre_region;

insert into venta_detalle (venta_id, producto_id, cantidad, precio_unitario_venta, total)
select v.venta_id, v.producto_id, v.cantidad, p.precio_unitario, v.cantidad * p.precio_unitario
from tmp.tmp_venta v
join producto p on v.producto_id = p.producto_id;

-- finaliza la transacción
COMMIT;