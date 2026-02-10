# Product Revenue Drivers Analysis  
**SQL & Power BI | Business-Oriented Data Analysis**

---
## =========================

## English Version

## =========================
---

## Project Overview

This project analyzes transactional sales data to identify the **key drivers of revenue performance** across products and categories.  
The primary objective is to understand whether revenue is driven mainly by **pricing strategies, sales volume, or product mix**, and to translate those findings into **actionable business recommendations**.

The analysis was conducted using **SQL for data validation and transformation** and **Power BI for exploratory analysis and visualization**.

---

## Data Source

The dataset used in this project comes from a public retail sales dataset available on Kaggle.

Source:  
https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset

The dataset contains transactional sales data including products, categories, cities, countries, customers, employees, and sales.

---

## Business Problem

The business needs to determine if financial performance is being propelled by **sales volume** or **pricing strategy**.  

Key questions include:
- Is revenue driven more by **price** or **sales volume**?
- Do **higher-priced products or categories** generate more revenue?
- Are **discounts** effectively increasing sales volume?
- How should pricing and promotional strategies be adjusted to improve profitability?

---

## Dataset Description

The dataset consists of retail transactional data including:
- Sales transactions
- Products and categories
- Prices, quantities, and discounts
- Sales dates and customers

**Note:**  
Raw datasets and Power BI files are not included in this repository due to GitHub file size limitations.  
The full analytical logic is documented through SQL scripts, insights, and dashboard screenshots.

---

## Analytical Approach

### 1. Data Validation & Preparation (SQL)
- Verified table relationships and data integrity
- Identified zero-price products and validated they were not data errors
- Calculated **real revenue** using:
  - Unit price
  - Quantity sold
  - Applied discounts
- Avoided reliance on unreliable pre-calculated revenue fields

### 2. Exploratory Analysis
- Aggregated revenue and units sold by category and product
- Compared pricing versus volume performance
- Evaluated the impact of discounts on revenue and volume

### 3. Visualization (Power BI)
- KPI cards for revenue and units sold
- Revenue distribution by category
- Pricing vs volume scatter analysis
- Top-performing products analysis

---

## Key Insights

### 1. Revenue Is Primarily Driven by Sales Volume at the Category Level
- Categories operate within a narrow price range
- Revenue differences are explained mainly by units sold

### 2. Higher-Priced Categories Underperform in Total Revenue
- Premium pricing does not compensate for lower demand
- Lower-priced categories outperform due to higher volume

### 3. Zero-Price Products Act as Strategic Volume Drivers
- High unit sales with little or no revenue contribution
- Likely used as promotional or loss-leader products

### 4. Pricing Explains Revenue Differences Among Top Products
- Volume stabilizes among top products
- Revenue differences are driven by price variation

### 5. Discounts Reduce Revenue Without Increasing Volume
- Discounts lower effective revenue per unit
- No significant uplift in sales volume observed

---

## Dashboard Preview

The final Power BI dashboard summarizes the analysis and insights visually.

**Included visualizations:**
- Revenue and units sold KPIs
- Revenue by category
- Pricing vs volume scatter plot
- Top product performance

See screenshots in the `visualizations/` folder.

---

## Business Recommendations

- Focus growth strategies on **high-volume categories**
- Reevaluate pricing for **premium categories** to address demand elasticity
- Use **zero-price products** strategically as traffic drivers
- Optimize pricing at the **product level** for top performers
- Review discount policies to **protect margins**

Detailed recommendations are available in the `insights/` folder.

---

## Key Skills 

- SQL data validation and transformation
- Revenue modeling and business logic
- Analytical thinking and problem farming
- Power BI dashboard design
- Business storytelling and recommendations

---

## Notes

This project follows a **professional portfolio standard** where:
- Raw data and heavy BI files are kept locally
- GitHub focuses on **analysis, logic, insights, and outcomes**
- Results are fully reviewable without requiring external tools

---
## =========================

## Versión en Español

## =========================
---

## Descripción del Proyecto

Este proyecto analiza datos transaccionales de ventas con el objetivo de identificar el  **impulso principal del desempeño del revenue** a nivel de productos y categorías.  
El objetivo principal es entender si el revenue está impulsado principalmente por **estrategias de precio, volumen de ventas o mezcla de productos**, y traducir estos hallazgos en **recomendaciones de negocio accionables**.

El análisis se realizó utilizando **SQL para la validación y transformación de datos** y **Power BI para el análisis exploratorio y la visualización**.

---

## Fuente de Datos

El conjunto de datos utilizado en este proyecto proviene de un dataset público de ventas minoristas disponible en Kaggle.

Enlace:  
https://www.kaggle.com/datasets/andrexibiza/grocery-sales-dataset

