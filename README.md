# From Spreadsheets to SQL Database: Modernizing Data Infrastructure for a Growing E-Commerce Company

**NovaCart Retail** is a rapidly expanding e-commerce startup selling consumer electronics, kids' toys and household products across Southern Africa.
I was hired as their **Database Administrator (DBA) and Data Analyst** to migrate their data into a scalable MySQL database system, enforce data security and integrity, implement automation, and build the foundation for advanced analytics, reporting, and future BI integration.

**Key Libraries:** `MySQL Server & MySQL Workbench`, `Excel`, `SQL (DDL, DML, DCL)`, `Stored Procedures`, `Triggers`, `Scheduled Events`, `EER diagram modelling`

## 🎯 Project Overview

**NovaCart Retail** is a rapidly expanding e-commerce startup selling consumer electronics, kids' toys and household products across Southern Africa.
Before hiring me, they stored all operational data (orders, order summaries, order refunds, products, website chat support, website page views, and website sessions) in multiple Excel spreadsheets, causing duplication, errors, and delays in reporting.

I was hired as their **Database Administrator (DBA) and Data Analyst** to migrate their data into a scalable MySQL database system, enforce security and integrity, implement automation, and build the foundation for advanced analytics, reporting, and future BI integration.

## 📊 Key Results

I successfully created a **full relational database** for NovaCart Retail by migrating all operational data from spreadsheets into a structured MySQL database.  
The database design, relationships, and normalization are illustrated in the EER diagram below:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/NovaCart%20Retail%20EER%20diagram.png" width="550" alt="NovaCart Retail EER Diagram">
  
*Figure 1: EER diagram showing the relational database schema for NovaCart Retail.*
</div>



## 🧑‍💼 Roles & Responsibilities

My roles & responsibilities in the company include:  
- **Designing the full relational database schema** based on company needs  
- **Creating an EER diagram and normalization plan**  
- **Writing and optimizing SQL scripts** for data migration from Excel to MySQL  
- **Performing full ETL (Extract, Transform, Load) processing**  
- **Implementing stored procedures, triggers, and event schedulers**  
- **Creating views** for analytical and reporting use-cases  
- **Configuring users, roles, and permissions** based on least-privilege security principles  
- **Setting up data backup strategy**  
- **Conducting exploratory SQL analytics** to derive business insights  
- **Writing technical documentation and best-practice guidelines** for internal staff  
- **Advising stakeholders** on long-term data governance and reporting strategy


## 📂 Repository Journey

In this repository, I take you on the journey where I moved the company from **spreadsheets to a SQL database**, showing the full process of:  
- **Designing and normalizing the database schema**  
- **Performing ETL and data migration**  
- **Implementing security and creating backups**  
- **Creating views, triggers, and stored procedures** to prepare for future advanced analytics and reporting  
- **Writing advisory articles and documentation for stakeholders**

### 📁 Repository Structure

A high-level overview of the project organization:
```
from-spreadsheets-to-SQL-database-modernizing-a-growing-company/
│
├── Original Spreadsheets Data/
│ └──  order_items.csv 
│    - order_item_refunds.csv
│    - website_sessions.csv
│    - website_pageviews.csv
|
├── SQL scripts/
│ └──  Master Script.sql   # This is the master script that contains everything (creating schemas, tables, views, procedures, triggers, inserting records, altering tables, and queries)
│    - Schemas.sql    # Script for creating the database schema & tables
|    - Views.sql     # Script for creating Views for analytics and reporting
|    - Procedures.sql   # Script for creating stored procedures for automation
|    - Triggers.sql    # Script for creating triggers    
│
├── EER diagrams and documentation/
│ └──  NovaCart Retail EER diagram.png
│    - NovaCart Retail EER diagram model.mwb
│    - Security Advisory Article to Stackholders.pdf
│    - Risks of Data Loss Advisory Article to Stackholders.pdf
│
├── Backups/
│   └── NovaCart Retail mysql-dump batabase backup.sql   # A SQL script that recreates the whole database      
|
└── README.md
```

# 🏗️ Database Structure, Automation & Security

## 1️⃣ Designing the Database Schema

Before creating the individual tables, I first designed a dedicated schema to store the entire system; including all tables, views, triggers, stored procedures, and backups.

The schema was created in MySQL Workbench using the `CREATE SCHEMA` statement:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20schema.png" width="850">
  
  **Figure 2:** Creating the database schema for NovaCart Retail.

</div>

Once the schema was initialized, I designed all tables using **fully normalized relational database principles**.  
The key tables included:
- `orders`
- `order_item_refund`
- `products`
- `order_summary`
- `website_sessions`
- `website_pageviews`
- `chat_support`

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/NovaCart%20Retail%20EER%20diagram.png" width="550">

  **Figure 3:** Full EER diagram showing table relationships.

</div>

The tables were created using `CREATE TABLE` statements inside `Schemas.sql`:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Tables.png">

**Figure 4:** Examples of SQL queries used for table creation.

</div>


