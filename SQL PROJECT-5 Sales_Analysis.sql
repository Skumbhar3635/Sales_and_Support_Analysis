---  Segment1 - Database - Tables, Columns, Relationships ---

--- 1. Identify the tables in the database and their respective columns.

SELECT table_name, column_name
FROM information_schema.columns
WHERE table_schema = 'interview';

--- 2. Determine the number of records in each table within the schema.

SELECT TABLE_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'interview';

--- 3. Identify and handle any missing or inconsistent values in the dataset.

SELECT * FROM agents where AGENT_CODE is null;
SELECT * FROM agents where AGENT_NAME is null;
SELECT * FROM agents where WORKING_AREA is null;
SELECT * FROM agents where COMMISSION is null;
SELECT * FROM agents where PHONE_NO is null;
SELECT * FROM agents where COUNTRY is null;

SELECT * FROM customer where CUST_CODE is null;
SELECT * FROM customer where CUST_NAME is null;
SELECT * FROM customer where CITY is null;
SELECT * FROM customer where WORKING_AREA is null;
SELECT * FROM customer where CUST_COUNTRY is null;
SELECT * FROM customer where GRADE is null;
SELECT * FROM customer where OPENING_AMT is null;
SELECT * FROM customer where RECEIVE_AMT is null;
SELECT * FROM customer where PAYMENT_AMT is null;
SELECT * FROM customer where OUTSTANDING_AMT is null;
SELECT * FROM customer where PHONE_NO is null;
SELECT * FROM customer where AGENT_CODE is null;

SELECT * FROM orders where ORD_NUM is null;
SELECT * FROM orders where ORD_AMOUNT is null;
SELECT * FROM orders where ADVANCE_AMOUNT is null;
SELECT * FROM orders where ORD_DATE is null;
SELECT * FROM orders where CUST_CODE is null;
SELECT * FROM orders where AGENT_CODE is null;
SELECT * FROM orders where ORD_DESCRIPTION is null;

--- 4. Analyse the data types of the columns in each table to ensure they are appropriate for the stored data.

Describe agents;
Describe customer;
describe orders;

--- 5. Identify any duplicate records within the tables and develop a strategy for handling them.

SELECT AGENT_CODE, AGENT_NAME, COUNT(*) AS duplicate_count
FROM agents
GROUP BY AGENT_CODE,AGENT_NAME
HAVING COUNT(*) > 1;
	
	
	
	

--- Segment2 - Basic Sales Analysis ---

--- 1. Write SQL queries to retrieve the total number of orders, total revenue, and average order value.

select count(distinct ORD_NUM) as Total_Orders from orders;

select sum(ORD_AMOUNT) as Total_Revenue from orders;

select avg(ORD_AMOUNT) as Average_Order_Value from orders; 
    
select * from agents;


--- 2. The operations team needs to track the agent who has handled the maximum number of high-grade customers.
	# Write a SQL query to find the agent_name who has the highest count of customers with a grade of 5. 
      # Display the agent_name and the count of high-grade customers.

SELECT a.AGENT_NAME, COUNT(*) AS high_grade_customers_count
FROM agents a
JOIN customer c ON a.AGENT_CODE = c.AGENT_CODE
WHERE c.GRADE = 3
GROUP BY a.AGENT_NAME
ORDER BY high_grade_customers_count DESC
limit 1 ;

--- 3. The company wants to identify the most active customer cities in terms of the total order amount. 
     # Write a SQL query to find the top 3 customer cities with the highest total order amount. 
        # Include cust_city and total_order_amount in the output.

SELECT c.CUST_CITY, SUM(o.ORD_AMOUNT) AS total_order_amount
FROM customer c
JOIN orders o ON c.CUST_CODE = o.CUST_CODE
GROUP BY c.CUST_CITY
ORDER BY total_order_amount DESC
LIMIT 3;




---- Segment3 - Customer Analysis ---

--- 1. Calculate the total number of customers.

SELECT distinct COUNT(*) AS total_customers
FROM customer;

--- 2. Identify the top-spending customers based on their total order value.

SELECT c.CUST_NAME, SUM(o.ORD_AMOUNT) AS total_order_value
FROM customer c
JOIN orders o ON c.CUST_CODE = o.CUST_CODE
GROUP BY c.CUST_NAME
ORDER BY total_order_value DESC;

--- 3. Analyse customer retention by calculating the percentage of repeat customers.

SELECT 
COUNT(DISTINCT CUST_CODE) AS total_customers, 
COUNT(ORD_NUM) AS total_orders,
COUNT(ORD_NUM) / COUNT(DISTINCT CUST_CODE) * 100 AS repeat_customer_percentage
FROM orders;

--- 4. Find the name of the customer who has the maximum outstanding amount from every country

SELECT CUST_NAME, CUST_COUNTRY, OUTSTANDING_AMT
FROM (
    SELECT
        CUST_NAME,
        CUST_COUNTRY,
        OUTSTANDING_AMT,
        RANK() OVER (PARTITION BY CUST_COUNTRY ORDER BY OUTSTANDING_AMT DESC) AS outstanding_rank
    FROM customer
) AS ranked_customers
WHERE outstanding_rank = 1;

