# Sales Performance & Operations Analysis (SQL + Power BI)

## Project Overview
This project analyzes sales performance, pricing behavior, and delivery efficiency using **SQL (MySQL)** and **Power BI (Web)**.  
The goal is to deliver an executive-ready dashboard that highlights revenue drivers, operational efficiency, and pricing dynamics in a clear and reproducible way.

The analysis focuses on:
- Revenue distribution across regions, stores, products, and salespeople
- Pricing versus volume behavior
- Discount and shipping cost impact
- Delivery performance using actual wait time (no assumed SLA)

—

## Repository Structure

—

## Repository Structure

| Path | Description |
|-----|------------|
| `SQL/` | Contains all SQL-based analysis and insights |
| `SQL/code.sql` | SQL queries used for EDA, aggregations, KPIs, and time-based analysis |
| `SQL/sql_insights.md` | Business insights derived from SQL analysis |
| `Power_BI/` | Power BI dashboard outputs and documentation |
| `Power_BI/dashboard.pdf` | Exported version of the final dashboard |
| `Power_BI/pb_insights.md` | Explanation of dashboard structure, KPIs, and insights |
| `README.md` | Project overview, repository roadmap, and usage notes |

—

## Folder & File Description

### 📁 SQL/
Contains all data analysis logic written in SQL.

- **code.sql**  
  Includes all SQL queries used for:
  - Exploratory Data Analysis (EDA)
  - Aggregations and KPI calculations
  - Sales efficiency analysis
  - Time-based trends and growth calculations

- **sql_insights.md**  
  Summarizes key findings derived from SQL analysis in clear business language.

---

### 📁 Power_BI/
Contains dashboard outputs and insights created using **Power BI Web**.

- **dashboard.pdf**  
  Exported version of the final interactive dashboard for easy viewing and sharing.

- **pb_insights.md**  
  Explains dashboard layout, KPIs, visuals, and key business takeaways from each page.

---

## How to Navigate This Repository
1. Start with **README.md** to understand project scope and structure  
2. Review **SQL/code.sql** to see how the data was analyzed  
3. Read **SQL/sql_insights.md** for analytical conclusions  
4. View **Power_BI/dashboard.pdf** for final visualization output  
5. Refer to **Power_BI/pb_insights.md** for dashboard interpretation

---

## Tools & Technologies
- **SQL (MySQL)** — data cleaning, aggregation, and analysis  
- **Power BI (Web)** — dashboarding and visualization  
- **DAX** — calculated measures for delivery and efficiency metrics

---

## Notes
- Power BI Desktop was not used; the project was built using **Power BI Web** on macOS.
- Delivery performance metrics are based on actual delivery wait time due to the absence of promised delivery dates, ensuring objective and defensible analysis.

---
