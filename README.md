# RetailPro — Análisis de Datos Comerciales

## Descripción del proyecto

RetailPro es un proyecto de análisis de datos comerciales centrado en la información de ventas de una empresa de productos tecnológicos. Utiliza consultas SQL para explorar el rendimiento de las ventas (facturación, ticket y ticket promedio), analizar productos y clientes a fin de identificar tendencias y obtener indicadores que ayuden a comprender el negocio. El repositorio también incluye un archivo de Power BI para el análisis y la visualización de datos.

## Objetivos

- Analizar la facturación y la evolución mensual de las ventas.
- Calcular indicadores como cantidad de pedidos y ticket promedio.
- Evaluar cantidad de unidades vendidas por ticket y por cliente.
- Identificar productos destacados según unidades vendidas e ingresos.
- Analizar el comportamiento de compra y la recurrencia de los clientes.
- Relacionar información de distintas tablas mediante consultas SQL.
- Detectar clientes o productos sin ventas registradas.
- Complementar el análisis con visualizaciones en Power BI.

## Herramientas y tecnologías

- **SQL / T-SQL:** consultas, agregaciones, subconsultas, CTE y combinaciones de tablas (`JOIN` y `LEFT JOIN`).
- **Microsoft SQL Server:** motor de base de datos previsto para ejecutar los scripts.
- **SQL Server Management Studio (SSMS):** cliente recomendado para conectarse a SQL Server y ejecutar consultas.
- **Power BI Desktop:** apertura y exploración del archivo `.pbix`.
- **Git y GitHub:** control de versiones y alojamiento del proyecto.
- **Google Gemini:** apoyo en la revisión del código y exploración de posibles insights.

## Contenido del repositorio

| Archivo | Descripción |
|---|---|
| `ventas_tech_db.sql` | Script relacionado con la base de datos `Ventas_Tech_DB`. Revisar su contenido para confirmar las operaciones de creación y carga que realiza. |
| `m4_consultas_negocio.sql` | Consultas de análisis comercial, como facturación mensual, rendimiento de productos y clientes recurrentes. |
| `m5_consultas_joins.sql` | Consultas que relacionan tablas de ventas, clientes, productos y categorías, e identifican registros sin ventas. |
| `Vidal_Fernando_Checkpoint2.pbix` | Archivo de Power BI asociado al proyecto. |

## Requisitos previos

1. Una instancia de Microsoft SQL Server.
2. SQL Server Management Studio (SSMS) u otro cliente compatible.
3. Los archivos SQL descargados del repositorio.
4. Power BI Desktop, si se desea abrir el archivo `.pbix`.

## Cómo ejecutar los scripts SQL

### 1. Descargar el repositorio

Desde una terminal, ejecutá:

```bash
git clone https://github.com/vidalferg992/Fernando-Vidal.git
cd Fernando-Vidal
```

También podés descargar los archivos directamente desde GitHub.

### 2. Conectarse a SQL Server

Abrí SSMS y conectate a la instancia de SQL Server que vayas a utilizar.

### 3. Preparar la base de datos

Abrí `ventas_tech_db.sql` en SSMS y revisá las instrucciones del archivo. Ejecutalo para preparar la base de datos y los objetos que defina. Si el script presupone que la base de datos ya existe, creala o seleccioná la base correspondiente antes de continuar.

### 4. Ejecutar las consultas de negocio

Abrí `m4_consultas_negocio.sql`, seleccioná la base de datos correcta y ejecutá las consultas para analizar la facturación, los productos y los clientes.

### 5. Ejecutar las consultas con JOIN

Abrí `m5_consultas_joins.sql` sobre la misma base de datos. Este archivo contiene consultas que combinan información de varias tablas. Antes de ejecutarlo, revisá si incluye sentencias que crean o modifican objetos o datos (`CREATE`, `ALTER`, `INSERT`, `UPDATE` o `DELETE`), para evitar repetir cambios no deseados.

**Importante:** los scripts deben ejecutarse en el orden que indiquen sus dependencias. Los nombres y el orden descritos aquí se basan en los archivos del repositorio; verificá las instrucciones dentro de cada script antes de ejecutarlo.

## Abrir el archivo de Power BI

Abrí `Vidal_Fernando_Checkpoint2.pbix` con Power BI Desktop. Si el archivo solicita acceso a una fuente de datos, configurá la conexión correspondiente y actualizá los datos según sea necesario.

## Resultados esperados

RetailPro permite explorar el rendimiento comercial mediante indicadores de ventas, rankings de productos y análisis de clientes. Estas consultas ofrecen una base para comprender los resultados del negocio y apoyar la toma de decisiones.

## Autor

**Fernando Vidal**

Proyecto académico de análisis de datos comerciales, SQL y visualización con Power BI.
