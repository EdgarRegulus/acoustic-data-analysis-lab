# Figuras y visualizaciones

Esta carpeta contiene las **figuras y visualizaciones resultantes del análisis de los datos acústicos procesados**. Las gráficas aquí almacenadas permiten interpretar de manera visual el comportamiento de la fuente sonora omnidireccional y evaluar su desempeño conforme a criterios de uniformidad angular y espectral.

Las figuras se organizan en subcarpetas de acuerdo con el **tipo de representación gráfica**, lo que facilita su consulta y su relación con las distintas etapas del análisis.

---

## Organización de las figuras

### `histogram/`

Esta subcarpeta contiene **histogramas del nivel de presión sonora equivalente (LZeq)** obtenidos a partir de todas las mediciones angulares.

Los histogramas permiten:
- Analizar la **distribución espectral** de los valores de LZeq.
- Detectar posibles asimetrías o valores atípicos en el conjunto de mediciones.

Estas figuras son útiles para evaluar la **consistencia global** de la fuente sonora y el grado de variabilidad entre distintas direcciones.

---

### `polar/`

En esta subcarpeta se incluyen los **diagramas polares del patrón de radiación acústica** de la fuente sonora, construidos a partir de los valores de LZeq asociados a cada ángulo de medición.

Los diagramas polares permiten:
- Visualizar directamente la **direccionalidad** de la fuente sonora.
- Comparar el comportamiento angular en distintas bandas de frecuencia.
- Evaluar qué tan cercano es el patrón observado al comportamiento omnidireccional ideal.

Estas representaciones son fundamentales para el análisis del patrón de radiación.

---

### `desviacion/`

Esta subcarpeta contiene **gráficas de desviación del nivel de presión sonora** respecto al valor promedio global, como función del ángulo y, en algunos casos, de la frecuencia.

Las gráficas de desviación permiten:
- Cuantificar las **variaciones angulares** del nivel de presión sonora.
- Comparar los resultados con los **criterios normativos** de omnidireccionalidad.

Este tipo de visualización facilita una evaluación objetiva del desempeño acústico de la fuente.

---

## Relación con el análisis

Las figuras almacenadas en esta carpeta fueron generadas a partir de los **datos procesados** contenidos en la carpeta `processed/`, utilizando los scripts disponibles en la carpeta `src/`. En particular, la generación de estas visualizaciones se apoya en el script `polar_rad_multi.m`.

---

## Uso recomendado

- Utilizar estas figuras como **apoyo visual** para la interpretación de resultados.
- Consultarlas junto con el reporte final en PDF para comprender el análisis completo.
- No modificar manualmente las figuras; cualquier cambio debe realizarse a partir del reprocesamiento de los datos.

