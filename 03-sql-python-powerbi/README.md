# Lending Club Portfolio Risk & Profitability Analysis  
**PostgreSQL, Python & Power BI | Business-Oriented Financial Risk Analysis**

---
## =========================

## English Version

## =========================
---

## Project Overview

This project analyzes a large-scale lending portfolio dataset to identify the **key drivers of credit risk and portfolio profitability**.

The primary objective is to determine whether portfolio performance is mainly driven by **borrower credit quality, loan term structure, or product configuration**, and to translate those findings into **actionable business recommendations**.

The analysis was conducted using:

- **PostgreSQL** for relational modeling and business-driven SQL analysis
- **Python (Pandas)** for data extraction and preprocessing
- **Power BI** for executive-level visualization and KPI reporting

---

## Data Source

The dataset used in this project comes from the public Lending Club dataset available on Kaggle.

Source:  
https://www.kaggle.com/datasets/wordsforthewise/lending-club?select=accepted_2007_to_2018Q4.csv.gz

The dataset contains historical loan data from 2007–2018, including borrower attributes, loan characteristics, and repayment outcomes.

---

## Business Problem

The lending institution needs to determine whether portfolio inefficiencies are being driven primarily by **credit quality or loan term structure**.

Key questions include:

- Do longer-term loans compensate for their higher default risk?
- Does credit score effectively stratify risk?
- Which loan configurations maximize risk-adjusted return?
- Where should capital allocation be optimized?

---

## Dataset Description

The dataset includes:

- Borrower information:
  - Annual income
  - Employment length
  - Home ownership
  - Credit score
- Loan characteristics:
  - Loan amount
  - Interest rate
  - Term (36 vs 60 months)
  - Issue date
- Loan outcomes:
  - Loan status (Fully Paid, Charged Off, Late, Current)
- Payment summary data:
  - Principal paid
  - Interest paid
  - Total payment

**Note:**  
Raw datasets and Power BI files are not included due to GitHub file size limitations.  
All analytical logic is fully documented through SQL scripts, DAX measures, and dashboard screenshots.

---

## Analytical Approach

### 1. Data Preparation (Python)

- Extracted relevant columns from large CSV files
- Cleaned data types and standardized formats
- Created engineered variables:
  - is_default
  - is_late
  - credit_score_bucket
- Generated a clean analytical dataset for database import

---

### 2. Relational Modeling (PostgreSQL)

- Designed normalized schema (3NF)
- Created primary and foreign key constraints
- Established relationships:
  - Borrowers → Loans (1:N)
  - Loan Status → Loans (1:N)
  - Loans → Payments (1:1 summarized extension)
- Ensured referential integrity

---

### 3. Business Analysis (SQL)

- Calculated portfolio-level default rate
- Compared ROI by loan term
- Analyzed default rate by credit score bucket
- Evaluated risk-return efficiency by score and term
- Performed late (early delinquency) analysis

---

### 4. Visualization (Power BI)

The final dashboard includes:

- KPI Cards:
  - Total Loans
  - Total Capital
  - Default Rate
  - Late Rate
  - Portfolio ROI
- Default Rate by Term
- ROI by Term
- Default Rate by Credit Score
- Risk-Return Matrix (Score × Term)
- Late Rate Analysis

---

## Key Insights

### 1. 60-Month Loans Are Structurally Inefficient
- Higher default rates
- Higher late rates
- Lower ROI compared to 36-month loans

### 2. 36-Month Loans Deliver Superior Risk-Adjusted Returns
- Lower credit risk
- Higher profitability
- More stable performance

### 3. Credit Score Effectively Stratifies Risk
- Default rates increase progressively from Excellent to Fair
- Risk segmentation is consistent across terms

### 4. The "Good" Segment Concentrates Systemic Exposure
- Largest loan volume
- Largest capital allocation
- Significant contributor to aggregate risk

### 5. Excellent + 36 Months Is the Most Efficient Combination
- Low default rate
- Strong ROI
- Best risk-return balance

---

## Dashboard Preview

The final Power BI dashboard summarizes risk and profitability visually.

**Included visualizations:**

- Portfolio KPIs
- Default Rate by Term
- ROI by Term
- Credit Score Risk Segmentation
- Risk-Return Efficiency Matrix
- Late Rate Overview

See screenshots in the `images/` folder.

---

## Business Recommendations

- Reassess pricing and underwriting criteria for 60-month loans
- Prioritize 36-month loan growth strategies
- Focus monitoring efforts on the Good credit segment
- Increase acquisition of high-credit-quality borrowers
- Implement term-based performance monitoring dashboards

Detailed recommendations are available in the `insights/` folder.

---

## Key Skills Demonstrated

- Relational database modeling (PostgreSQL)
- SQL business-driven analysis
- Data cleaning and preprocessing (Python & Pandas)
- KPI development and DAX measures
- Risk-return financial analysis
- Dashboard design in Power BI
- Business storytelling and strategic recommendations

---
## =========================

## Versión en Español

## =========================
---

## Descripción del Proyecto

Este proyecto analiza un portafolio de préstamos a gran escala para identificar los **principales impulsores del riesgo crediticio y la rentabilidad del portafolio**.

El objetivo principal es determinar si el desempeño del portafolio está impulsado principalmente por:

- La calidad crediticia del prestatario
- La estructura del plazo del préstamo
- La configuración del producto financiero

