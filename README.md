# From Spreadsheets to SQL Database: Modernizing Data Infrastructure for a Growing E-Commerce Company

**NovaCart Retail** is a rapidly expanding e-commerce startup selling consumer electronics, kids' toys and household products across Southern Africa.
I was hired as their **Database Administrator (DBA) and Data Analyst** to migrate their data into a scalable MySQL database system, enforce data security and integrity, implement automation, and build the foundation for advanced analytics, reporting, and future BI integration.

**Key Libraries:** `MySQL Server & MySQL Workbench`, `Excel`,`SQL (DDL, DML, DCL)`, `Stored Procedures, Triggers, Scheduled Events`, `EER diagram modelling`

## 🎯 Project Overview

**NovaCart Retail** is a rapidly expanding e-commerce startup selling consumer electronics, kids' toys and household products across Southern Africa.
Before hiring me, they stored all operational data (orders, order summaries, order refunds, products, website chat support, website page views, and website sessions) in multiple Excel spreadsheets, causing duplication, errors, and delays in reporting.

I was hired as their **Database Administrator (DBA) and Data Analyst** to migrate their data into a scalable MySQL database system, enforce security and integrity, implement automation, and build the foundation for advanced analytics, reporting, and future BI integration.

## 📊 Key Results

I successfully created a **full relational database** for NovaCart Retail by migrating all operational data from spreadsheets into a structured MySQL database.  
The database design, relationships, and normalization are illustrated in the EER diagram below:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams/NovaCart%20Retail%20EER%20diagram.png" width="550" alt="NovaCart Retail EER Diagram">
  
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
- **Implementing replication architecture** for future failover support  
- **Conducting exploratory SQL analytics** to derive business insights  
- **Writing technical documentation and best-practice guidelines** for internal staff  
- **Advising stakeholders** on long-term data governance and reporting strategy


## 📂 Repository Journey

In this repository, I take you on the journey where I moved the company from **spreadsheets to a SQL database**, showing the full process of:  
- **Designing and normalizing the database schema**  
- **Performing ETL and data migration**  
- **Implementing security and creating backups**  
- **Creating views and stored procedures** to prepare for future advanced analytics and reporting  
- **Writing advisory articles and documentation for stakeholders**

### 📁 Repository Structure

A high-level overview of the project organization:
```
big-data-analysis-7.6-million-cern-collisions/
│
├── Original Spreadsheets Data/
│ └──  order_items.csv 
│    - order_item_refunds.csv
│    - website_sessions.csv
│    - website_pageviews.csv
│
├── SQL scripts/
│ └──  Master Script.sql   # This is the master script that contains everything (creating schemas, tables, views, procedures, triggers, and sample queries)
│    - schema.sql    # Script for creating the database tables
|    - views.sql     # Script for creating Views for analytics and reporting
|    - procedures.sql   # Script for creating stored procedure for automation
|    - triggers.sql    # Script for creating triggers
|    - sample-queries.sql   # Example SELECT queries for analysis
|
│
├── EER diagrams and documentation/
│ └──  NovaCart Retail EER diagram.png
│    - NovaCart Retail EER diagram model.mwb
│    - Security Advisory Article to Stackholders.pdf
│    - Risks of Data Loss Advisory Article to Stackholders.pdf
│
├── Backups/
│   └── NovaCart Retail mysql-dump batabase backup.sql # A SQL script that recreates the whole database
│       
|
└── README.md
```
















