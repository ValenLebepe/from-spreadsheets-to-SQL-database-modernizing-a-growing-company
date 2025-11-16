-- Views, excerpted from the masters script

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