Los hallazgos se traducen en **recomendaciones estratégicas accionables** para optimizar la eficiencia riesgo-retorno.

El análisis se desarrolló utilizando:

- **PostgreSQL** para modelado relacional y análisis SQL orientado a negocio
- **Python (Pandas)** para extracción y preparación de datos
- **Power BI** para visualización ejecutiva y desarrollo de KPIs

---

## Fuente de Datos

El dataset utilizado proviene del conjunto público de Lending Club disponible en Kaggle.

Fuente:  
https://www.kaggle.com/datasets/wordsforthewise/lending-club?select=accepted_2007_to_2018Q4.csv.gz

Incluye información histórica de préstamos entre 2007 y 2018, con datos de:

- Perfil del prestatario
- Características del préstamo
- Estado del préstamo
- Resultados de pago

---

## Problema de Negocio

La institución financiera necesita determinar si las ineficiencias del portafolio están siendo impulsadas por la **calidad crediticia** o por la **estructura del plazo del préstamo**.

Preguntas clave:

- ¿Los préstamos a mayor plazo compensan su mayor riesgo con mayor rentabilidad?
- ¿El credit score segmenta adecuadamente el riesgo?
- ¿Qué combinaciones de plazo y calidad crediticia maximizan el retorno ajustado por riesgo?
- ¿Dónde debe optimizarse la asignación de capital?

---

## Descripción del Dataset

El dataset incluye:

### Información del prestatario
- Ingreso anual
- Antigüedad laboral
- Tipo de vivienda
- Credit score

### Características del préstamo
- Monto del préstamo
- Tasa de interés
- Plazo (36 vs 60 meses)
- Fecha de originación

### Resultados del préstamo
- Estado del préstamo (Fully Paid, Charged Off, Late, Current)

### Información de pagos
- Capital pagado
- Intereses pagados
- Pago total
- Fecha del último pago

**Nota:**  
Los datasets originales y el archivo de Power BI no se incluyen debido a limitaciones de tamaño en GitHub.  
Toda la lógica analítica se encuentra documentada en scripts SQL, documentación de DAX e insights estratégicos.

---

## Enfoque Analítico

### 1. Preparación de Datos (Python)

- Extracción de columnas relevantes desde archivos CSV masivos
- Limpieza y estandarización de tipos de datos
- Creación de variables derivadas:
  - is_default
  - is_late
  - credit_score_bucket
- Generación de dataset limpio para carga en base de datos

---

### 2. Modelado Relacional (PostgreSQL)

- Diseño de esquema normalizado en 3FN
- Creación de claves primarias y foráneas
- Definición de relaciones:
  - Borrowers → Loans (1:N)
  - Loan Status → Loans (1:N)
  - Loans → Payments (1:1 resumen agregado)
- Validación de integridad referencial

---

### 3. Análisis de Negocio (SQL)

Se realizaron consultas estructuradas para responder preguntas estratégicas:

- Tasa de default a nivel portafolio
- Comparación de ROI por plazo
- Tasa de default por bucket de credit score
- Análisis riesgo-retorno por combinación de score y plazo
- Análisis de mora temprana (Late rate)

---

### 4. Visualización (Power BI)

El dashboard ejecutivo incluye:

- KPIs principales:
  - Total de préstamos
  - Capital total colocado
  - Tasa de default
  - Tasa de mora
  - ROI del portafolio
- Default rate por plazo
- ROI por plazo
- Default rate por credit score
- Matriz de eficiencia riesgo-retorno (Score × Plazo)
- Análisis de mora

---

## Principales Hallazgos

### 1. Los préstamos a 60 meses son estructuralmente ineficientes
- Mayor tasa de default
- Mayor tasa de mora
- Menor ROI comparado con 36 meses

### 2. Los préstamos a 36 meses ofrecen mejor retorno ajustado por riesgo
- Menor exposición a incumplimiento
- Mayor estabilidad
- Mejor desempeño general

### 3. El credit score segmenta correctamente el riesgo
- La tasa de default aumenta progresivamente desde Excellent hacia Fair
- El patrón es consistente entre plazos

### 4. El segmento "Good" concentra la mayor exposición sistémica
- Mayor volumen de préstamos
- Mayor capital asignado
- Impacto relevante en el riesgo agregado

### 5. Excellent + 36 meses es la combinación más eficiente
- Bajo riesgo
- ROI competitivo
- Mejor equilibrio riesgo-retorno

---

## Vista del Dashboard

El dashboard final resume visualmente el desempeño del portafolio.

Visualizaciones incluidas:

- KPIs principales
- Tasa de default por plazo
- ROI por plazo
- Segmentación de riesgo por credit score
- Matriz Score × Plazo
- Análisis de mora

Las imágenes se encuentran en la carpeta `images/`.

---

## Recomendaciones de Negocio

- Reevaluar la estructura y pricing de préstamos a 60 meses
- Priorizar el crecimiento en préstamos a 36 meses
- Fortalecer monitoreo en el segmento "Good"
- Incrementar captación de clientes con alta calidad crediticia
- Implementar monitoreo continuo por plazo

---

## Habilidades Demostradas

- Modelado relacional en PostgreSQL
- Análisis SQL orientado a negocio
- Limpieza y transformación de datos con Python
- Desarrollo de KPIs y medidas DAX
- Análisis financiero riesgo-retorno
- Diseño de dashboards ejecutivos
- Storytelling analítico y recomendaciones estratégicas