-- Master Script

-- 1. Importing data to a database table:

-- Set the autocommit on.
SET autocommit = ON;

-- Creating the schema
CREATE SCHEMA mavenbearbuilders;    -- This is the schema name I chose to use for the NovaCart Retail Company

-- Set the schema/database as the default DB to query
USE mavenbearbuilders;

-- Create the table to house the data.
CREATE TABLE orders (
	order_item_id SMALLINT NOT NULL PRIMARY KEY,
    created_at DATETIME, -- DATETIME = yyyy-mm-dd hh:mm:ss
    order_id SMALLINT,
    price_usd DECIMAL (8,2),
    cogs_usd DECIMAL (8,2),
    website_session_id SMALLINT
);

-- Review the table (before & after data importing)
SELECT * FROM orders;


-- Creating the table
CREATE TABLE order_item_refund (
order_item_refund_id SMALLINT NOT NULL PRIMARY KEY,
created_at DATETIME,
order_item_id SMALLINT,
order_id SMALLINT,
refund_amount DECIMAL (8,2),
FOREIGN KEY (order_item_id) REFERENCES orders(order_item_id)  -- Foreign key is a column (or a set of columns) that is a primary key in another table. Specifying this establishes the relationship between two tables.
-- The syntax is: FOREIGN KEY (foreign_key) REFERENCES parent_table(parent_column);
);

-- Review the table (before & after data importing)
SELECT * FROM order_item_refund;


-- 2. Deleting Bad Data from the order_item_refund table:

-- Review the table
SELECT * FROM order_item_refund;

-- NB: Remember to always delete using the primary key. (since autocommit is on, you cannot redo (i.e. ROLLBACK) after deleting)
DELETE FROM order_item_refund
	WHERE order_item_refund_id BETWEEN 6 AND 10; -- between is inclusive i.e xE [7,10]
    
-- Review the table
SELECT * FROM order_item_refund;


-- 3. Importing more data to the tables:

-- You should start importing to the orders table because it has its column as a FOREIGN KEY in the orders_item_refund, and so the is a relation between these tables, where the dat in order_item_refund, depends on the data in the orders table, and thus you are supposed to first upload data to the orders table.
-- Review the tables
SELECT * FROM orders;
SELECT * FROM order_item_refund;

-- EDITS: I need to edit my table's column, because i ran into an error becasue some of the data i was importing were out of range especially the id columns.
-- Firsty delete all the records in the tables
DELETE FROM orders;
DELETE FROM order_item_refund;

-- Second drop and recreate the new tables
DROP TABLE orders;
DROP TABLE order_item_refund;

CREATE TABLE orders (
	order_item_id BIGINT NOT NULL PRIMARY KEY,
    created_at DATETIME, -- DATETIME = yyyy-mm-dd hh:mm:ss
    order_id BIGINT,
    price_usd DECIMAL (8,2),
    cogs_usd DECIMAL (8,2),
    website_session_id BIGINT
);

CREATE TABLE order_item_refund (
order_item_refund_id BIGINT NOT NULL PRIMARY KEY,
created_at DATETIME,
order_item_id BIGINT,
order_id BIGINT,
refund_amount DECIMAL (8,2),
FOREIGN KEY (order_item_id) REFERENCES orders(order_item_id)  -- Foreign key is a column (or a set of columns) that is a primary key in another table. Specifying this establishes the relationship between two tables.
-- The syntax is: FOREIGN KEY (foreign_key) REFERENCES parent_table(parent_column);
);
ALTER TABLE order_item_refund -- Altering the column name
	CHANGE refund_amount refund_amount_usd DECIMAL (8,2);  -- Syntax: 	CHANGE old_column_name new_column_name DATATYPE;  -- Syntax: 
    
-- Import the data and review the columns
SELECT * FROM orders;
SELECT * FROM order_item_refund;


-- 4. Creatinng a new products table and adding records:

