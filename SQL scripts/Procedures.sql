-- Procedures, excerpted from the masters script

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


-- 20.6. Create a stored procedure that pulls the number of chats handled by the chat representatives for a given period.
 
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
CALL chat_representatives_chat_counts ('2014-03-15 ','2014-03-25');

