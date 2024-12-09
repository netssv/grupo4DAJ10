# Proyecto de Gestión de Datos Transaccionales

## 🎯 Descripción del Proyecto

Sistema integral de gestión de datos transaccionales desarrollado con PostgreSQL, Python y Power BI, diseñado para analizar y procesar información de ventas, clientes, productos y regiones. El proyecto implementa un modelo de datos Snowflake que permite realizar análisis detallados y obtener insights empresariales.

## 🛠 Tecnologías y Herramientas

- **Base de Datos**: PostgreSQL 16+ 
- **Lenguaje**: SQL, Python
- **Herramientas de Apoyo**: 
  - pgAdmin
  - Visual Studio Code
  - Jupyter Notebook
  - Power BI Desktop
  - Git
  - Lucidchart

## 📋 Requisitos Previos

### Infraestructura Técnica
- PostgreSQL 16+ instalado
- Python 3.9+
- Power BI Desktop
- Mínimo 16GB RAM
- 20GB de espacio en disco
- Permisos de administrador/superusuario en la base de datos

### Archivos Requeridos
Ubicación recomendada: `c:/ventas_ecommerce/`
- `clientes.csv` (UTF-8, delimitado por comas)
- `productos.csv` (UTF-8, delimitado por comas)
- `ventas.csv` (UTF-8, delimitado por comas)
- Carpeta `scripts/` con archivos SQL
- Carpeta `notebooks/` con análisis de Python

## 🔧 Configuración del Entorno

### 1. Preparación del Entorno de Base de Datos

#### Pasos de Instalación para Windows
1. Descargar PostgreSQL 16.1 desde [postgresql.org](https://www.postgresql.org/download/windows/)
2. Ejecutar el instalador con opciones predeterminadas
3. Anotar la contraseña del usuario postgres
4. Verificar instalación:
```bash
psql --version
```

#### Pasos de Instalación para Ubuntu
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
-- Crear base de datos
CREATE DATABASE ventas_ecommerce;

-- Crear usuario dedicado (opcional pero recomendado)
CREATE USER usuario_proyecto WITH PASSWORD 'contraseña_segura';
GRANT ALL PRIVILEGES ON DATABASE ventas_ecommerce TO usuario_proyecto;
```

### 2. Configuración del Entorno de Python

#### Instalación de Dependencias
```bash
# Crear entorno virtual (opcional pero recomendado)
python -m venv ventas_env
source ventas_env/bin/activate  # En Windows: ventas_env\Scripts\activate

# Instalar librerías necesarias
pip install pandas numpy matplotlib seaborn jupyter psycopg2 sqlalchemy
```

### 3. Estructura de Directorios Recomendada
```
c:/ventas_ecommerce/
│
├──docs/
│   ├── 01_consultas_de_prueba.pdf
│   ├── 02_Informe_ventas_e_commerce.pdf
│
├── scripts/
│   ├── 01_crear_tablas.sql
│   ├── 02_importar_datos.sql
│   ├── 03_validacion_de_datos.sql
│   ├── 04_traslado_datos_a_tablas_modelo.sql
│   └── 05_consultas_de_ejemplo.sql
│
├── notebooks/
│   └── 01_analisis_exploratorio.ipynb
│   
│
├── powerbi/
│   └── dashboard_ventas.pbix
│
├── README.md
├── clientes.csv
├── productos.csv
└── ventas.csv
```

## 📦 Esquema de Base de Datos

### Tablas Principales
1. `cliente`: Información de clientes
2. `categoria`: Categorías de productos
3. `producto`: Detalles de productos
4. `region`: Regiones de ventas
5. `venta`: Transacciones de ventas (tabla de hechos)
6. `venta_detalle`: Detalles de ventas

### Modelo Snowflake
- Reducción de redundancia
- Preparación para escalabilidad
- Normalización hasta 3FN

## 🚀 Implementación

### 1. Clonar Repositorio
```bash
git clone https://github.com/netssv/grupo4DAJ10
cd ventas_ecommerce
```

### 2. Configurar Archivos CSV
- Ubicar archivos en `c:/ventas_ecommerce/datos/`
- Verificar formato: 
  - Delimitador: Coma (,)
  - Encabezados: Sí
  - Codificación: UTF-8

### 3. Ejecutar Scripts SQL
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

### 4. Análisis de Datos con Python

#### Ejecutar Jupyter Notebook
```bash
# Iniciar Jupyter Notebook
jupyter notebook notebooks/01_analisis_exploratorio.ipynb
```

### 5. Configuración de Power BI
1. Abrir Power BI Desktop
2. Conectar a la base de datos PostgreSQL
3. Cargar datos desde las tablas creadas
4. Crear medidas DAX
5. Desarrollar visualizaciones en `powerbi/dashboard_ventas.pbix`

## 📊 Análisis de Datos

### Métricas Analizadas
- Cantidad total de ventas
- Monto total de ventas
- Ventas por región
- Ventas por categoría

### Visualizaciones Generadas
- Ventas totales por mes y año
- Análisis trimestral de ventas
- Ranking de productos
- Segmentación de clientes

## 🔍 Validaciones de Datos

- Valores nulos
- Identificadores únicos
- Dependencias
- Consistencia de datos

## 🛡️ Buenas Prácticas

- Uso de transacciones SQL
- Scripts parametrizables
- Validación de datos
- Uso de snake_case
- Normalización de datos
- Control de errores

## 👥 Equipo de Desarrollo

| Nombre            | Rol                | Correo                  | Carnet    |
|------------------|---------------------|------------------------|-----------|
| Barrientos Sandra| Líder de Datos      | sgbarrientos[at]gmail.com | k00002692 |
| Herrera Elizabeth| Analista de Datos   | e.libe59[at]gmail.com  | K00002712 |
| Martel Rodrigo   | Desarrollador       | rop.martel[at]gmail.com| k00002721 |
| Rivera Edwin     | Documentación       | edigrica[at]gmail.com  | k00002715 |

## 🆘 Soporte y Contribución

1. Fork del repositorio
2. Crear rama de feature (`git checkout -b feature/mejora`)
3. Commit de cambios (`git commit -m 'Añadir mejora'`)
4. Push a la rama (`git push origin feature/mejora`)
5. Abrir Pull Request

## 📄 Licencia
Proyecto bajo Licencia MIT

## 🔗 Referencias
- Documentación PostgreSQL
- Guías de mejores prácticas SQL
- Documentación Pandas
- Power BI Documentation

---
**Nota**: Segunda entrega del proyecto.

Fecha de Creacion: 21 de noviembre de 2024