CREATE TABLE products (  -- Creating the produts table
	product_id BIGINT NOT NULL PRIMARY KEY,
    created_at DATETIME,
    product_name VARCHAR (50)
);
    
INSERT INTO products VALUES -- Adding records
	(1, '2012-03-19 09:00:00','The Original Mr.Fuzzy'),
    (2, '2013-01-06 13:00:00','The Forever Love Bear');

SELECT * FROM products;


-- 5. ALTERING the order item table and adding the product_id column:

-- Review the table
SELECT * FROM orders;

-- ALTER the table, ADD the product_id column
ALTER TABLE orders
	ADD COLUMN product_id BIGINT AFTER order_id;


-- 6. Updating the product_id column in the orders table:
 
UPDATE orders
	SET product_id = 1
		WHERE order_item_id IS NOT NULL;  -- This where clause is always true
        
        
-- 7. Establishing primary key - foreign key relationship in the orders and prodcuts tables:

-- This can done using the UI or the code. Via the code:
ALTER TABLE orders
	ADD CONSTRAINT fk_orders -- This is the contraint and the name of the contraint i chose
		FOREIGN KEY (product_id) REFERENCES products (product_id);
        
SELECT * FROM orders;

-- 8. Importing data to the orders table and the order_item_refund table
-- SInce the tables have a relation, remember that the order of importing matter. Start importing to the table that does not depend on the other i.e the table that has no fireign key, the after that import to the other table

-- Reviewing the tables (before & after importing)
SELECT * FROM orders;
SELECT * FROM order_item_refund;

-- 8. Creating the first backup of the mavenbearbuilders database:

-- The risk of data loss to our company would be so devastating because we'd lose everything! and so we have to put ways to mitigate this.
-- To mitigate this we can: create a replica of the database, or backup the database using different methods such as physiscally backing the db, or using MySQL dump backup.


-- 9. Enhancing the data structure to accomodate new tracking needs

-- Key Tasks: Import Additional data to the db
			-- Enhance the data structure to accomodate new tracking needs
            
	-- 9.1. Import new data to the database tables. 

-- Review the tabels (before & after importing)
SELECT * FROM orders;
SELECT * FROM order_item_refund;

	-- 9.2. Adding a binary (a column of zeros and ones) column to the orders table called "is_primary_item".
    
ALTER TABLE orders
	ADD COLUMN is_primary_item SMALLINT AFTER product_id;

	-- 9.3. Update the is_primary_item column to 1 for all records.

UPDATE orders
	SET is_primary_item = 1	
		WHERE order_item_id IS NOT NULL;

-- Review the table to check whether the change was executed successfully
SELECT * FROM orders;

	-- 9.4. Add two new producst to the products table, then import the remainder of the data to the db.alter

-- Reviewing the products table (before & after INSERT)    
SELECT * FROM products;

-- Inserting the two new products
INSERT INTO products VALUES
	(3,'2013-12-12 09:00:00','The Birthday Sugar Panda'),
    (4,'2014-02-05 10:00:00','The Hudson River Mini Bear');
 
 -- Reviewing the orders and order_item_refund tables (before & after importing)
 SELECT * FROM orders;
 SELECT * FROM order_item_refund;
    
    -- 9.5. Review the data integrity of your database and make sure it's maintained.

/* Note: Data Integrity refers to the overall accuracy, completeness, consistency, and reliability of data throughout its entire lifecycle.
   In simpler terms it ensures that the data is correct, valid, and trustworthy.
*/

-- Review all the tables in the database
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_item_refund;

-- Data integrity is well maintained in my database.

	-- 9.6. Write a report on the possible risks of data loss and ways to mitigate them.
    