Este dataset integra registros transaccionales detallados que abarcan dimensiones críticas como productos, categorías, ciudades, países, clientes, empleados y ventas, proporcionando una base sólida para el análisis de los motores de ingresos.

---

## Problema de Negocio

El negocio necesita determinar si su desempeño financiero está impulsado principalmente por el **volumen de ventas** o por la **estrategia de precios**.

Las preguntas clave incluyen:
- ¿El revenue está impulsado en mayor medida por el **precio** o por el **volumen de ventas**?
- ¿Los **productos o categorías con precios más altos** generan mayor revenue?
- ¿Los **descuentos** están incrementando efectivamente el volumen de ventas?
- ¿Cómo deben ajustarse las estrategias de precios y promociones para mejorar la rentabilidad?

---

## Descripción del Dataset

El dataset consiste en datos transaccionales de ventas retail, incluyendo:
- Transacciones de ventas
- Productos y categorías
- Precios, cantidades y descuentos
- Fechas de venta y clientes

**Nota:**  
Los datasets en bruto y los archivos de Power BI no se incluyen en este repositorio debido a las limitaciones de tamaño de GitHub.  
Toda la lógica analítica está documentada mediante scripts SQL, insights y screenshots del dashboard.

---

## Enfoque Analítico

### 1. Validación y Preparación de Datos (SQL)
- Verificación de relaciones entre tablas e integridad de los datos
- Identificación de productos con precio cero y validación de que no se tratara de errores de datos
- Cálculo del **revenue real** utilizando:
  - Precio unitario
  - Cantidad vendida
  - Descuentos aplicados
- Evitar el uso de campos de revenue precalculados poco confiables

### 2. Análisis Exploratorio
- Agregación de revenue y unidades vendidas por categoría y producto
- Comparación del desempeño entre precio y volumen
- Evaluación del impacto de los descuentos en el revenue y el volumen

### 3. Visualización (Power BI)
- Tarjetas KPI de revenue y unidades vendidas
- Distribución de revenue por categoría
- Análisis de dispersión precio vs volumen
- Análisis de productos con mejor desempeño

---

## Insights Clave

### 1. El Revenue Está Impulsado Principalmente por el Volumen a Nivel Categoría
- Las categorías operan dentro de un rango de precios relativamente estrecho
- Las diferencias de revenue se explican principalmente por las unidades vendidas

### 2. Las Categorías con Precios Más Altos Tienen un Desempeño Inferior en Revenue
- Los precios premium no compensan la menor demanda
- Las categorías con precios más bajos superan en revenue gracias a un mayor volumen

### 3. Los Productos con Precio Cero Funcionan como Impulsores Estratégicos de Volumen
- Alto volumen de ventas con poca o nula contribución directa al revenue
- Probablemente utilizados como productos promocionales o *loss leaders*

### 4. El Precio Explica las Diferencias de Revenue Entre los Productos Top
- El volumen se mantiene estable entre los productos líderes
- Las diferencias de revenue están impulsadas por variaciones de precio

### 5. Los Descuentos Reducen el Revenue sin Incrementar el Volumen
- Los descuentos reducen el revenue efectivo por unidad
- No se observa un incremento significativo en el volumen de ventas

---

## Vista Previa del Dashboard

El dashboard final en Power BI resume visualmente el análisis y los insights obtenidos.

**Visualizaciones incluidas:**
- KPIs de revenue y unidades vendidas
- Revenue por categoría
- Gráfico de dispersión precio vs volumen
- Desempeño de productos top

Consulta las imágenes en la carpeta `visualizations/`.

---

## Recomendaciones de Negocio

- Enfocar las estrategias de crecimiento en **categorías de alto volumen**
- Reevaluar los precios de **categorías premium** para abordar posibles efectos de elasticidad
- Utilizar **productos con precio cero** de forma estratégica como generadores de tráfico
- Optimizar precios a **nivel producto** para los productos con mejor desempeño
- Revisar las políticas de descuentos para **proteger los márgenes**

Las recomendaciones detalladas se encuentran disponibles en la carpeta `insights/`.

---

## Habilidades Clave

- Validación y transformación de datos con SQL
- Modelado de revenue y lógica de negocio
- Pensamiento analítico y estructuración de problemas
- Diseño de dashboards en Power BI
- Storytelling de negocio y generación de recomendaciones

---

## Notas

Este proyecto sigue un **estándar profesional de portafolio**, donde:
- Los datos en bruto y archivos pesados de BI se mantienen en local
- GitHub se enfoca en **análisis, lógica, insights y resultados**
- El análisis es completamente revisable sin necesidad de herramientas externas

---
## Author / Autor

**Aldo Israel Navarro Vargas**  
Data Analyst | SQL • Power BI • Business Analytics