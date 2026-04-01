# databricks-pipeline-estudiantes

Descripción del Proyecto
Este proyecto implementa un pipeline completo de datos en Databricks Community Edition, siguiendo la arquitectura Medallion (Landing → Bronze → Silver → Gold).
El objetivo es procesar tres archivos CSV relacionados con datos académicos (estudiantes, materias y matrículas) de forma incremental, con trazabilidad, limpieza, joins analíticos y un dashboard de monitoreo basado en logs y metadatos.

El proyecto está diseñado para demostrar buenas prácticas de ingeniería de datos incluso en un entorno limitado como Databricks CE.

# 🏗️  Arquitectura General
    Flujo del pipeline:
    
    Landing → Ingesta incremental desde CSV
    
    Bronze → Estructuración y aplicación de esquema
    
    Silver → Limpieza, validación y transformación
    
    Gold → Joins analíticos entre las tres tablas
    
    Logs & Metadatos → Auditoría y trazabilidad
    
    Dashboard → Monitoreo del pipeline en Databricks
    
    Landing Layer — Ingesta Incremental
    Carga los CSV originales.
    
    Añade dos columnas clave:
    
    id_ingestion (consecutivo)
    
    timestamp_ingestion
    
    Permite detectar nuevos registros sin reprocesar datos antiguos.
    
    Actúa como punto de entrada controlado y trazable.

# 🟫 Bronze Layer — Datos Estructurados
Aplica un esquema definido para cada tabla.

Convierte tipos de datos.

Mantiene los datos “raw estructurados”.

Procesamiento incremental basado en id_ingestion.

# 🥈 Silver Layer — Limpieza y Transformación
Limpieza de texto (trim).

Normalización de valores (booleanos, categorías).

Validaciones de calidad (rango de edad, valores válidos).

Procesamiento incremental para evitar reprocesar datos ya limpios.

# 🥇 Gold Layer — Datos Curados y Analíticos
Unión de las tres tablas Silver:

Students

Enrollments

Subjects

Genera una tabla final analítica lista para dashboards y reporting.



# 📊 Logs y Metadatos
Cada job del pipeline registra:

Estado (SUCCESS / ERROR)

Filas procesadas

Último id_ingestion

Tiempos de inicio y fin

Mensajes de ejecución

Esto permite tener trazabilidad completa y detectar problemas rápidamente.

Tablas generadas:

logs_job

meta_jobs
