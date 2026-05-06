

---
<img width="1029" height="264" alt="image" src="https://github.com/user-attachments/assets/fbf97ec3-5af5-4860-92f9-296702e799d4" />


# 💻 Layoffs — Data Cleaning (MySQL), EDA & Tableau Dashboard

This project focuses on cleaning, analyzing, and visualizing a real-world layoffs dataset.  
It demonstrates an end‑to‑end analytics workflow: **SQL data cleaning → SQL EDA → Tableau dashboard**.

---

## 📁 Project Structure
- **/sql/**
  - `cleaning_pipeline.sql` — full SQL cleaning workflow
  - `eda_queries.sql` — exploratory analysis queries (coming soon)
- **/data/**
  - `layoffs_raw.csv` — original dataset (as provided)
  - `layoffs_clean.csv` — final cleaned dataset
- **/tableau/**
  - Dashboard files & screenshots (coming soon)
- **SQL_CLEAN_README.md** — project overview and documentation
 

---

## 🎯 Objectives
- Build a clean, analysis‑ready dataset using MySQL  
- Apply SQL best practices for data quality and transformation  
- Perform exploratory data analysis directly in SQL  
- Create a Tableau dashboard to visualize key trends  
- Demonstrate real‑world analytics skills for portfolio development  

---

## 🛠️ Tools & Skills Used
### **SQL / MySQL**
- Data type conversion  
- String cleaning & trimming  
- Encoding fixes  
- Standardization of categorical fields  
- NULL handling  
- Conditional updates  
- Window functions (`ROW_NUMBER`)  
- Deduplication  
- Exploratory analysis queries  

### **Tableau**
- Interactive dashboards  
- Trend analysis  
- Industry & country breakdowns  
- Time‑series visualizations  

### **General Analytics Skills**
- Data quality assessment  
- ETL-style pipeline design  
- Documentation & reproducibility  
- Insight generation  

---

## 🧹 Data Cleaning Steps (High-Level)
1. **Created staging table** to preserve raw data  
2. **Converted date strings → DATE type**  
3. **Trimmed whitespace + fixed encoding issues**  
4. **Standardized location and country values**  
5. **Standardized industry values**  
6. **Converted percentage fields → DECIMAL**  
7. **Removed rows with no layoff information**  
8. **Identified and removed duplicates** using window functions  
9. **Validated final dataset** for blanks, inconsistencies, and type issues  
10. **Created final clean table** (`layoffs_clean`)  

---

## 🧩 What I Did Beyond the Tutorial
While this project was inspired by Alex The Analyst’s SQL data cleaning and EDA tutorials, I did not follow the walkthrough word-for-word. I expanded the project by making several independent improvements, including:

- Converting percentage and numeric fields from TEXT to DECIMAL to ensure proper sorting, filtering, and aggregation
- Removing mojibake and fixing additional encoding issues not covered in the tutorial  
- Updating incorrect country values based on the location field  
- Applying stricter standardization rules for industries and locations  
- Enhancing early NULL handling and performing additional validation checks based on issues unique to this dataset  
- Adjusting cleaning logic to fit inconsistencies not addressed in the tutorial  
- Conducting extra quality checks before creating the final clean table  

These steps allowed me to go beyond the tutorial and build a more and build a more polished, analysis‑ready dataset.


## 🧮 Exploratory Data Analysis (SQL)
EDA will include:

- Layoffs by year  
- Layoffs by industry  
- Layoffs by country  
- Layoffs by company  
- Funding stage analysis  
- Percentage vs. total layoffs  
- Time‑series trends  

This section will be added as `eda_queries.sql`.

---

## 📊 Tableau Dashboard
The dashboard will visualize:

- Layoffs over time  
- Top affected industries  
- Geographic distribution  
- Company‑level breakdowns  
- Funding stage comparisons  

Screenshots and workbook files will be added soon.

---

## ✔️ Project Status
- **Data cleaning:** Complete  
- **EDA (SQL):** In progress  
- **Tableau dashboard:** Coming soon  

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


