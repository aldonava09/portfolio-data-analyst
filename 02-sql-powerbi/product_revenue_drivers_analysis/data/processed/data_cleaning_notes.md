# Data Cleaning \& Preparation Notes

## =========================

## English Version

## =========================

## Overview

Before starting the analysis, several data validation and preparation steps were performed to ensure accuracy, consistency, and correct business logic. The dataset was composed of multiple related tables, requiring careful validation before calculating metrics and building visualizations.

---

### 1. Data Model Validation
Verified relationships between fact and dimension tables:
- Sales → Products
- Products → Categories
- Sales → Customers
- Sales → Calendar
- Ensured correct one-to-many cardinality to avoid duplicated records during aggregation.
- Confirmed that all sales records correctly matched a product and category.

**Impact:**  
Ensured that revenue and units sold calculations were not overstated due to incorrect joins.

---

### 2. Handling Zero Values in Sales Revenue
- The `TotalPrice` field in the sales table contained zero values.
- Some products also had a unit price equal to zero.
- These cases were interpreted as promotional or free products rather than data errors.

**Action Taken:**  
Revenue was recalculated using:

Revenue = UnitPrice x Quantity x (1-Discount)

**Impact:**  
Allowed accurate revenue calculation while preserving valid business scenarios such as giveaways or promotions.

---

### 3. Discount Logic Validation
- Discounts were validated as percentage values applied at transaction level.
- Confirmed that discounts were applied after multiplying unit price by quantity.
- Ensured discounts were not double-counted.

**Impact:**  
Guaranteed that revenue reflects the real selling price instead of catalog price.

---

### 4. Average Selling Price Calculation
- Catalog prices were not representative of real selling prices due to discounts.
- A weighted Average Selling Price was calculated as:

Average Selling Price = Total Revenue / Units Sold

**Impact:**  
Enabled meaningful pricing analysis at product and category level.

---
### 5. Null and Data Type Handling
- Some columns contained text values such as `"NULL"` instead of actual nulls.
- Data types were reviewed and corrected where necessary (e.g., numeric, date, text fields).

**Impact:**  
Prevented data load errors and ensured reliable calculations.

---
### 6. Date Standardization and Calendar Table
- A calendar table was created to support time-based analysis.
- Sales dates were linked to the calendar table.
- The calendar table was marked as a date table in Power BI.

**Impact:**  
Enabled correct monthly filtering, time intelligence, and consistent date slicing.

---

### 7. Naming and Structural Consistency
- Table and column names were standardized for readability and consistency.
- Removed unnecessary schema prefixes to simplify usage in SQL and Power BI.

**Impact:**  
Improved model readability and reduced complexity during analysis and visualization.

---

## Conclusion
These data preparation steps ensured that all insights and visualizations were based on clean, validated, and business-consistent data, making the analysis reliable and reproducible.

---

## =========================

## Versión en Español

## =========================

## Descripción General
Antes de iniciar el análisis, se realizaron procesos de validación y preparación de datos para garantizar exactitud, consistencia y correcta lógica de negocio. El dataset estaba compuesto por múltiples tablas relacionadas, por lo que fue necesario validar su estructura antes de calcular métricas y construir visualizaciones.

---

### 1. Validación del Modelo de Datos
- Se verificaron las relaciones entre tablas de hechos y dimensiones:
- Ventas → Productos
- Productos → Categorías
- Ventas → Clientes
- Ventas → Calendario
- Se confirmó la cardinalidad uno-a-muchos para evitar duplicación de registros.
- Se validó que cada venta estuviera correctamente asociada a un producto y categoría.

**Impacto:**  
Se evitó la sobreestimación de revenue y unidades vendidas.

---

### 2. Manejo de Valores Cero en Revenue
- El campo `TotalPrice` en la tabla de ventas contenía valores en cero.
- Algunos productos tenían precio unitario igual a cero.
- Estos casos se interpretaron como productos promocionales o gratuitos, no como errores.

**Acción tomada:**  
El revenue fue recalculado usando:

Revenue = Precio Unitario x Cantidad x (1-Descuento)

**Impacto:**  
Se obtuvo un revenue realista respetando la lógica del negocio.

---

## 3. Validación de la Lógica de Descuentos
- Los descuentos se validaron como porcentajes aplicados por transacción.
- Se confirmó que el descuento se aplicara después de multiplicar precio por cantidad.
- Se evitó la doble aplicación de descuentos.

**Impacto:**  
El revenue refleja el precio real de venta y no el precio de catálogo.

---

### 4. Cálculo del Precio Promedio Real
- El precio de catálogo no representaba el precio real de venta.
- Se calculó un Precio Promedio Real ponderado:

Precio Promedio = Revenue Total / Unidades Totales

**Impacto:**  
Permitio el manejo de precio real por categoria y producto. 

---

### 5. Manejo de Nulos y Tipos de Datos
- Algunas columnas contenían valores `"NULL"` como texto.
- Se revisaron y corrigieron tipos de datos numéricos, fechas y texto.

**Impacto:**  
Se evitaron errores de carga y cálculos incorrectos.

---

### 6. Estandarización de Fechas y Tabla Calendario
- Se creó una tabla calendario para análisis temporal.
- Las fechas de venta se relacionaron con dicha tabla.
- La tabla calendario fue marcada como tabla de fechas en Power BI.

**Impacto:**  
Permitió segmentación mensual correcta y análisis temporal consistente.

---

### 7. Consistencia de Nombres y Estructura
- Se estandarizaron nombres de tablas y columnas.
- Se eliminaron prefijos innecesarios de esquema.

**Impacto:**  
Mejoró la legibilidad del modelo y facilitó el análisis en SQL y Power BI.

---

## Conclusión

Estos procesos de limpieza y preparación garantizan que los insights y visualizaciones del proyecto se basen en datos confiables, consistentes y alineados con la lógica del negocio.