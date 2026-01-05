# Datos crudos de las mediciones acústicas

Esta carpeta contiene los **datos crudos** obtenidos directamente del sonómetro durante las mediciones experimentales realizadas en cámara anecoica. Cada archivo corresponde a una **medición angular específica**, asociada a una orientación definida de la fuente sonora omnidireccional respecto al punto de medición.

Los archivos se conservan **sin procesamiento ni filtrado previo**, tal como fueron exportados por el instrumento de medición, con el objetivo de preservar la integridad de la información original y permitir la reproducibilidad del análisis.

---

## Contenido de los archivos

Los datos incluyen múltiples parámetros acústicos, temporales, energéticos, espectrales y ambientales, generados automáticamente por el sonómetro conforme a su configuración de medición. La estructura y nomenclatura de las columnas corresponden al **formato estándar de salida del instrumento**, sin modificaciones manuales.

---

## Variable de interés: LZeq

Aunque los archivos contienen una gran cantidad de variables, **en este proyecto únicamente se utiliza el valor de LZeq (nivel de presión sonora equivalente ponderado Z)** para cada medición angular.

Esta elección se debe a que:

- La ponderación **Z** presenta una **respuesta plana en frecuencia**, lo que permite analizar la energía acústica sin introducir sesgos asociados a ponderaciones psicoacústicas.
- El **LZeq** representa un valor energético promedio en un intervalo de tiempo, adecuado para comparar niveles de presión sonora entre distintas direcciones angulares.
- Es la magnitud requerida para la **evaluación del patrón de radiación** y la comparación con criterios normativos de omnidireccionalidad.

El resto de las variables se conserva con fines de trazabilidad, verificación y posibles análisis complementarios, pero **no interviene en el procesamiento principal**.

---

## Organización de las mediciones

- Cada carpeta representa una **posición angular distinta** de la fuente sonora en pasos de 5° (Medicion001 corresponde a la posición angular inicial 0°).
- Los nombres de archivos y carpetas reflejan la identificación de la medición tal como fue registrada en el equipo.
- No se han eliminado columnas ni registros, aun cuando algunos no sean utilizados en el análisis final.

---

## Uso recomendado

Estos datos deben considerarse como **fuente primaria** del análisis.

⚠️ **Nota:** No se recomienda modificar directamente estos archivos.  
Cualquier limpieza, selección de variables o transformación debe realizarse sobre copias almacenadas en la carpeta `data/processed/`.

---

## Origen de los datos

Datos adquiridos mediante instrumentación acústica profesional durante mediciones experimentales controladas en cámara anecoica, como parte de un proyecto académico de análisis acústico y tratamiento de datos científicos.
