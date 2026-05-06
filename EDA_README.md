
<img width="1054" height="484" alt="image" src="https://github.com/user-attachments/assets/432be7a9-68ad-4b89-bcbe-9558b6b9d4e6" />

---


# 📊 Exploratory Data Analysis (MySQL + Python)

This Exploratory Data Analysis (EDA) combines **MySQL** (for relational exploration, aggregations, and trend analysis) and **Python** (for statistical validation, distribution analysis, and outlier detection).  
Together, they provide a complete, multi‑angle understanding of global layoff patterns from 2020–2023.

---

# 🎯 1. Objectives of the EDA

- Understand layoff patterns across companies, industries, and countries  
- Identify trends over time (monthly, yearly)  
- Detect extreme layoff events using statistical methods  
- Validate distribution shape and skewness  
- Prepare insights for Tableau visualization  

---

# 🟩 **PART I — SQL‑Based EDA (MySQL)**

---

## 2️. SQL Setup & Dataset Overview

- Connected to MySQL Workbench  
- Loaded cleaned dataset (`layoffs_clean`)  
- Verified schema, data types, and row counts  
- Checked for missing values and inconsistencies  

---

## 3. Key SQL Exploratory Queries

### **3.1 Layoffs by Company**
- Identified companies with the highest total layoffs  
- Highlighted companies with multiple layoff rounds  

### **3.2 Layoffs by Industry**
- Aggregated layoffs by industry  
- Found industries most impacted (Tech, Retail, Finance)  

### **3.3 Layoffs by Country**
- Geographic distribution of layoffs  
- U.S. accounted for the majority of events  

### **3.4 Layoffs Over Time**
- Monthly and yearly trends  
- Clear spike in 2022–2023  
- Pandemic‑related layoffs visible in 2020  

### **3.5 Funding vs Layoffs**
- Compared funds raised to layoff severity  
- Found that high funding does **not** guarantee stability  

---

## 4️. SQL Insights Summary

- Layoffs are concentrated in a few industries (Tech, Retail, Finance)  
- U.S. dominates global layoff counts  
- 2022–2023 were peak layoff years  
- Several companies executed multiple rounds  
- Funding size does not prevent layoffs  
- Seasonal and economic patterns are visible in monthly trends  

---

# 🟩 **PART II — Python‑Based EDA (Statistical Analysis)**

---

## 5. Load Dataset & Initial Inspection

```python
import pandas as pd
import numpy as np

df = pd.read_csv("layoffs_clean.csv", encoding="latin1", sep=";")
df.describe(include="all").T.round(2)
```

**Purpose:**  
Validate distributions, check numeric ranges, and prepare for statistical analysis.

---

## 6. IQR Outlier Detection (Python)

```python
stats = df['total_laid_off'].describe()

Q1 = stats['25%']
Q3 = stats['75%']
IQR = Q3 - Q1

lower_bound = Q1 - 1.5 * IQR
upper_bound = Q3 + 1.5 * IQR

outliers = df[(df['total_laid_off'] < lower_bound) | (df['total_laid_off'] > upper_bound)]
outliers.head()
```

### **Results:**
- Q1: 17
- Q3: 138
- IQR: 121
- Lower bound: -164.5
- Upper bound: 319.5
- Number of outliers: 212


These outliers represent the largest layoff events in the dataset and align with the SQL “Top Layoffs” findings.

---

## 7. Boxplot Visualization (Right‑Skewed Distribution)

```python
import seaborn as sns
import matplotlib.pyplot as plt

plt.figure(figsize=(10, 2))
sns.boxplot(x=df['total_laid_off'], color="#4C7280")
plt.title("Distribution of Total Layoffs (Boxplot)")
plt.xlabel("Total Laid Off")
plt.show()
```

### Interpretation:
- Distribution is **strongly right‑skewed**  
- Most layoffs are small  
- A few extreme events dominate the upper tail  
- Matches SQL’s “Top Layoffs” findings  

---

## 8. Python Insights Summary

- Layoff counts follow a **long‑tail distribution**  
- IQR identifies a clear set of extreme events  
- Boxplot visually confirms right‑skewness  
- Python validates SQL findings and strengthens the narrative  

---

# 🟩 **PART III — Combined EDA Takeaways**

- SQL shows **who, where, and when** layoffs happened  
- Python shows **how extreme** the events were  
- Both methods confirm:
  - Tech + Finance dominate layoffs  
  - U.S. is the most impacted region  
  - 2022–2023 were peak years  
  - A few major companies* are responsible for the largest layoff events include:
    - Google — 12,000 layoffs
    - Meta — 11,000 layoffs
    - Microsoft — 10,000 layoffs
    - Amazon — 10,000 layoffs
    - Ericsson — 8,500 layoffs
    - The dataset is ready for Tableau visualization  

*These companies appear in the statistical outlier group (above the 319.5 layoff threshold) and represent the most significant workforce reductions in the dataset.

---

# 🙌 **Credits & Acknowledgements**

- **Dataset:** Layoffs dataset sourced from Youtube: https://www.youtube.com/watch?v=4UltKCnnnTA&t=160s 
- **Tools Used:** MySQL Workbench, Python (Pandas, NumPy, Seaborn, Matplotlib), Tableau  
- **Analysis & Documentation:** Aleksandra Burmester  
- **Support:** Microsoft Copilot (analysis guidance, structuring, and documentation assistance)

---


---


---
