# Proyecto de Gestión de Datos Transaccionales

## 🎯 Descripción del Proyecto

Sistema integral de gestión de datos transaccionales desarrollado con PostgreSQL, diseñado para analizar y procesar información de ventas, clientes, productos y regiones. El proyecto implementa un modelo de datos robusto que permite realizar análisis detallados y obtener insights empresariales.

## 🛠 Tecnologías y Herramientas

- **Base de Datos**: PostgreSQL 16+ 
- **Lenguaje**: SQL
- **Herramientas de Apoyo**: 
  - pgAdmin
  - Visual studio 
  - Herramientas colaborativas en la nube
  - Lucidchart

## 📋 Requisitos Previos

### Infraestructura Técnica
- PostgreSQL instalado (versión 16 o superior)
- Mínimo 8GB RAM
- 10GB de espacio en disco
- Permisos de administrador/superusuario en la base de datos

### Archivos Requeridos
Ubicación recomendada: `c:/ventas_ecommerce/`
- `clientes.csv` (UTF-8, delimitado por comas)
- `productos.csv` (UTF-8, delimitado por comas)
- `ventas.csv` (UTF-8, delimitado por comas)
- Carpeta `scripts/` con archivos SQL

## 🔧 Configuración del Entorno

### 1. Preparación del Entorno de Base de Datos

#### Pasos de Instalación
#### Windows
1. Descargar PostgreSQL 16.1 desde [postgresql.org](https://www.postgresql.org/download/windows/)
2. Ejecutar el instalador con opciones predeterminadas
3. Anotar la contraseña del usuario postgres
4. Verificar instalación:
```bash
psql --version
```

#### Ubuntu
```bash
# Actualizar repositorios
sudo apt update

# Instalar PostgreSQL
sudo apt install postgresql-16 postgresql-contrib-16

# Verificar instalación
psql --version
```


#### Creación de Base de Datos
```sql
Ejemplo del script 01_crear_tablas.sql
-- Crear base de datos
CREATE DATABASE ventas_ecommerce;

-- Crear usuario dedicado (opcional pero recomendado)
CREATE USER usuario_proyecto WITH PASSWORD 'contraseña_segura';
GRANT ALL PRIVILEGES ON DATABASE ventas_ecommerce TO usuario_proyecto;
```

### 2. Estructura de Directorios Recomendada
```
c:/ventas_ecommerce/
│
├─── clientes.csv
├─── productos.csv
├─── ventas.csv
│
├── scripts/
│   ├── 01_crear_tablas.sql
│   ├── 02_importar_datos.sql
│   └── 03_validacion_de_datos.sql
│   └── 04_traslado_datos_a_tablas_modelo.sql
│   └── 05_consultas_de_ejemplo.sql
│
└── README.md
```

## 📦 Esquema de Base de Datos

### Tablas Principales
1. `cliente`: Información de clientes
2. `categoria`: Categorías de productos
3. `producto`: Detalles de productos
4. `region`: Regiones de ventas
5. `venta`: Transacciones de ventas (tabla de hechos)
6. `venta_detalle`: Detalles de ventas

### Diagrama Entidad-Relación
##### Modelo SNOWFLAKE
Primera versión del modelo de datos que implementa:
- Reducción de redundancia
- Preparación para escalabilidad

Optimizando la base de datos , donde las tablas se normalizan para reducir la redundancia y permite la escalabilidad de acuerdo a los intereses del negocio.
![Diagrama ER](https://raw.githubusercontent.com/netssv/grupo4DAJ10/refs/heads/main/diagrama_er.jpeg)
## 🚀 Implementación

### Pasos de Instalación

1. Clonar Repositorio
```bash
git clone https://github.com/netssv/grupo4DAJ10
cd ventas_ecommerce
```

2. Configurar Archivos CSV
- Ubicar archivos en `c:/ventas_ecommerce/` (recomendado)
- Verificar formato: 
  - Delimitador: Coma (,)
  - Encabezados: Sí
  - Codificación: UTF-8

3. Ejecutar Scripts SQL
```bash
# Crear tablas
\i scripts/01_crear_tablas.sql

# Importar datos
\i scripts/02_importar_datos.sql

# Validar datos
\i scripts/03_validacion_de_datos.sql

# Crear modelo Snowflake
\i scripts/04_traslado_datos_a_tablas_modelo.sql

# Consultas de ejemplo
\i scripts/05_consultas_de_ejemplo.sql
```

## 🔍 Validaciones de Datos

El proyecto incluye scripts de validación que comprueban:
- Valores nulos
- Identificadores únicos
- Dependencias
- Consistencia de datos

## 🛡️ Buenas Prácticas

- Uso de transacciones SQL
- Scripts parametrizables
- Validación de datos
- Uso de snake_case
- Normalización de la data
- Control de errores

## 📊 Consultas de Ejemplo

```sql
-- ventas totales por categoría de producto
select c.nombre_categoria as "Categoría de producto", sum(vd.total) AS ventas_totales
from venta_detalle vd
join producto p on vd.producto_id = p.producto_id
join categoria c on p.categoria_id = c.categoria_id
group by c.nombre_categoria
order by ventas_totales desc;
```

## 🔒 Seguridad

- Credenciales protegidas.
- Principio de mínimo privilegio.
- Conexiones seguras.
- Logs de auditoría en GitHub.
- 

## 👥 Contribución

1. Fork del repositorio
2. Crear rama de feature (`git checkout -b feature/mejora`)
3. Commit de cambios (`git commit -m 'Añadir mejora'`)
4. Push a la rama (`git push origin feature/mejora`)
5. Abrir Pull Request

## 📝 Autores

| Nombre            | Correo                    |Carnet   | 
|-------------------|---------------------------|---------|
| Barrientos Sandra | sgbarrientos[at]gmail.com    |k00002692|
| Herrera Elizabeth | e.libe59[at]gmail.com        |K00002712|
| Martel Rodrigo    | rop.martel[at]gmail.com      |k00002721|
| Rivera Edwin      | edigrica[at]gmail.com        |k00002715|

##### Fecha de creación: Jueves 21 de noviembre de 2024

## 📄 Licencia

Proyecto bajo licencia MIT

## 🆘 Soporte

Para dudas o problemas:
- Abrir un Issue en GitHub
- Contactar al mantenedor del proyecto

## 🔗 Referencias
- Documentación PostgreSQL
- Guías de mejores prácticas de SQL
- Recursos de modelado de datos
