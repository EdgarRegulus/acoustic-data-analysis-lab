# Análisis acústico de una fuente omnidireccional en cámara anecoica

Este repositorio presenta un **análisis de datos acústicos experimentales** realizado a partir de la caracterización del **patrón de radiación de una fuente sonora omnidireccional dodecaédrica**, utilizando una **cámara anecoica** del Laboratorio de Acústica y Vibraciones del ICAT-UNAM. El proyecto integra mediciones reales, procesamiento numérico y visualización de datos, siguiendo criterios establecidos por las normas **ISO 140-3** e **ISO 3382-2**, y está orientado a mostrar un flujo de trabajo reproducible de análisis de datos científicos.

---

## Objetivo

Caracterizar el patrón de radiación acústica de una fuente omnidireccional mediante mediciones angulares del nivel de presión sonora equivalente (LZeq), evaluar su uniformidad espectral en bandas de 1/3 de octava y verificar el cumplimiento de criterios normativos internacionales.

---

## Metodología

- Mediciones del **nivel de presión sonora equivalente (LZeq)** cada 5° en el plano horizontal, cubriendo 360° (72 posiciones).
- Análisis espectral en **bandas de 1/3 de octava** entre 50 Hz y 5 kHz.
- Cálculo del **nivel promedio global** y promedios por arcos angulares de 30°.
- Obtención del **índice de direccionalidad** y de las desviaciones positivas y negativas por banda de frecuencia.
- Comparación de los resultados con los límites establecidos por las normas **ISO 140-3** e **ISO 3382-2**.

---

## Análisis y resultados

A partir de los datos experimentales se realiza el procesamiento numérico para generar:
- **Diagramas polares** del patrón de radiación para distintas bandas de frecuencia.
- **Espectros de presión sonora** por ángulo de medición.
- Gráficas de desviación que permiten evaluar la omnidireccionalidad de la fuente en función de la frecuencia.

Los resultados muestran un comportamiento cercano al ideal omnidireccional en bajas y medias frecuencias, mientras que en frecuencias altas se observan mayores desviaciones, asociadas a las limitaciones físicas del sistema de emisión.

---

## Herramientas utilizadas

- MATLAB para el procesamiento numérico y la visualización de datos.
- Análisis estadístico de datos experimentales.
- Representaciones gráficas polares y espectrales.

---

## Estructura del repositorio

```text
analisis-acustico-fuente-omnidireccional/
│
├── data/
│   ├── raw/              Datos crudos de las mediciones experimentales
│   └── processed/        Datos procesados para el análisis
│
├── src/                  Scripts de procesamiento y análisis numérico
│
├── notebooks/            Notebooks con el flujo completo de análisis
│
├── figures/              Gráficas finales y visualizaciones
│
├── report/               Reporte académico original (PDF)
```

## Glosario de términos

**LZeq (Nivel de presión sonora equivalente ponderado Z)**  
Es una medida que representa el nivel promedio de energía sonora durante un intervalo de tiempo. La ponderación Z indica una respuesta plana en frecuencia, es decir, no favorece ni atenúa ninguna banda del espectro audible.

**Fuente omnidireccional**  
Es una fuente sonora que idealmente emite la misma cantidad de energía acústica en todas las direcciones del espacio. En la práctica, se evalúa qué tan cercana es una fuente real a este comportamiento ideal.

**Frecuencia**  
Es el número de oscilaciones de una onda sonora por segundo y se mide en hertz (Hz). Está relacionada con la percepción del tono: frecuencias bajas corresponden a sonidos graves y frecuencias altas a sonidos agudos.

**Espectro de frecuencia**  
Es la representación de cómo se distribuye la energía sonora de una señal entre distintas frecuencias. Permite identificar en qué rangos del espectro se concentra mayor o menor energía acústica.

**Bandas de octava**  
Son divisiones del espectro de frecuencias donde el límite superior de una banda es el doble del límite inferior. Se utilizan ampliamente en acústica porque se relacionan bien con la percepción humana del sonido.

**Bandas de 1/3 de octava**  
Son subdivisiones más finas de las bandas de octava, donde cada octava se divide en tres partes iguales en escala logarítmica. Permiten un análisis espectral más detallado y son estándar en mediciones acústicas normativas.

**Diagrama polar**  
Es una representación gráfica que muestra cómo varía una magnitud (en este caso el nivel de presión sonora) en función del ángulo. Se utiliza para visualizar el patrón de radiación o direccionalidad de una fuente sonora.

│
└── README.md              Descripción general del proyecto
