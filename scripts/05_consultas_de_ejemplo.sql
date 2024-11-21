-- ventas totales por categoría de producto
select c.nombre_categoria as "Categoría de producto", sum(vd.total) AS ventas_totales
from venta_detalle vd
join producto p on vd.producto_id = p.producto_id
join categoria c on p.categoria_id = c.categoria_id
group by c.nombre_categoria
order by ventas_totales desc;

-- clientes con mayor valor de compra
select c.nombre_cliente, c.email, c.telefono, c.direccion,
    sum(vd.total) as valor_total_compra
from cliente c
join venta v on c.cliente_id = v.cliente_id
join venta_detalle vd on v.venta_id = vd.venta_id
group by c.cliente_id, c.nombre_cliente, c.email, c.telefono, c.direccion
order by valor_total_compra desc;

-- productos más vendidos por región
select r.nombre_region, p.nombre_producto, sum(vd.cantidad) as cantidad_total_vendida
from venta_detalle vd
join venta v on vd.venta_id = v.venta_id
join producto p on vd.producto_id = p.producto_id
join region r on v.region_id = r.region_id
group by r.nombre_region, p.nombre_producto
order by r.nombre_region, cantidad_total_vendida desc;