--- 5. Write a SQL query to calculate the percentage of customers in each grade category (1 to 5). 

SELECT GRADE,
COUNT(*) AS total_customers,
COUNT(*) / (SELECT COUNT(*) FROM customer) * 100 AS percentage
FROM customer
GROUP BY GRADE
order by GRADE asc;




--- Segment 4 - Agent Performance Analysis ---

--- 1. Company wants to provide a performance bonus to their best agents based on the maximum order amount. 
     # Find the top 5 agents eligible for it.
     
SELECT a.AGENT_NAME, MAX(o.ORD_AMOUNT) AS max_order_amount
FROM agents a
JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE
GROUP BY a.AGENT_NAME
ORDER BY max_order_amount DESC
LIMIT 5;

--- 2. The company wants to analyse the performance of agents based on the number of orders they have handled. 
     # Write a SQL query to rank agents based on the total number of orders they have processed. 
        # Display agent_name, total_orders, and their respective ranking.
        
SELECT a.AGENT_NAME,
       COUNT(o.ORD_NUM) AS total_orders,
       DENSE_RANK() OVER (ORDER BY COUNT(o.ORD_NUM) DESC) AS agent_rank
FROM agents a
JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE
GROUP BY a.AGENT_CODE, a.AGENT_NAME
ORDER BY agent_rank;


--- 3. Company wants to change the commission for the agents, basis advance payment they collected. 
     # Write a sql query which creates a new column updated_commision on the basis below rules.
        # If the average advance amount collected is less than 750, there is no change in commission.
        # If the average advance amount collected is between 750 and 1000 (inclusive), the new commission will be 1.5 times the old commission.
        # If the average advance amount collected is more than 1000, the new commission will be 2 times the old commission.

SELECT 
    a.AGENT_NAME,
    ROUND(AVG(o.ADVANCE_AMOUNT), 2) AS avg_advance_amount,
    CASE 
        WHEN AVG(o.ADVANCE_AMOUNT) < 750 THEN a.COMMISSION
        WHEN AVG(o.ADVANCE_AMOUNT) BETWEEN 750 AND 1000 THEN a.COMMISSION * 1.5
        WHEN AVG(o.ADVANCE_AMOUNT) > 1000 THEN a.COMMISSION * 2
    END AS updated_commission
FROM agents a
JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE
GROUP BY a.AGENT_NAME, a.COMMISSION;






--------- Segment 5: SQL Tasks ------------------------

--- 1. Add a new column named avg_rcv_amt in the table customers which contains the average receive amount for every country. Display all columns from the customer table along with the avg_rcv_amt column in the last.
     
SELECT *,
       (SELECT round(Avg(RECEIVE_AMT),2) FROM customer AS c2 WHERE c2.CUST_COUNTRY = c1.CUST_COUNTRY) AS avg_rcv_amt
FROM customer AS c1;


--- 2, Write a sql query to create and call a UDF named avg_amt to return the average outstanding amount of the customers which are managed by a given agent. Also, call the UDF with the agent name ‘Mukesh’.

-- Step1: Create the UDF avg_amt:   
DELIMITER //
CREATE FUNCTION avg_amt(agent_name VARCHAR(40))
RETURNS DECIMAL(12,2)
BEGIN
  DECLARE avg_outstanding DECIMAL(12,2);
  
  SELECT AVG(OUTSTANDING_AMT) INTO avg_outstanding
  FROM customer
  WHERE AGENT_CODE IN (SELECT AGENT_CODE FROM agents WHERE AGENT_NAME = agent_name);
  
  RETURN avg_outstanding;
END//
DELIMITER ;


-- Step 2: Call the UDF with the agent name 'Mukesh'
SELECT avg_amt('Mukesh');



--- 3. Write a sql query to create and call a subroutine called cust_detail to return all the details of the customer which are having the given grade. Also, call the subroutine with grade 2.
 
--- Step1: Create the stored procedure cust_detail.
DELIMITER //
CREATE PROCEDURE cust_detail(IN p_grade DECIMAL(10, 0))
BEGIN
  SELECT *
  FROM customer
  WHERE GRADE = p_grade;
END//
DELIMITER ;

-- Step2: Call the stored procedure with grade 2.     
CALL cust_detail(2);


--- 4. Write a stored procedure sp_name which will return the concatenated ord_num (comma separated) of the customer with input customer code using cursor. Also, write the procedure call query with cust_code ‘C00015’.

-- Step1: Create stored procedure sp_name.
DELIMITER //
CREATE PROCEDURE sp_name(IN p_cust_code VARCHAR(6))
BEGIN
  SELECT CONCAT_WS(', ', GROUP_CONCAT(ORD_NUM)) AS concatenated_ord_nums
  FROM orders
  WHERE CUST_CODE = p_cust_code;
END//
DELIMITER ;

-- Step1: call the stored procedure with cust_code 'C00015'.
CALL sp_name('C00015');