/* 
# Data Loss Risks and Mitigation Strategies

Data loss can have **severe operational and financial impacts** on a company. The main risks include:  

- **Human Error:** Accidental deletion or modification of critical files.  
- **Hardware Failures:** Disk crashes, server failures, or faulty storage devices.  
- **Malware or Cyberattacks:** Ransomware, viruses, or hacking incidents that delete or encrypt data.  
- **Natural Disasters:** Fire, floods, earthquakes, or power surges.  

To **mitigate these risks** and ensure business continuity, the following strategies should be implemented:  

- **Regular Backups:** Schedule frequent backups of all critical data and store them in secure locations.  
- **Access Control:** Limit write/edit permissions in the database to authorized personnel only.  
- **Database Replication:** Create replicas of the master database to ensure data availability in case of failure.  
- **Monitoring and Alerts:** Implement monitoring tools to detect unusual activity or hardware issues early.  
- **Disaster Recovery Plan:** Maintain a tested plan for recovering data in case of system failure or disaster.  

Implementing these measures helps **protect the company’s data**, reduce downtime, and safeguard operational and financial stability.

*/


-- 10. Creating an order summary table and populating it from data from the other tables:

-- Review all the tables in the database
SELECT * FROM products;
SELECT * FROM orders;
SELECT * FROM order_item_refund;

-- Creating the table
CREATE TABLE order_summary (
	order_id BIGINT NOT NULL PRIMARY KEY, 
    primary_product_id BIGINT NOT NULL,    -- Foreign key
    website_session_id BIGINT NOT NULL,
    price_usd DECIMAL (8,2),
    cogs_usd DECIMAL (8,2),
    items_purchased BIGINT NOT NULL,
    created_at DATETIME
    -- FOREIGN KEY (product_id) REFERENCES products(product_id)
);

-- Populating the table
INSERT INTO order_summary
	SELECT 	
		order_id,
        SUM(CASE WHEN is_primary_item = 1 THEN product_id ELSE NULL END) AS primary_product_id,
        MIN(website_session_id) AS website_session_id,
        SUM(price_usd) AS price_usd,
        SUM(cogs_usd) AS cogs_usd,
        COUNT(order_item_id) AS items_purchased,
        MIN(created_at) AS created_at
	FROM orders
    GROUP BY 1 -- GROUP BY 1 means group by the first column, which in this case is the order_id
    ORDER BY 1; -- ORDER BY 1 means ORDER by the first column, which in this case is the order_id

-- Review the table
SELECT * FROM order_summary;


-- 11. Automating the order_summary table for when new records are added to the orders table:

-- Review the tables
SELECT * FROM orders;
SELECT * FROM order_summary;

-- Creating the trigger
CREATE TRIGGER oodersummaryUpdate
AFTER INSERT ON orders
FOR EACH ROW 
REPLACE INTO order_summary   -- Replace into avoids duplicates, and if a similar row exists, it just updates it rather than create a new one.
	SELECT 	
		order_id,
        SUM(CASE WHEN is_primary_item = 1 THEN product_id ELSE NULL END) AS primary_product_id,
        MIN(website_session_id) AS website_session_id,
        SUM(price_usd) AS price_usd,
        SUM(cogs_usd) AS cogs_usd,
        COUNT(order_item_id) AS items_purchased,
        MIN(created_at) AS created_at
	FROM orders
    WHERE order_id = NEW.order_id
    GROUP BY 1
    ORDER BY 1;


-- 12. Testing out the trigger:

-- Review the tables (before & after import)
SELECT * FROM orders;
SELECT * FROM order_summary;
SELECT * FROM order_item_refund;


-- 13. Creating a new table for the website session data and import data:

-- Creating the table
CREATE TABLE website_sessions(
	website_session_id BIGINT NOT NULL PRIMARY KEY,
    user_id BIGINT NOT NULL,
    created_at DATETIME,
    utm_source VARCHAR(50),
    utm_campaign VARCHAR (50),
    utm_content VARCHAR(50),
    device_type VARCHAR(50),
    http_referer TEXT,
    is_repeated SMALLINT
);

-- Reviewing the table (before & after import)
SELECT * FROM website_sessions;


-- 14. Creating a view for website_sessions table that summarises the performance for jan and february:

CREATE VIEW website_sessions_jan_and_feb_summary AS
	SELECT 
		YEAR(created_at) AS year,
		MONTH(created_at) AS month,
        utm_source,
        utm_campaign,
        COUNT(*) AS number_of_sessions
    FROM website_sessions
    GROUP BY year, month, utm_source, utm_campaign
    ORDER BY month,year 
;

-- Reviewing the view
SELECT * FROM website_sessions_jan_and_feb_summary;


-- 15. Creating an EER diagram for the database:

-- I have created it!


-- 16. Creating a stored procedure that pull the total_orders and total_revenue from specified startDate and endDate:

-- Reviewing the table that we're going to create the procedure on
SELECT * FROM order_summary;

-- Creating the procedure
DELIMITER //   

CREATE PROCEDURE order_perfomance (IN startDate DATETIME, IN endDate DATETIME)
BEGIN
SELECT 
	COUNT(order_id) AS total_orders,
    SUM(price_usd) AS total_revenue
 FROM order_summary WHERE DATE(created_at) BETWEEN startDate AND endDate;
END //

DELIMITER ;

-- Calling the stored procedure
CALL order_perfomance('2013-08-01','2013-12-31');


-- 17. Advice the CEO on additional website data we should track:

-- Review the data we're currenly tracking
SELECT * FROM website_sessions;
/* 
We are already tracking the user related data, and traffic source data. 
Other data that we can add are the technology data, these are the data such as the device the user used, and the the compatibility of the device and its perfomance in our website.
Additionally we should collect page view data (more importantly), such as emails the user might sent, signups, enquiries, and how long a user stayed on a certain page, These help show us how customers are moving through the website.
And other activity events.
	
*/


-- 18. Creating a website_pageviews TABLE and importing data to it:

-- Creating the table
CREATE TABLE website_pageviews (
	website_preview_id BIGINT NOT NULL PRIMARY KEY,
    website_session_id BIGINT NOT NULL,
    pageview_url TEXT,
    created_at DATETIME,
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);

-- Reviewing the table (before & after import)
SELECT * FROM website_pageviews;



-- 19. Creating a comprensive security plan for the company:

/*
# Creating a Comprehensive Security Plan for the Company

## Introduction
Security threats can be just as devastating to a company as data loss because they can disrupt operations and cause
significant financial damage. A comprehensive security plan is essential to protect company assets, data, and reputation.

## Common Security Threats
Companies face a variety of security risks, including:  

- **Ransomware:** Malicious software that encrypts company data and demands payment.  
- **Insider Threats:** Employees or contractors intentionally or accidentally compromising security.  
- **Weak Authentication:** Easily guessable passwords or lack of multi-factor authentication.  
- **SQL Injection:** Exploiting database vulnerabilities to access or manipulate data.  
- **Buffer Overflow:** Software vulnerabilities that allow unauthorized access or crashes.  
- **Denial of Service (DoS):** Attacks that disrupt access to company systems or services.  
- **Privilege Escalation:** Unauthorized users gaining higher access levels than permitted.

## Best Practices to Mitigate Security Threats
To limit these risks, companies should adopt the following strategies:  

- **Practice Safe Data Storage:** Encrypt sensitive data and store it securely.  
- **Limit Access:** Grant system and database access only to authorized personnel.  
- **Implement Strong Authentication:** Use multi-factor authentication and strong password policies.  
- **Dedicate Resources to Security:** Assign personnel or teams responsible for monitoring and maintaining security.  
- **Establish a Data Security Policy:** Document procedures, responsibilities, and protocols for all employees.  
- **Regular Backups:** Ensure critical data is backed up and recoverable.  
- **Conduct Account Auditing:** Monitor user activity and permissions regularly.  
- **Perform Periodic Security Reviews:** Assess systems, processes, and policies to identify and address vulnerabilities.  

## Conclusion
By implementing these measures, a company can **significantly reduce the risk of security breaches**, safeguard operations, protect financial 
assets, and maintain trust with stakeholders.
	
*/

