# Datos procesados y limpios

Esta carpeta contiene los **datos limpios y organizados** derivados de los archivos crudos de medición acústica. A partir de los datos originales del sonómetro, se realizó un proceso de consolidación y selección de variables para facilitar el análisis del patrón de radiación de la fuente sonora.

---

## Proceso de limpieza y consolidación

Los datos fueron procesados mediante el script **`extraer.m`**, el cual realiza las siguientes tareas:

- Apila todos los archivos de medición individual correspondientes a cada posición angular en un **único archivo consolidado** (med_29_mayo_2025_extract)
- De este archivo de extrae exclusivamente la variable **LZeq**, que es la magnitud de interés para el análisis del patrón de radiación.
- Organiza los valores de LZeq de acuerdo con su **posición angular** y *frecuencia*, preservando la correspondencia entre medición y orientación.

## Contenido de la carpeta

- Archivo(s) de datos consolidados con valores de **LZeq** por ángulo.
- Archivos intermedios generados durante el procesamiento.

## Uso recomendado

Los archivos contenidos en esta carpeta están pensados para:
- Servir como **entrada directa** a los scripts de análisis.
- Facilitar la reproducibilidad del procesamiento de datos.
- Evitar la manipulación directa de los datos crudos.


## Relación con otras carpetas

- `raw/` → Datos crudos del sonómetro  
- `processed/` → Datos limpios y consolidados (esta carpeta)  
- `scripts/` → Scripts de procesamiento y análisis  
