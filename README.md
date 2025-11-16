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
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/NovaCart%20Retail%20EER%20diagram.png" width="450" alt="NovaCart Retail EER Diagram">
  
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
|
├── SQL scripts/
│ └──  Master Script.sql   # This is the master script that contains everything (creating schemas, tables, views, procedures, triggers, inserting records, altering tables, and queries)
│    - Schemas.sql    # Script for creating the database schema & tables
|    - Views.sql     # Script for creating Views for analytics and reporting
|    - Procedures.sql   # Script for creating stored procedures for automation
|    - Triggers.sql    # Script for creating triggers
|    
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

Now to how I actually did my carry out my job.

## 🏗️ Database Schema & Table Creation

Before creating the tables, i fist created the database/schema to house everything (i.e tables, views, triggers, procedures, ...)
The database which is the same as a schema in MySQL WorkBench was created using the `CREATE SCHEMA` statement, as shown below from a screenshot from the `schema.sql` script:
<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20schema.png" alt="Creating Schema Query Screenshot">
  
*Figure 2: proper caption here*
</div>

After creating the schema foolwed the tables that were designed to be fully relational and normalized.  
Key tables include:

- `orders`
- `order_item_refund`
- `products`
- `customers`
- `website_sessions`
- `website_pageviews`
- `chat_support`

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/NovaCart%20Retail%20EER%20diagram.png" width="550" alt="NovaCart Retail EER Diagram">
  
*Figure 2: EER diagram showing the different tables in the database for NovaCart Retail.*
</div>

To create these tables the `CREATE TABLE` statement was used as shown below from a screenshot from the `schemas.sql` srcipt:
<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Tables.png" alt="Creating Tables Query Screenshot">
  
*Figure 2: proper caption here*
</div>


- `Schemas.sql` → This is the script which is an excerpt from the `Master Script.sql` , it was used to create the schema and all its tables and defined relationships [**View the Script**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Schemas.sql)

After creating database and the tables, the companies's Original Spreadsheet Data [**(See data)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/tree/main/Original%20Spreadsheets%20Data) were import to the their corresponidng tables using the `Table Data Import Wizard` in MySQL Workbench. The original data was already cleaned when i got them and juat waiting to be migrated to MySQL Database.


## ⚙️ Stored Procedures, Triggers, and Views

To automate tasks and prepare for future analytics of the data, the following were created:

- **Stored Procedures:** These helped in storing long queries in short queries such that even people who don't have much SQL knowledge can query the database. The stored porcedure that i created, one was to track monthly sales and revenue and the second procedure tracked the performance of the companies chat representatives.
      The SQL scipt used to create the procedures is the `Procedures.sql` script [**(View Script)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Procedures.sql)
      The `CREATE PROCEDURE` statement was used to create these erocedure, shown in the screenshots below
  
  <div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Procedure.png" alt="Creating Procedure Query Screenshot">
  
*Figure 2: proper caption here*
</div>

  
- **Triggers:** Automatically update stock quantities after orders are placed  
- **Views:** Pre-aggregated data for analytics and reporting dashboards

<div align="center">
  <img src="https://github.com/ValenLebepe/.../views-sample.png" width="550" alt="Sample View">
  
*Figure 4: Example of a view created for reporting analytics.*
</div>