-- 20. Expanding the database by importing new data and incorporating the new chat support from our website:

	-- 20.1. Import recent data to the orders and order_item_refund table, and review your order_summary table is whether the trigger is still working.alter
    
-- Review the tables (before & after import)
SELECT COUNT(*) AS total_records FROM orders;
SELECT COUNT(*) AS total_records FROM order_item_refund;
SELECT COUNT(*) AS total_records FROM order_summary;

    
    -- 20.2. Import recent data to the website_sessions and website_pageviews table.

-- Review the tables (before & after import)
SELECT COUNT(*) AS total_records FROM website_sessions;
SELECT COUNT(*) AS total_records FROM website_pageviews;
    
    -- 20.3. Create a database plan to incorporate the chat support, which will track which customers (user_id) and sessions (website_session_id) 
    -- utilize the chat support (visited_at), and which chat representative served each customer.
    
/*
since we want to know which user utilized the chat support, we'll need to track the user_id. i.e. have a column of user_id.
we'll also need to track the website_session_id
we also need to track the chat_id  which will be the primary key.
We also need the description of the chat,
And the chat_representative that served the customer.
Also the created_at column.
 */
    
    
    -- 20.4. Create the chat_support table. 
    
CREATE TABLE chat_support (
	chat_id BIGINT NOT NULL PRIMARY KEY,
    user_id BIGINT, -- not foreign key
    website_session_id BIGINT NOT NULL, -- foreign key
    chat_description TEXT,
    chat_representative VARCHAR (50),
    created_at DATETIME,
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);

-- Review the table
SELECT * FROM chat_support;
    
    
    -- 20.5. Create the second EER diagram that incorporates the new chat_support table to the existing db schema.

-- I have created it
    
    
    -- 20.6. Create a stored procedure that pulls the number of chats handled by a chat representative for a given period.
 
DELIMITER // 
CREATE PROCEDURE chat_representatives_chat_counts(IN startDate DATE,IN endDate DATE)
BEGIN
	SELECT 
		chat_representative,
		COUNT(chat_id) AS number_of_chats
	FROM chat_support 
	WHERE DATE(created_at) BETWEEN startDate AND endDate
	GROUP BY chat_representative
	ORDER BY number_of_chats DESC;
END //
DELIMITER ;    

-- Running the procedure
CALL chat_representatives_chat_counts ('2014-03-15 ','2014-03-25'); -- It works, the table just needs data import


    -- 20.7. Creating 2 views, one showing  monthly order volume and revenue, and the other showing monthly website traffic. And create a new user with access to the views only.
    
-- Creating the first view called monthly perfomance
SELECT * FROM orders; -- reviewing the table i am going to use

CREATE VIEW monthly_perfomance AS
	SELECT 
		YEAR(created_at) AS year,
		MONTH(created_at) AS month,
        COUNT(*) AS monthly_order_volume,
		SUM(price_usd) AS monthly_revenue
		FROM orders
	GROUP BY year, month
	ORDER BY year, month;    
    
-- Testing the view
SELECT * FROM monthly_perfomance;   -- It works

-- Creating the second view called monthly_website_traffic
SELECT * FROM website_sessions; -- reviewing the table i am going to use

CREATE VIEW monthly_website_traffic AS
	SELECT 
		YEAR(created_at) AS year,
		MONTH(created_at) AS month,
		COUNT(*) AS monthly_traffic
		FROM website_sessions
	GROUP BY year, month
	ORDER BY year, month; 

-- Testing the view
SELECT * FROM monthly_website_traffic;  -- it works


    -- 20.8. Writing an article of the top data security threats.
    
/*
The top security threats are:
	- Ransomware
    - Insider Threat
    - SQL injection
    - Buffer overflow
    - Denial of service
    - Weak authencation
    - Priviledge escalation
    
My recomandations for mitigating these are:
	- Backup the master DBA
    - Dedicate resources to security
    - Limit access
    - Practice safe data storage
    - Take authencation seriously
    - Have data security policy
    - Do regular account auditing
    - Conduct periodic review
 
*/





