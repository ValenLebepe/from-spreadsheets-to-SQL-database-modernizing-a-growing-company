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
      The `CREATE PROCEDURE` statement was used to create these erocedure, and the query is detailed on the SQL scriptt `Procedures.sql` script [**(View Script)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Procedures.sql),a section of the script query shown in the screenshots below:
  
  <div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Procedure.png" alt="Creating Procedure Query Screenshot">
  
*Figure 2: proper caption here*
</div>

  
- **Triggers:** This helped to Automatically update stock quantities after orders are placed.
  The trigger was created using the `CREATE TRIGGER` stamenment detailed in this SQL script `Triggers.sql` [**(View Script)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Triggers.sql), a screenshot of the query from the script is shown below:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Trigger.png" alt="Creating Trigger Query Screenshot">
  
*Figure 2: proper caption here*
</div>


  
- **Views:** Pre-aggregated data for analytics and reporting dashboards, this alos helps to protect the raw database data from loss or missuse. I created three views, one to track the monthly company perfomance, the other to track the monthly website traffic, and the third one to track the website session in january and february.
  To create the the `CREATE VIEW ` statement was used, and is detailed in the script `Views.sql` [**(View Script)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Views.sql), a a screenshot of the query from the script is shown below:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Views.png" alt="Creating View Query Screenshot">
  
*Figure 4: proper caption.*
</div>


## 🔐 Backups & Security

To protect company data I:

- I enforced Access control with user roles and permissions
  
- I created the companies Full database backups were using MySQL dump (this is done on the UI) which is a type of logical backup that generates a sql sript tht when you run it it creates/recreates/produces the full database. See the back up script I for the company that was produced my the mySQL dump (`NovaCart Retail mysql-dump database backup.sql`) [**(See Backup Script)**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/Backups/NovaCart%20Retail%20mysql-dump%20batabase%20backup.sql)
  Below is a screenshot of a portion of the logical backup script (`NovaCart Retail mysql-dump database backup.sql`):

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/MySQL%20dump%20backup.png" alt="MySQL Dump Script Screenshot">
  
*Figure 4: proper caption.*
</div>
  
- I wrote Advisory articles written for stakeholders on security and data loss mitigation. See the [**Risks of Data Loss Advisory Article**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/Risks%20of%20Data%20Loss%20Advisory%20Article%20to%20Stackholders.pdf)  and the [**Security Advisory Article**](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/EER%20diagrams%20and%20documentation/Security%20Advisory%20Article%20to%20Stackholders.pdf)

<div align="left">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Data%20Loss%20Risks%20and%20Mitigation%20Strategies.png" alt="Data Loss Article Screenshot">
  
*Figure 4: proper caption.*
</div>

<div align="right">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20a%20Comprehensive%20Security%20Plan%20for%20the%20Company.png" alt="Security Plan Article Screenshot">
  
*Figure 4: proper caption.*
</div>

(I want these articles pictures to be side by side)


# 🏗️ Database Structure, Automation & Security

## 1️⃣ Designing the Database Schema

Before creating the individual tables, I first designed a dedicated schema to store the entire system; including all tables, views, triggers, stored procedures, and backups.

The schema was created in MySQL Workbench using the `CREATE SCHEMA` statement:

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20schema.png" width="950">
  
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

  **Figure 6:** Stock control trigger implementation.

</div>


🔗 **View Script:** [`Triggers.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Triggers.sql)



### 🔵 Views

To support analytics dashboards and reporting tools, I created three views:

| View Name | Purpose |
|-----------|---------|
| Monthly Performance View | Tracks sales & revenue trends |
| Website Traffic View | Monitors changes in incoming traffic |
| Jan-Feb Session View | Focused analysis of early-year web activity |

<p align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20Views.png">
</p>

**Figure 7:** SQL used to create analytics views.

🔗 **View Script:** [`Views.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20scripts/Views.sql)



## 4️⃣ Database Security & Backups

To ensure long-term protection of company data, I implemented:

### 🔐 Access Control  
Role-based permissions for admins, analysts, and developers.


### 💾 Automated Logical Backups

I generated a full logical backup using MySQL Workbench’s export tool (`mysqldump`).  
This produces a script that can fully rebuild the database on any MySQL server.

<div align="center">
  <img src="https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/MySQL%20dump%20backup.png">

**Figure 8:** Excerpt of exported backup script.

</div>


📄 **View Backup File:** [`NovaCart Retail mysql-dump database backup.sql`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/Backups/NovaCart%20Retail%20mysql-dump%20batabase%20backup.sql)



### 🧠 Executive Advisory Reports

To ensure stakeholders understood the importance of database safety, I wrote two advisory articles:

- 🔒 **Creating a Comprehensive Security Plan for the Company**  
- 🛑 **Data Loss Risk & Mitigation Strategies**

| Security Advisory | Risk Mitigation Advisory |
|------------------|--------------------------|
| ![](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Creating%20a%20Comprehensive%20Security%20Plan%20for%20the%20Company.png) | ![](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/blob/main/SQL%20Scripts%20Screenshorts/Data%20Loss%20Risks%20and%20Mitigation%20Strategies.png) |

**Figure 9:** Advisory article previews (side-by-side screenshots).

📄 **Both full PDFs are located in:** [`/EER diagrams and documentation/`](https://github.com/ValenLebepe/from-spreadsheets-to-SQL-database-modernizing-a-growing-company/tree/main/EER%20diagrams%20and%20documentation)



## ⭐ Final Outcome

By migrating the business from static spreadsheets to a **fully relational, automated, secure SQL database**, the company now has:

- Centralized and structured data
- Automated analytics and reporting
- Built-in data protection and backup capability
- Executive-level documentation for long-term governance

This project brings the company one step closer to scalable dashboards, predictive analytics, and expanded digital operations.









