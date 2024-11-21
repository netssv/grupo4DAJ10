-- cantidad de clientes subidos
select count(1) from tmp.tmp_cliente;

-- vista rápida de registros subidos
select * from tmp.tmp_cliente limit 10;

-- revisa si los datos de los clientes están incompletos
select * from tmp.tmp_cliente where cliente_id is null or nombre_cliente is null;

-- revisa si hay cliente_id repetidos
select cliente_id, count(1) as cantidad from tmp.tmp_cliente
group by cliente_id
having count(1) > 1;

-- cantidad de productos subidos
select count(1) from tmp.tmp_producto;

-- vista rápida de registros subidos
select * from tmp.tmp_producto limit 10;

-- revisa si hay precios negativos
select * from tmp.tmp_producto where precio_unitario<0;

-- revisa si los datos de los productos están incompletos
select * from tmp.tmp_producto 
where producto_id is null or nombre_producto is null or categoria is null or precio_unitario is null;

-- revisa si hay producto_id repetidos
select producto_id, count(1) as cantidad from tmp.tmp_producto
group by producto_id
having count(1) > 1;

-- cantidad de registros subidos
select count(1) from tmp.tmp_venta;

-- vista rápida de registros subidos
select * from tmp.tmp_venta limit 10;

-- revisa si los datos de las ventas están incompletos
select * from tmp.tmp_venta 
where venta_id is null or cliente_id  is null or producto_id  is null or cantidad is null 
or fecha_venta is null or region is null;

-- revisa si hay clientes que aparezcan en las ventas que no existan como clientes
select v.venta_id, v.cliente_id
from tmp.tmp_venta v
left join tmp.tmp_cliente c on v.cliente_id = c.cliente_id
where c.cliente_id is null;

-- revisa si hay productos que aparezcan en las ventas que no existan como productos
select v.venta_id, v.producto_id
from tmp.tmp_venta v
left join tmp.tmp_producto p on v.producto_id = p.producto_id
where p.producto_id is null;