🔗 **View Script:** [`Schemas.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Schemas.sql)



## 2️⃣ Migrating Original Company Data

After creating the database tables, I imported the company’s spreadsheet data using MySQL Workbench’s **Table Data Import Wizard**.

The data was already pre-cleaned, so it only needed to be mapped to the correct tables.

🔗 **View Original Datasets:**
📂 [**Original Spreadsheets Data**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/tree/main/Original%20Spreadsheets%20Data)



## 3️⃣ Automating Analytics and Operations

To make the system useful for business analytics and operational reporting, I implemented:


### 🟢 Stored Procedures

Stored procedures were created to simplify repeated analysis tasks so that even non-technical staff could run them.

I built two main procedures:

1. **Monthly sales & revenue performance**
2. **Chat representative performance tracking**

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Procedure.png">

**Figure 5:** One of the stored procedure query from `Procedures.sql`.

</div>


🔗 **View Script:** [`Procedures.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Procedures.sql)



### 🟡 Triggers

To automate inventory updates, I created a trigger that **automatically adjusts stock levels** whenever an order is placed.

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Trigger.png">

  **Figure 6:** Stock control trigger implementation from `Triggers.sql`.

</div>


🔗 **View Script:** [`Triggers.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Triggers.sql)



### 🔵 Views

To support analytics dashboards and reporting tools, I created three views:
<div align="center">

| View Name | Purpose |
|-----------|---------|
| Monthly Performance View | Tracks sales & revenue trends |
| Website Traffic View | Monitors changes in incoming traffic |
| Jan-Feb Session View | Focused analysis of early-year web activity |

</div>
<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Views.png">

**Figure 7:** One of the query used to create analytics view from `Views.sql`.


</div>


🔗 **View Script:** [`Views.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Views.sql)



## 4️⃣ Database Security & Backups

To ensure long-term protection of company's data, I implemented:

### 🔐 Access Control  
Role-based permissions for admins, analysts, and developers.


### 💾 Automated Logical Backups

I generated a full logical backup using MySQL Workbench’s export tool (`mysqldump`).  
This produces a SQL script that can fully rebuild the company's database on any MySQL server.

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/MySQL%20dump%20backup.png">

**Figure 8:** Excerpt of exported backup script from `NovaCart Retail mysql-dump database backup.sql`.

</div>


📄 **View Backup File:** [`NovaCart Retail mysql-dump database backup.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/Backups/NovaCart%20Retail%20mysql-dump%20batabase%20backup.sql)



### 🧠 Executive Advisory Reports

To ensure stakeholders understood the importance of database safety, I wrote two advisory articles:

- 🔒 **Creating a Comprehensive Security Plan for the Company**  
- 🛑 **Data Loss Risks & Mitigation Strategies**
<div align="center">

| Security Advisory | Risk Mitigation Advisory |
|------------------|--------------------------|
| ![](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20a%20Comprehensive%20Security%20Plan%20for%20the%20Company.png) | ![](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Data%20Loss%20Risks%20and%20Mitigation%20Strategies.png) |

**Figure 9:** Advisory article previews (side-by-side screenshots), please click below to see the full documents.

</div>

📄 **Both full PDFs are located in:** [`/EER diagrams and documentation/`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/tree/main/EER%20diagrams%20and%20documentation)


---

## 🏁 Final Outcome & Impact

The migration project successfully transformed the company’s operational data from scattered Excel spreadsheets into a **fully relational, secure, and scalable MySQL database system**.

This resulted in tangible operational improvements, including:

### 🚀 1️⃣ Centralized & Structured Data
- All business information - orders, summaries, products, refunds, sessions, and support; now exists in **one unified database**  
- Eliminated duplicated values and inconsistent spreadsheet versions  
- Enabled **real-time SQL queries** instead of manual spreadsheet filtering  

**Before:** 23+ spreadsheets manually updated  
**After:** 1 relational database with automated data integrity enforcement

### 📊 2️⃣ Analytics-Ready Architecture
Thanks to **views, stored procedures, and relational table design**, the company can now:
- Track revenue and refunds monthly  
- Measure website user behavior  
- Monitor chat support performance  
- Build dashboards without rewriting queries every month  

This database is now **BI-ready**, meaning it can connect directly to tools like **Power BI, Tableau, or Looker**.

### ⚡ 3️⃣ Automated Data Logic
- Stock levels update automatically through **SQL triggers**  
- No manual stock reconciliation needed after sales  
- Eliminated human error and reduced update time to zero seconds

### 🔐 4️⃣ Enterprise-Level Security & Backup Strategy
- **Access roles** restrict who can read, write, and modify different tables  
- **Full logical backups** allow the entire database to be restored in minutes  
- Two internal advisory reports were delivered to executives covering:
  - Data Loss Risk Mitigation  
  - Security Strategy Implementation  

These allow decision-makers to understand not just what was built, but **how to protect it going forward**.

### 🧩 5️⃣ Smooth & Lossless Migration
- No data was altered, lost, or corrupted during migration  
- All original spreadsheets were preserved and archived in the repository  
- Every row successfully imported into its relational destination table

### 🎯 Business Value Delivered

| Outcome                 | Business Impact                     |
|-------------------------|------------------------------------|
| Unified SQL Database    | Replaces spreadsheet chaos         |
| Automated Reporting     | Eliminates manual monthly work     |
| Real-Time Metrics       | Enables faster decision-making     |
| Data Security Plan      | Reduces operational risk           |
| Scalable Structure      | Supports future BI dashboards      |

### 🏆 Project Summary
This project modernized a growing retail company’s data infrastructure by replacing unstructured spreadsheets with a **secure, relational SQL database** designed for analytics, automation, and scalability.

The company now has:
- A production-ready MySQL database  
- Clean, well-structured historical data  
- Built-in automation and protection features  
- A foundation for future predictive analytics & BI dashboards

---





