# Business Questions

---
## =========================

## English Version

## =========================
---

## Business Question 1  
### What drives revenue more: pricing or sales volume?

**SQL Approach**
- Aggregated revenue and units sold by category
- Compared total revenue against total quantity sold
- Analyzed average selling price per category

**Answer from Insights**
- Revenue differences across categories are mainly explained by sales volume
- Average prices remain within a narrow range across most categories
- Categories with higher unit sales consistently outperform others in revenue

**Conclusion**
Revenue is primarily volume-driven at the category level.

---

## Business Question 2  
### Are higher-priced categories more profitable?

**SQL Approach**
- Calculated average selling price by category
- Ranked categories by total revenue
- Compared price rank versus revenue rank

**Answer from Insights**
- Categories with higher prices often rank lower in total revenue
- Higher prices are not offsetting lower demand
- Lower-priced categories generate more revenue due to higher volume

**Conclusion**
Higher prices do not necessarily translate into higher revenue and may suppress demand.

---

## Business Question 3  
### Do zero-price products represent data quality issues or business strategy?

**SQL Approach**
- Identified products with unit price equal to zero
- Analyzed units sold and total revenue for these products
- Verified discount values to rule out pricing errors

**Answer from Insights**
- Zero-price products show high sales volume but zero or negligible revenue
- Discounts are not applied, indicating intentional pricing
- These products do not distort revenue calculations

**Conclusion**
Zero-price products are likely promotional or loss-leader items rather than data errors.

---

## Business Question 4  
### Among top-performing products, what explains revenue differences?

**SQL Approach**
- Identified top products by total revenue
- Compared units sold versus revenue at the product level
- Used scatter analysis to visualize pricing vs volume

**Answer from Insights**
- Units sold among top products are relatively similar
- Revenue differences are explained by unit price variations
- Pricing becomes the main differentiator once volume stabilizes

**Conclusion**
At the product level, pricing plays a stronger role than volume in revenue differentiation.

---

## Business Question 5  
### Are discounts effectively increasing sales volume?

**SQL Approach**
- Calculated revenue with and without discounts
- Compared units sold for discounted versus non-discounted transactions
- Evaluated revenue impact of discounting

**Answer from Insights**
- Discounts reduce effective revenue per unit
- No significant increase in units sold is observed
- Overall revenue impact of discounts is negative

**Conclusion**
Discount strategies may be eroding margins without generating sufficient volume uplift.

---
## =========================

## Versión en Español

## =========================
---

## Pregunta de Negocio 1  
### ¿Qué impulsa más el revenue: el precio o el volumen de ventas?

**Enfoque en SQL**
- Cálculo de revenue total y unidades vendidas por categoría
- Comparación entre revenue y volumen
- Análisis de precio promedio por categoría

**Respuesta a partir de los insights**
- Las diferencias de revenue entre categorías se explican principalmente por el volumen de ventas
- Los precios promedio se mantienen dentro de un rango estrecho
- Las categorías con mayor volumen generan mayor revenue

**Conclusión**
A nivel de categoría, el revenue está impulsado principalmente por el volumen y no por el precio.

---

## Pregunta de Negocio 2  
### ¿Las categorías con precios más altos generan mayor revenue?

**Enfoque en SQL**
- Cálculo del precio promedio por categoría
- Ranking de categorías por revenue
- Comparación entre ranking de precio y ranking de revenue

**Respuesta a partir de los insights**
- Las categorías con precios más altos suelen posicionarse más abajo en revenue
- El precio elevado no compensa la menor cantidad de unidades vendidas
- Las categorías con precios más bajos generan más revenue por mayor volumen

**Conclusión**
Un precio más alto no garantiza mayor revenue y puede estar limitando la demanda.

---

## Pregunta de Negocio 3  
### ¿Los productos con precio cero son errores de datos o parte de la estrategia?

**Enfoque en SQL**
- Identificación de productos con precio unitario igual a cero
- Análisis de unidades vendidas y revenue
- Revisión de descuentos para descartar errores de cálculo

**Respuesta a partir de los insights**
- Los productos con precio cero presentan alto volumen de ventas
- No generan revenue directo
- No tienen descuentos aplicados, lo que indica una decisión intencional

**Conclusión**
Los productos con precio cero responden a una estrategia comercial (promoción o *loss leader*), no a errores en los datos.

---

## Pregunta de Negocio 4  
### Entre los productos con mejor desempeño, ¿qué explica las diferencias de revenue?

**Enfoque en SQL**
- Identificación de los productos con mayor revenue
- Comparación entre unidades vendidas y revenue
- Análisis conjunto de precio y volumen

**Respuesta a partir de los insights**
- El volumen de ventas es similar entre los productos top
- Las diferencias de revenue se explican principalmente por el precio
- El precio actúa como diferenciador una vez estabilizado el volumen

**Conclusión**
A nivel de producto, el precio es el principal factor que explica las diferencias de revenue entre los productos líderes.

---

## Pregunta de Negocio 5  
### ¿Los descuentos están incrementando efectivamente el volumen de ventas?

**Enfoque en SQL**
- Cálculo de revenue con y sin descuento
- Comparación de unidades vendidas en transacciones con descuento
- Evaluación del impacto neto en revenue

**Respuesta a partir de los insights**
- Los descuentos reducen el revenue efectivo por unidad
- No se observa un incremento significativo en el volumen
- El impacto neto en revenue es negativo

**Conclusión**
La estrategia actual de descuentos no está generando un aumento suficiente en volumen y puede estar erosionando los márgenes.