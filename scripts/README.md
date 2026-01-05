# Scripts de procesamiento y análisis

Esta carpeta contiene los **scripts utilizados para el procesamiento, análisis y visualización** de los datos acústicos experimentales. Los archivos aquí incluidos permiten transformar los datos crudos del sonómetro en conjuntos de datos estructurados y generar las gráficas necesarias para evaluar el patrón de radiación de la fuente sonora.

---

## Scripts incluidos

### `extraer.m`

Script encargado del **preprocesamiento y consolidación de los datos**. Su función principal es:

- Leer todos los archivos de medición individuales correspondientes a cada posición angular.
- Apilar las mediciones en un **único conjunto de datos consolidado**.

Este script permite pasar de múltiples archivos crudos a un formato ordenado y listo para el análisis, evitando la manipulación manual de los datos.

---

### `polar_rad_multi.m`

Script dedicado al **análisis y visualización acústica** a partir de los datos procesados del archivo . Sus principales funciones son:

- Generar **espectros sonoros** para cada medición angular.
- Construir **patrones de radiación acústica** en representación polar.
- Calcular y graficar las **desviaciones del nivel de presión sonora** respecto al valor promedio, como función del ángulo y la frecuencia.

Este script es clave para evaluar la **omnidireccionalidad** de la fuente sonora y su comportamiento espectral.

---

## Flujo de trabajo recomendado

1. Ejecutar `extraer.m` utilizando los datos contenidos en la carpeta `raw/`.
2. Verificar y guardar los datos consolidados en la carpeta `processed/`.
3. Ejecutar `polar_rad_multi.m` para generar las visualizaciones y resultados finales.

---

## Notas de uso

- Los scripts están escritos en **MATLAB**.
- Se asume que la estructura de carpetas del repositorio se mantiene sin cambios.
- Para asegurar reproducibilidad, se recomienda no modificar los datos crudos directamente.

---

## Relación con otras carpetas

- `data/raw/` → Datos crudos del sonómetro  
- `data/processed/` → Datos limpios y consolidados  
- `figuras/` → Gráficas y resultados finales  
- `notebooks/` → Análisis y documentación complementaria
