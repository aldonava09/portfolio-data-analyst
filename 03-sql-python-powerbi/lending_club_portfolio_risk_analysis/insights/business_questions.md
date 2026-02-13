# Business Questions

---
## =========================

## English Version

## =========================
---

## Business Question 1  
#### What is the overall risk and profitability of# the portfolio?

**SQL Approach**
**unted total **number of loans  
- Aggregated total capital deployed  
- Calculated default rate using charged-off loans  
- Calculated late rate using loans currently in “Late” status  
- Computed portfolio-level ROI using total interest received over total capital  

**Answer from Insights**
- The portfolio contains over 2 million loans with significant capital exposure.  
- Default rate indicates meaningful realized credit risk.  
- Late rate remains relatively low compared to default rate.  
- Portfolio ROI remains positive despite defaults.  

**Conclusion**
The portfolio is profitable overall, but risk exposure is material and requires structural optimization, particularly by loan term.

---

## Business Question 2  
### Does loan term (36 vs 60 months) impact default risk?

**SQL Approach**
- Grouped loans by term (36 vs 60 months)  
- Calculated default rate per term  

**Answer from Insights**
- 60-month loans consistently show higher default rates than 36-month loans.  
- The difference is significant across all segments.  

**Conclusion**
Loan maturity is a structural risk driver. Longer-term loans increase credit risk.

---

## Business Question 3  
### Does loan term affect profitability (ROI)?

**SQL Approach**
**ouped loans **by term  
- Calculated ROI per term using interest paid over capital deployed  

**Answer from Insights**
- 36-month loans generate higher ROI than 60-month loans.  
- Higher default risk in 60-month loans is not compensated by higher returns.  

**Conclusion**
60-month loans are inefficient from a risk-return perspective.

---

## Business Question 4  
### Does credit score properly stratify default risk?

**SQL Approach**
- Segmented borrowers into credit score buckets  
- Calculated default rate per credit tier  

**Answer from Insights**
- Default rate increases as credit score decreases.  
- Excellent borrowers exhibit the lowest default rates.  
- Fair borrowers show significantly higher default levels.  

**Conclusion**
The credit scoring model effectively stratifies portfolio risk.

---

## Business Question 5  
### Which combinations of credit score and loan term are most efficient?

**SQL Approach**
- Combined credit score buckets and loan term  
- Calculated default rate and ROI for each combination  

**Answer from Insights**
- Excellent + 36 months delivers the best risk-return balance.  
- Good + 60 months shows elevated risk with weaker returns.  
- 60-month loans underperform across all credit tiers.  

**Conclusion**
Efficiency depends on both score and maturity. The optimal segment is high credit quality with shorter maturities.

---

## Business Question 6  
### Is there early deterioration in long-term loans? (Late Analysis)

**SQL Approach**
- Grouped loans by term  
- Calculated late rate per term  

**Answer from Insights**
- 60-month loans show nearly double the late rate compared to 36-month loans.  
- Early delinquency confirms structural risk in long-term loans.  

**Conclusion**
Early deterioration reinforces the structural inefficiency of 60-month loans.

---
## =========================

## Versión en Español

## =========================
---

## Pregunta de Negocio 1  
### ¿Cuál es el nivel general de riesgo y rentabilidad del portafolio?

**Enfoque SQL**
- Se contó el total de préstamos para medir el tamaño del portafolio.  
- Se sumó el capital total colocado.  
- Se calculó la tasa de default usando los préstamos “Charged Off”.  
- Se calculó la tasa de mora (Late).  
- Se estimó el ROI del portafolio utilizando el interés recibido sobre el capital total.

**Respuesta a partir de los hallazgos****
El portafolio está compuesto por más de 2 millones de préstamos con una exposición de capital significativa.  
La tasa de default refleja un nivel relevante de riesgo crediticio realizado.  
La tasa de mora es menor al default, pero evidencia deterioro temprano en ciertos segmentos.  
A pesar de las pérdidas por default, el portafolio mantiene un ROI positivo.

**Conclusión**
El portafolio es rentable en términos agregados, pero presenta exposición significativa al riesgo, lo que hace necesaria una optimización estructural, especialmente por plazo.

---

## Pregunta de Negocio 2  
### ¿El plazo del préstamo (36 vs 60 meses) impacta el riesgo de default?

**Enfoque SQL**
- Se agruparon los préstamos por plazo.  
- Se calculó la tasa de default para cada grupo.  
- Se compararon los resultados entre 36 y 60 meses.

**Respuesta a partir de los hallazgos**
Los préstamos a 60 meses presentan consistentemente una tasa de default mayor que los de 36 meses.  
La diferencia es estructural y se mantiene en todos los segmentos de credit score.

**Conclusión**
El plazo es un factor determinante del riesgo.  
Los préstamos de mayor duración incrementan significativamente la probabilidad de incumplimiento.

---

## Pregunta de Negocio 3  
### ¿El plazo del préstamo impacta la rentabilidad (ROI)?

**Enfoque SQL**
- Se agruparon los préstamos por plazo.  
- Se calculó el ROI por cada grupo.  
- Se comparó si el mayor riesgo en 60 meses está compensado con mayor rentabilidad.

**Respuesta a partir de los hallazgos**
Los préstamos a 36 meses generan un ROI superior al de 60 meses.  
El mayor riesgo observado en los préstamos largos no está siendo compensado con mayor retorno.

**Conclusión**
Los préstamos a 60 meses son ineficientes desde una perspectiva riesgo-retorno.

---

## Pregunta de Negocio 4  
### ¿El credit score segmenta adecuadamente el riesgo?

**Enfoque SQL**
- Se clasificaron los clientes en buckets de credit score.  
- Se calculó la tasa de default por cada nivel.  
- Se comparó la progresión del riesgo entre segmentos.

**Respuesta a partir de los hallazgos**
Existe una relación clara entre menor credit score y mayor tasa de default.  
Los clientes con score Excellent presentan el menor riesgo, mientras que Fair muestra los niveles más altos.

**Conclusión**
El modelo de credit scoring es consistente y predictivo, ya que estratifica correctamente el riesgo del portafolio.

---

## Pregunta de Negocio 5  
### ¿Qué combinación de credit score y plazo es más eficiente en términos riesgo-retorno?

**Enfoque SQL**
- Se combinaron los buckets de credit score con el plazo del préstamo.  
- Se calculó la tasa de default por segmento.  
- Se calculó el ROI por segmento.  
- Se comparó el equilibrio entre riesgo y rentabilidad.

**Respuesta a partir de los hallazgos**
La combinación Excellent + 36 meses muestra el mejor equilibrio entre bajo riesgo y alto ROI.  
Las combinaciones con 60 meses, especialmente en segmentos Good y Fair, presentan mayor riesgo con menor rentabilidad.

**Conclusión**
La eficiencia del portafolio depende de la interacción entre calidad crediticia y plazo.  
El segmento óptimo es alto score con plazos cortos.

---

## Pregunta de Negocio 6  
### ¿Existe deterioro temprano en los préstamos de mayor plazo? (Análisis de mora)

**Enfoque SQL**
- Se agruparon los préstamos por plazo.  
- Se calculó la proporción de préstamos en estado “Late”.  
- Se comparó la mora temprana entre 36 y 60 meses.

**Respuesta a partir de los hallazgos**
Los préstamos a 60 meses presentan casi el doble de tasa de mora en comparación con los de 36 meses.  
Esto confirma un patrón de deterioro temprano en préstamos de mayor duración.

**Conclusión**
La mora temprana refuerza la evidencia de que los préstamos a 60 meses representan un riesgo estructural dentro del portafolio.