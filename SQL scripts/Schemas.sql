-- Schemas, excerpted from the masters script

-- Creating the schema
CREATE SCHEMA mavenbearbuilders;    -- This is the schema name I chose to use for the NovaCart Retail Company

-- Create the tables to house the data.
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
   
CREATE TABLE products (  -- Creating the produts table
	product_id BIGINT NOT NULL PRIMARY KEY,
    created_at DATETIME,
    product_name VARCHAR (50)
);

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

CREATE TABLE website_pageviews (
	website_preview_id BIGINT NOT NULL PRIMARY KEY,
    website_session_id BIGINT NOT NULL,
    pageview_url TEXT,
    created_at DATETIME,
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);

CREATE TABLE chat_support (
	chat_id BIGINT NOT NULL PRIMARY KEY,
    user_id BIGINT, -- not foreign key
    website_session_id BIGINT NOT NULL, -- foreign key
    chat_description TEXT,
    chat_representative VARCHAR (50),
    created_at DATETIME,
    FOREIGN KEY (website_session_id) REFERENCES website_sessions(website_session_id)
);