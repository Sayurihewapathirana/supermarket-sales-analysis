SELECT * FROM sales_data;

--Total Revenue
SELECT SUM(sales) AS total_revenue
FROM sales_data;

--Total Profit
SELECT SUM(gross_income) AS total_profit
FROM sales_data;

--Average Sales per Transaction
SELECT ROUND( AVG(sales),2) AS avg_sales
FROM sales_data;

--Total Quantity Sold
SELECT SUM(quantity) AS total_quantity
FROM sales_data;

--Profit Rate (Profit Margin)
SELECT ROUND((100 * SUM(gross_income) / SUM(sales)),2)  AS profit_rate
FROM sales_data;

-- Revenue by Product Line
SELECT product_line, SUM(sales) AS revenue
FROM sales_data
GROUP BY product_line
ORDER BY revenue DESC;

-- Revenue by Branch
SELECT branch,SUM(sales) AS revenue
FROM sales_data
GROUP BY branch;

-- Monthly Sales & Profit Trend (ONE LINE CHART)
SELECT month_name, SUM(sales) AS monthly_sales,SUM(gross_income) AS monthly_profit
FROM sales_data
GROUP BY month_name
ORDER BY SUM(sales) desc;

--Profit by Product line
SELECT product_line, SUM(gross_income) AS profit
FROM sales_data
GROUP BY product_line
ORDER BY profit DESC;

-- Payment Method Distribution
SELECT payment, SUM(sales) AS total_sales
FROM sales_data
GROUP BY payment;

--Customer Segment Revenue
SELECT customer_type, gender, SUM(sales) AS total_sales
FROM sales_data
GROUP BY customer_type, gender;

SELECT round(AVG(sales)/count(invoice_id),2) AS avg_sales
FROM sales_data;

-- Average Rating
SELECT AVG(rating) AS avg_rating
FROM sales_data;

--Sales by Product & Gender (Stacked Column)
SELECT product_line, gender,
SUM(sales) AS total_sales
FROM sales_data
GROUP BY product_line, gender
ORDER BY product_line;

 -- Sales Summary View
CREATE VIEW sales_summary AS
SELECT
    branch,
    product_line,
    month_name,
    SUM(sales) AS total_sales,
    SUM(gross_income) AS total_profit,
    SUM(quantity) AS total_quantity
FROM sales_data
GROUP BY branch, product_line, month_name;

--Customer Summary View
CREATE VIEW customer_summary AS
SELECT
    customer_type,
    gender,
    COUNT(invoice_id) AS total_transactions,
    SUM(sales) AS total_sales,
  ROUND ( AVG(rating),2) AS avg_rating
FROM sales_data
GROUP BY customer_type, gender;

--Top-Selling Product Line by Quantity
SELECT 
    product_line,
    SUM(quantity) AS total_quantity_sold
FROM sales_data
GROUP BY product_line
ORDER BY total_quantity_sold DESC;
