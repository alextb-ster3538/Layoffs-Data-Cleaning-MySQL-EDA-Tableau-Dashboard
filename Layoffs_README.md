

<img width="1025" height="310" alt="image" src="https://github.com/user-attachments/assets/999eeaca-682e-4599-bce6-6ea28f68ed99" />


---

This project analyzes global layoffs using a full end‑to‑end analytics workflow: 
MySQL data cleaning → SQL & Python EDA → Tableau visualization. 
The goal was to transform a messy real‑world dataset into a clean, analysis‑ready table, uncover meaningful trends, and present insights through interactive visualizations. This project demonstrates practical data cleaning, analytical thinking, and dashboard‑building skills aligned with real business use cases.

---

## 🎯 Objectives
- Build a clean, analysis‑ready dataset using MySQL  
- Apply SQL best practices for data quality and transformation  
- Perform exploratory data analysis directly in SQL  
- Create a Tableau dashboard to visualize key trends  
- Demonstrate real‑world analytics skills for portfolio development  

---

## 🛠️ Tools & Skills Used
### SQL / MySQL
- Data type conversion and validation
- String cleaning, trimming, and encoding fixes
- Standardization of categorical fields (industry, country, location)
- NULL handling and conditional updates
- Conversion of percentage and numeric fields from TEXT → DECIMAL
- Window functions (ROW_NUMBER) for deduplication
- Creation of staging and final clean tables
- Quality assurance queries for blanks, mismatches, and type consistency
- ETL‑style workflow design for reproducibility
- Exploratory analysis queries for trend discovery
### Python
- Data validation and summary statistics (pandas, numpy)
- Exploratory visualizations (matplotlib, seaborn)
- Correlation and distribution analysis
- Outlier detection and data profiling
- Integration with SQL outputs for cross‑validation
- Automated EDA script for reproducible insights
### Tableau
- Interactive dashboards
- Trend and time‑series analysis
- Industry and country breakdowns
- Geographic visualizations
- Company‑level comparisons
- General Analytics Skills
- Data quality assessment
- ETL‑style pipeline design
- Documentation and reproducibility
- Insight generation and storytelling

# 🧹**Data Cleaning Steps (High‑Level)**
- Created staging table to preserve raw data
- Converted date strings → DATE type
- Trimmed whitespace + fixed encoding issues (mojibake, UTF‑8 mismatches)
- Standardized location and country values using conditional updates
- Standardized industry values for consistency
- Converted percentage and numeric fields → DECIMAL for proper aggregation
- Removed rows with no layoff information
- Identified and removed duplicates using window functions
- Validated final dataset for blanks, inconsistencies, and type issues
- Created final clean table (layoffs_clean)
- Ran validation queries to confirm record counts and data integrity
- Exported clean dataset for EDA in Python and Tableau

### 🧩**What I Did Beyond the Tutorial**

While this project was inspired by Alex The Analyst’s SQL data cleaning and EDA tutorials, I expanded the workflow significantly:

- Converted percentage and numeric fields from TEXT to DECIMAL for accurate analysis
- Fixed additional encoding issues and removed mojibake not covered in the tutorial
- Corrected country values based on location mismatches
- Applied stricter standardization rules for industries and locations
- Enhanced NULL handling and validation logic
- Added quality‑control queries to ensure completeness and consistency
- Integrated Python for deeper EDA and visual validation
- Documented each step for reproducibility and transparency
- Built a dashboard in Tableau

These improvements produced a clean, analysis‑ready dataset and a multi‑tool workflow combining SQL, Python, and Tableau.

# 🧮 **Exploratory Data Analysis (SQL & Python)**
EDA includes:
- Layoffs by year
- Layoffs by industry
- Layoffs by country
- Layoffs by company
- Funding stage analysis
- Percentage vs. total layoffs
- Time‑series trends
- Correlation and distribution analysis (Python)

This section is implemented in eda_queries.sql and eda_python.ipynb.

 ## 🔎 **Key Insights (EDA):**
  
- Layoffs peaked sharply in 2022–2023, driven primarily by over‑hiring during the pandemic and macroeconomic tightening.
- Consumer, Retail, and Transportation industries showed the highest layoff counts, while sectors like Healthcare and Energy    remained relatively stable.
- The United States accounted for the majority of recorded layoffs, with significant contributions from large tech firms and    late‑stage startups.
- Companies in later funding stages (Series D+, Post‑IPO) showed higher layoff volumes, suggesting cost‑cutting pressures       increase as organizations scale.

# 📊 **Tableau Dashboard**
The dashboard visualizes:
- Layoffs over time
- Top affected industries
- Geographic distribution
- YoY change

Screenshots and workbook files will be added in the Tableau folder.

---

## 🙌 Credits & Acknowledgments
Special thanks to Alex The Analyst for his insightful YouTube tutorials on SQL data cleaning and exploratory data analysis, which helped shape parts of this project.

Data Cleaning in MySQL Tutorial: https://www.youtube.com/watch?v=4UltKCnnnTA&t=160s 

SQL EDA Tutorial:https://www.youtube.com/watch?v=QYd-RtK58VQ 

---

## 📬 Contact
**Aleksandra Burmester** — Entry-Level Data Analyst  
**Connect with me on LinkedIn:**  
https://www.linkedin.com/in/aleksandra-burmester-1823b72a/


---


