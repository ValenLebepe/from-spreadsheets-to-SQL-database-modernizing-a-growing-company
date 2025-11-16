-- Triggers, excerpted from the masters script

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
