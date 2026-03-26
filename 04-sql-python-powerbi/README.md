# E-commerce Website Funnel Analysis – Clara Case Study

End-to-end data analysis project focused on identifying funnel drop-offs and understanding how **user type** and **device** impact conversion performance.

This project covers the full analytics workflow: **Python (EDA & validation), SQL (data modeling) and Power BI (dashboard & insights)**.

---

## Project Overview

The objective of this analysis is to evaluate user behavior across a purchase funnel and identify opportunities to improve conversion rates.

Specifically, the analysis answers:
- Where do users drop off in the funnel?
- How do **new vs returning users** behave differently?
- How does **device type** affect conversion?
- What business actions could improve overall performance?

---

## Business Problem

The company’s CEO is concerned about the low volume of sales, particularly those coming from **new users**. 

To address this issue, the objective of this analysis is to investigate the performance of the **purchase conversion funnel** and identify potential friction points that may be preventing users from completing a purchase.

Specifically, this project aims to:
- Identify where users drop off in the funnel
- Evaluate how **user type (new vs returning)** impacts conversion behavior
- Analyze how **device type (desktop vs mobile)** affects performance
- Provide actionable recommendations to improve conversion rates and increase overall sales

---

## Dataset Description

The dataset represents user interactions across different funnel stages.

### Funnel Stages
1. Home
2. Search 
3. Payment
4. Confirmation

## Project Workflow

### 1. Data Validation & EDA (Python)

Python was used to:
- Load and validate raw CSV files
- Check for missing values and inconsistencies
- Validate funnel logic
- Perform basic exploratory analysis

**Tools & Libraries**
- pandas
- numpy
- matplotlib

Output:
- Cleaned datasets ready for SQL modeling

---

### 2. Data Modeling & Funnel Construction (SQL)

PostgreSQL was used to:
- Create `raw` and `analytics` schemas
- Build a consolidated `fact_funnel` table
- Classify users as **new** or **returning**
- Calculate funnel and segment-level metrics

Key outputs:
- Overall funnel conversion rates
- Conversion by device
- Conversion by user type
- Conversion by device + user type

---

### 3. Dashboard Development (Power BI)

Power BI was used to build an interactive dashboard with:

- KPI cards
- Funnel visualization
- Segmentation analysis
- Business recommendations

**Key DAX Measures**
- Total Users
- Overall Conversion Rate
- Stage Conversion Rates
- Conversion by Device
- Conversion by User Type
- Device Conversion Gap

---

## Dashboard Structure

### Page 1 Funnel Overview
**Purpose:** Understand overall funnel performance.

**Key Insights:**
- The largest drop occurs between **Search to Payment**, where only **13.34%** of users proceed to the payment stage.
- Even after reaching the payment stage, only **7.5%** of users complete the purchase (**Payment to Confirmation**), indicating potential friction during the checkout process.

### Page 2 New vs Returning Users
**Purpose:** Compare conversion behavior by user type.

**Key Insights:**
- New users represent **less than 1% of total traffic**
- Returning users convert significantly better across all stages

### Page 3 Conversion Performance by Device
**Purpose:** Analyze how device impacts performance.

**Key Insights:**
- Desktop generates most traffic
- Mobile users convert **significantly better**
- New desktop users show **zero conversions**

### Page 4 Business Recommendations
**Purpose:** Translate insights into actionable decisions.

---

## Key Insights:

- Major drop between **Search to Payment (13.34%)**
- Only **7.5%** of users complete purchase after reaching payment
- Desktop drives most traffic but converts worse than mobile
- New users represent **<1% of total traffic**
- New desktop users show **zero conversions**

---

## Business Recommendations

Based on the funnel analysis and user segmentation results, the following actions are recommended to improve conversion performance:

- **Reduce friction between Search and Payment**  
The largest drop-off occurs before users reach the payment stage. Reviewing the transition from search results to payment could help identify usability issues such as unclear pricing, confusing navigation, or lack of trust signals.

- **Simplify the checkout and payment flow**  
A significant portion of users who reach the payment stage do not complete the purchase. Streamlining the checkout process, reducing the number of required fields, and improving payment reliability could increase purchase completion.

- **Optimize the desktop checkout experience**  
Desktop generates the majority of traffic but converts significantly worse than mobile devices. Improving the desktop user experience and checkout interface may unlock meaningful conversion improvements.

- **Strengthen marketing strategies to acquire new users**  
New users represent a very small portion of total traffic. Expanding acquisition strategies through targeted campaigns and onboarding incentives could help grow the user base and reduce reliance on returning customers.

---

## Expected Impact

If implemented, these actions could lead to:
- Higher purchase completion
- Improved conversion rates
- More efficient funnel performance
- Growth in new user acquisition

---

## Tools Used

- **Python**
- **PostgreSQL**
- **Power BI**
- **DAX**

---

## Author

**Aldo Navarro** | Data Analyst