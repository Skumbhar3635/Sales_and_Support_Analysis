--------------------------------------------- INTERVIEW_DATABASE -------------------------------------------------------------
create database interview;

use interview;

CREATE TABLE IF NOT EXISTS `agents` (
  `AGENT_CODE` varchar(6) NOT NULL DEFAULT '',
  `AGENT_NAME` varchar(40) DEFAULT NULL,
  `WORKING_AREA` varchar(35) DEFAULT NULL,
  `COMMISSION` decimal(10,2) DEFAULT NULL,
  `PHONE_NO` varchar(15) DEFAULT NULL,
  `COUNTRY` varchar(25) DEFAULT NULL,
  PRIMARY KEY (`AGENT_CODE`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `agents`
--

INSERT INTO `agents` (`AGENT_CODE`, `AGENT_NAME`, `WORKING_AREA`, `COMMISSION`, `PHONE_NO`, `COUNTRY`) VALUES
('A007  ', 'Ramasundar                              ', 'Bangalore                          ', '0.15', '077-25814763   ', '\r'),
('A003  ', 'Alex                                    ', 'London                             ', '0.13', '075-12458969   ', '\r'),
('A008  ', 'Alford                                  ', 'New York                           ', '0.12', '044-25874365   ', '\r'),
('A011  ', 'Ravi Kumar                              ', 'Bangalore                          ', '0.15', '077-45625874   ', '\r'),
('A010  ', 'Santakumar                              ', 'Chennai                            ', '0.14', '007-22388644   ', '\r'),
('A012  ', 'Lucida                                  ', 'San Jose                           ', '0.12', '044-52981425   ', '\r'),
('A005  ', 'Anderson                                ', 'Brisban                            ', '0.13', '045-21447739   ', '\r'),
('A001  ', 'Subbarao                                ', 'Bangalore                          ', '0.14', '077-12346674   ', '\r'),
('A002  ', 'Mukesh                                  ', 'Mumbai                             ', '0.11', '029-12358964   ', '\r'),
('A006  ', 'McDen                                   ', 'London                             ', '0.15', '078-22255588   ', '\r'),
('A004  ', 'Ivan                                    ', 'Torento                            ', '0.15', '008-22544166   ', '\r'),
('A009  ', 'Benjamin                                ', 'Hampshair                          ', '0.11', '008-22536178   ', '\r');

--
-- Table structure for table `customer`
--

CREATE TABLE IF NOT EXISTS `customer` (
  `CUST_CODE` varchar(6) NOT NULL,
  `CUST_NAME` varchar(40) NOT NULL,
  `CUST_CITY` varchar(35) DEFAULT NULL,
  `WORKING_AREA` varchar(35) NOT NULL,
  `CUST_COUNTRY` varchar(20) NOT NULL,
  `GRADE` decimal(10,0) DEFAULT NULL,
  `OPENING_AMT` decimal(12,2) NOT NULL,
  `RECEIVE_AMT` decimal(12,2) NOT NULL,
  `PAYMENT_AMT` decimal(12,2) NOT NULL,
  `OUTSTANDING_AMT` decimal(12,2) NOT NULL,
  `PHONE_NO` varchar(17) NOT NULL,
  `AGENT_CODE` varchar(6) DEFAULT NULL,
  KEY `CUSTCITY` (`CUST_CITY`),
  KEY `CUSTCITY_COUNTRY` (`CUST_CITY`,`CUST_COUNTRY`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `customer`
--

INSERT INTO `customer` (`CUST_CODE`, `CUST_NAME`, `CUST_CITY`, `WORKING_AREA`, `CUST_COUNTRY`, `GRADE`, `OPENING_AMT`, `RECEIVE_AMT`, `PAYMENT_AMT`, `OUTSTANDING_AMT`, `PHONE_NO`, `AGENT_CODE`) VALUES
('C00013', 'Holmes', 'London                             ', 'London', 'UK', '2', '6000.00', '5000.00', '7000.00', '4000.00', 'BBBBBBB', 'A003  '),
('C00001', 'Micheal', 'New York                           ', 'New York', 'USA', '2', '3000.00', '5000.00', '2000.00', '6000.00', 'CCCCCCC', 'A008  '),
('C00020', 'Albert', 'New York                           ', 'New York', 'USA', '3', '5000.00', '7000.00', '6000.00', '6000.00', 'BBBBSBB', 'A008  '),
('C00025', 'Ravindran', 'Bangalore                          ', 'Bangalore', 'India', '2', '5000.00', '7000.00', '4000.00', '8000.00', 'AVAVAVA', 'A011  '),
('C00024', 'Cook', 'London                             ', 'London', 'UK', '2', '4000.00', '9000.00', '7000.00', '6000.00', 'FSDDSDF', 'A006  '),
('C00015', 'Stuart', 'London                             ', 'London', 'UK', '1', '6000.00', '8000.00', '3000.00', '11000.00', 'GFSGERS', 'A003  '),
('C00002', 'Bolt', 'New York                           ', 'New York', 'USA', '3', '5000.00', '7000.00', '9000.00', '3000.00', 'DDNRDRH', 'A008  '),
('C00018', 'Fleming', 'Brisban                            ', 'Brisban', 'Australia', '2', '7000.00', '7000.00', '9000.00', '5000.00', 'NHBGVFC', 'A005  '),
('C00021', 'Jacks', 'Brisban                            ', 'Brisban', 'Australia', '1', '7000.00', '7000.00', '7000.00', '7000.00', 'WERTGDF', 'A005  '),
('C00019', 'Yearannaidu', 'Chennai                            ', 'Chennai', 'India', '1', '8000.00', '7000.00', '7000.00', '8000.00', 'ZZZZBFV', 'A010  '),
('C00005', 'Sasikant', 'Mumbai                             ', 'Mumbai', 'India', '1', '7000.00', '11000.00', '7000.00', '11000.00', '147-25896312', 'A002  '),
('C00007', 'Ramanathan', 'Chennai                            ', 'Chennai', 'India', '1', '7000.00', '11000.00', '9000.00', '9000.00', 'GHRDWSD', 'A010  '),
('C00022', 'Avinash', 'Mumbai                             ', 'Mumbai', 'India', '2', '7000.00', '11000.00', '9000.00', '9000.00', '113-12345678', 'A002  '),
('C00004', 'Winston', 'Brisban                            ', 'Brisban', 'Australia', '1', '5000.00', '8000.00', '7000.00', '6000.00', 'AAAAAAA', 'A005  '),
('C00023', 'Karl', 'London                             ', 'London', 'UK', '0', '4000.00', '6000.00', '7000.00', '3000.00', 'AAAABAA', 'A006  '),
('C00006', 'Shilton', 'Torento                            ', 'Torento', 'Canada', '1', '10000.00', '7000.00', '6000.00', '11000.00', 'DDDDDDD', 'A004  '),
('C00010', 'Charles', 'Hampshair                          ', 'Hampshair', 'UK', '3', '6000.00', '4000.00', '5000.00', '5000.00', 'MMMMMMM', 'A009  '),
('C00017', 'Srinivas', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '4000.00', '3000.00', '9000.00', 'AAAAAAB', 'A007  '),
('C00012', 'Steven', 'San Jose                           ', 'San Jose', 'USA', '1', '5000.00', '7000.00', '9000.00', '3000.00', 'KRFYGJK', 'A012  '),
('C00008', 'Karolina', 'Torento                            ', 'Torento', 'Canada', '1', '7000.00', '7000.00', '9000.00', '5000.00', 'HJKORED', 'A004  '),
('C00003', 'Martin', 'Torento                            ', 'Torento', 'Canada', '2', '8000.00', '7000.00', '7000.00', '8000.00', 'MJYURFD', 'A004  '),
('C00009', 'Ramesh', 'Mumbai                             ', 'Mumbai', 'India', '3', '8000.00', '7000.00', '3000.00', '12000.00', 'Phone No', 'A002  '),
('C00014', 'Rangarappa', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'AAAATGF', 'A001  '),
('C00016', 'Venkatpati', 'Bangalore                          ', 'Bangalore', 'India', '2', '8000.00', '11000.00', '7000.00', '12000.00', 'JRTVFDD', 'A007  '),
('C00011', 'Sundariya', 'Chennai                            ', 'Chennai', 'India', '3', '7000.00', '11000.00', '7000.00', '11000.00', 'PPHGRTS', 'A010  ');

-- Table structure for table `orders`
--

CREATE TABLE IF NOT EXISTS `orders` (
  `ORD_NUM` decimal(6,0) NOT NULL,
  `ORD_AMOUNT` decimal(12,2) NOT NULL,
  `ADVANCE_AMOUNT` decimal(12,2) NOT NULL,
  `ORD_DATE` date NOT NULL,
  `CUST_CODE` varchar(6) NOT NULL,
  `AGENT_CODE` varchar(6) NOT NULL,
  `ORD_DESCRIPTION` varchar(60) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`ORD_NUM`, `ORD_AMOUNT`, `ADVANCE_AMOUNT`, `ORD_DATE`, `CUST_CODE`, `AGENT_CODE`, `ORD_DESCRIPTION`) VALUES
('200100', '1000.00', '600.00', '2008-01-08', 'C00015', 'A003  ', 'SOD\r'),
('200110', '3000.00', '500.00', '2008-04-15', 'C00019', 'A010  ', 'SOD\r'),
('200107', '4500.00', '900.00', '2008-08-30', 'C00007', 'A010  ', 'SOD\r'),
('200112', '2000.00', '400.00', '2008-05-30', 'C00016', 'A007  ', 'SOD\r'),
('200113', '4000.00', '600.00', '2008-06-10', 'C00022', 'A002  ', 'SOD\r'),
('200102', '2000.00', '300.00', '2008-05-25', 'C00012', 'A012  ', 'SOD\r'),
('200114', '3500.00', '2000.00', '2008-08-15', 'C00002', 'A008  ', 'SOD\r'),
('200122', '2500.00', '400.00', '2008-09-16', 'C00003', 'A004  ', 'SOD\r'),
('200118', '500.00', '100.00', '2008-07-20', 'C00023', 'A006  ', 'SOD\r'),
('200119', '4000.00', '700.00', '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
('200121', '1500.00', '600.00', '2008-09-23', 'C00008', 'A004  ', 'SOD\r'),
('200130', '2500.00', '400.00', '2008-07-30', 'C00025', 'A011  ', 'SOD\r'),
('200134', '4200.00', '1800.00', '2008-09-25', 'C00004', 'A005  ', 'SOD\r'),
('200115', '2000.00', '1200.00', '2008-02-08', 'C00013', 'A013  ', 'SOD\r'),
('200108', '4000.00', '600.00', '2008-02-15', 'C00008', 'A004  ', 'SOD\r'),
('200103', '1500.00', '700.00', '2008-05-15', 'C00021', 'A005  ', 'SOD\r'),
('200105', '2500.00', '500.00', '2008-07-18', 'C00025', 'A011  ', 'SOD\r'),
('200109', '3500.00', '800.00', '2008-07-30', 'C00011', 'A010  ', 'SOD\r'),
('200101', '3000.00', '1000.00', '2008-07-15', 'C00001', 'A008  ', 'SOD\r'),
('200111', '1000.00', '300.00', '2008-07-10', 'C00020', 'A008  ', 'SOD\r'),
('200104', '1500.00', '500.00', '2008-03-13', 'C00006', 'A004  ', 'SOD\r'),
('200106', '2500.00', '700.00', '2008-04-20', 'C00005', 'A002  ', 'SOD\r'),
('200125', '2000.00', '600.00', '2008-10-10', 'C00018', 'A005  ', 'SOD\r'),
('200117', '800.00', '200.00', '2008-10-20', 'C00014', 'A001  ', 'SOD\r'),
('200123', '500.00', '100.00', '2008-09-16', 'C00022', 'A002  ', 'SOD\r'),
('200120', '500.00', '100.00', '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
('200116', '500.00', '100.00', '2008-07-13', 'C00010', 'A009  ', 'SOD\r'),
('200124', '500.00', '100.00', '2008-06-20', 'C00017', 'A007  ', 'SOD\r'),
('200126', '500.00', '100.00', '2008-06-24', 'C00022', 'A002  ', 'SOD\r'),
('200129', '2500.00', '500.00', '2008-07-20', 'C00024', 'A006  ', 'SOD\r'),
('200127', '2500.00', '400.00', '2008-07-20', 'C00015', 'A003  ', 'SOD\r'),
('200128', '3500.00', '1500.00', '2008-07-20', 'C00009', 'A002  ', 'SOD\r'),
('200135', '2000.00', '800.00', '2008-09-16', 'C00007', 'A010  ', 'SOD\r'),
('200131', '900.00', '150.00', '2008-08-26', 'C00012', 'A012  ', 'SOD\r'),
('200133', '1200.00', '400.00', '2008-06-29', 'C00009', 'A002  ', 'SOD\r'),
('200132', '4000.00', '2000.00', '2008-08-15', 'C00013', 'A013  ', 'SOD\r');




----------------------------------------------------------------------------------------------------------------------------
 
--------------------------------------- PROJECT_5_SALES_AND_SUPPORT_ANALYSIS  ----------------------------------------------



------------------------------------ Segment_1 - Database_Tables_Columns_Relationships -------------------------------------

# 1. Identify the tables in the database and their respective columns.

SELECT table_name, column_name
FROM information_schema.columns
WHERE table_schema = 'interview';

# 2. Determine the number of records in each table within the schema.

SELECT TABLE_NAME, TABLE_ROWS
FROM INFORMATION_SCHEMA.TABLES
WHERE TABLE_SCHEMA = 'interview';


# 3. Identify and handle any missing or inconsistent values in the dataset.
--  For the agents table:
SELECT COLUMN_NAME
FROM information_schema.columns
WHERE TABLE_NAME = 'agents'
  AND TABLE_SCHEMA = 'interview'
  AND IS_NULLABLE = 'YES';

--  For the customer table:
SELECT COLUMN_NAME
FROM information_schema.columns
WHERE TABLE_NAME = 'customer'
  AND TABLE_SCHEMA = 'interview'
  AND IS_NULLABLE = 'YES';
  
--  For the orders table:
SELECT COLUMN_NAME
FROM information_schema.columns
WHERE TABLE_NAME = 'orders'
  AND TABLE_SCHEMA = 'interview'
  AND IS_NULLABLE = 'YES';
/*This query will list the column names in each table that allow NULL values.*/
  

# 4. Analyse the data types of the columns in each table to ensure they are appropriate for the stored data.

Describe agents;
Describe customer;
describe orders;
/*This query will provide information about the columns and their data types, along with additional details such as whether 
a column can contain NULL values and any default values.*/

# 5.Identify any duplicate records within the tables and develop a strategy for handling them.

SELECT AGENT_CODE, AGENT_NAME, COUNT(*) AS duplicate_count
FROM agents
GROUP BY AGENT_CODE,AGENT_NAME
HAVING COUNT(*) > 1;
/*The query identifies duplicate records within the agents table by grouping records based on both AGENT_CODE and AGENT_NAME. 
It counts the number of occurrences for each combination and filters for those 
combinations (HAVING COUNT(*) > 1) where the count is greater than 1. 
These combinations represent duplicate records in the table.*/
	




---------------------------------------- Segment_2 - Basic_Sales_Analysis -----------------------------------------

# 1. Write SQL queries to retrieve the total number of orders, total revenue, and average order value.

SELECT COUNT(DISTINCT ORD_NUM) AS Total_Orders, 
ROUND(SUM(ORD_AMOUNT),2) AS Total_Revenue ,
ROUND(AVG(ORD_AMOUNT),2) AS Average_Order_Value
FROM orders;


# 2. The operations team needs to track the agent who has handled the maximum number of high-grade customers.
	# Write a SQL query to find the agent_name who has the highest count of customers with a grade of 5. 
      # Display the agent_name and the count of high-grade customers.

SELECT a.AGENT_NAME, COUNT(*) AS high_grade_customers_count
FROM agents a
JOIN customer c ON a.AGENT_CODE = c.AGENT_CODE
WHERE c.GRADE = 3 
GROUP BY a.AGENT_NAME
ORDER BY high_grade_customers_count DESC
limit 1 ;
/* The query counts the number of high-grade customers (grade 3) each agent has, 
groups the results by agent name, orders them in descending order by the count, 
and limits the result to the top agent with the most high-grade customers using the LIMIT 1 clause.*/


# 3. The company wants to identify the most active customer cities in terms of the total order amount. 
     # Write a SQL query to find the top 3 customer cities with the highest total order amount. 
        # Include cust_city and total_order_amount in the output.

SELECT c.CUST_CITY, SUM(o.ORD_AMOUNT) AS total_order_amount
FROM customer c
JOIN orders o ON c.CUST_CODE = o.CUST_CODE
GROUP BY c.CUST_CITY
ORDER BY total_order_amount DESC
LIMIT 3;
/*The query retrieves the total order amount for each city by joining the customer and orders tables on 
the CUST_CODE column. It then groups the results by CUST_CITY, calculates the sum of order amounts for each city, 
and sorts the cities in descending order by total order amount. Finally, it limits the result to the top 3 cities
 with the highest total order amounts using LIMIT 3.*/
    
    


------------------------------------------- Segment_3 - Customer_Analysis ---------------------------------------

# 1. Calculate the total number of customers.

SELECT DISTINCT COUNT(*) AS total_customers
FROM customer;
/*This query will provide you with the total number of customers in the "customer" table.*/



# 2. Identify the top-spending customers based on their total order value.

SELECT c.CUST_NAME, SUM(o.ORD_AMOUNT) AS total_order_value
FROM customer c
JOIN orders o ON c.CUST_CODE = o.CUST_CODE
GROUP BY c.CUST_NAME
ORDER BY total_order_value DESC;
/*This query identifies the top-spending customers based on their total order value.
It joins the "customer" table with the "orders" table on the customer code (CUST_CODE).
It calculates the total order value for each customer using SUM(ORD_AMOUNT) and groups the results by customer name (CUST_NAME).
The results are then ordered in descending order by total order value, and you can limit the results to the top N customers*/



# 3. Analyse customer retention by calculating the percentage of repeat customers.

SELECT
  SUM(CASE WHEN OrderCount > 1 THEN 1 ELSE 0 END) AS RepeatCustomers,
  COUNT(*) AS TotalCustomers,
  (SUM(CASE WHEN OrderCount > 1 THEN 1 ELSE 0 END) / COUNT(*)) * 100 AS PercentageRepeatCustomers
FROM (
  SELECT C.CUST_CODE, COUNT(*) AS OrderCount
  FROM customer C
  JOIN orders O ON C.CUST_CODE = O.CUST_CODE
  GROUP BY C.CUST_CODE
) AS CustomerOrders;

/*This query calculates the percentage of repeat customers.
It starts by counting the number of orders each customer has placed using a subquery.
The subquery counts the number of orders (COUNT(*)) for each customer (CUST_CODE).
The main query then sums up the cases where the order count is greater than 1 (indicating repeat customers) and counts the total number of customers.
Finally, it calculates the percentage of repeat customers by dividing the sum of repeat customers by the total number of customers and multiplying it by 100.*/



# 4. Find the name of the customer who has the maximum outstanding amount from every country

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

/*this SQL query uses a window function to rank customers by their outstanding amounts within each country. 
It then selects the customer with the highest outstanding amount (rank 1) from each country and displays their name
, country, and outstanding amount in the result.*/



# 5. Write a SQL query to calculate the percentage of customers in each grade category (1 to 5). 

SELECT GRADE,
COUNT(*) AS total_customers,
COUNT(*) / (SELECT COUNT(*) FROM customer) * 100 AS percentage
FROM customer
GROUP BY GRADE
order by GRADE asc;

/*Selected the GRADE column from the "customer" table.
Counted the number of customers in each grade category and alias it as total_customers.
Calculated the percentage of customers in each grade category by dividing the count by the total count of 
customers in the entire table and multiply by 100, alias it as percentage.
Grouped the rows by the GRADE column.
Ordered the result set in ascending order of the GRADE column.*/

    



---------------------------------------- Segment_4 - Agent_Performance_Analysis --------------------------------------------

# 1. Company wants to provide a performance bonus to their best agents based on the maximum order amount. 
     # Find the top 5 agents eligible for it.
     
SELECT a.AGENT_NAME, MAX(o.ORD_AMOUNT) AS max_order_amount
FROM agents a
JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE
GROUP BY a.AGENT_NAME
ORDER BY max_order_amount DESC
LIMIT 5;
/*This query retrieves the top 5 agents with the maximum order amounts they've processed.
It joins the "agents" table with the "orders" table using the agent code.
It calculates the maximum order amount for each agent using MAX(ORD_AMOUNT).
The results are grouped by agent name and ordered in descending order of the maximum order amount.*/



# 2. The company wants to analyse the performance of agents based on the number of orders they have handled. 
     # Write a SQL query to rank agents based on the total number of orders they have processed. 
        # Display agent_name, total_orders, and their respective ranking.
        
SELECT a.AGENT_NAME,
       COUNT(o.ORD_NUM) AS total_orders,
       DENSE_RANK() OVER (ORDER BY COUNT(o.ORD_NUM) DESC) AS agent_rank
FROM agents a
JOIN orders o ON a.AGENT_CODE = o.AGENT_CODE
GROUP BY a.AGENT_CODE, a.AGENT_NAME
ORDER BY agent_rank;
/*Selects agent names (AGENT_NAME).
Counts the total number of orders each agent has handled (total_orders).
Calculates the ranking of agents based on order counts (agent_rank).
Groups the results by agent code and agent name.
Orders the result set by agent ranking in ascending order.*/



# 3. Company wants to change the commission for the agents, basis advance payment they collected. 
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

/*this SQL query calculates the average advance amount collected by each agent, 
rounds it to two decimal places, and determines the updated commission for each agent based on certain conditions 
using a CASE expression. The result provides agent names, their average advance amounts, and the corresponding updated commissions.*/
    
    



---------------------------------------------- Segment_5 - SQL_Tasks ------------------------------------------------------

# 1. Add a new column named avg_rcv_amt in the table customers which contains the average receive amount for every country. 
     # Display all columns from the customer table along with the avg_rcv_amt column in the last.
     
SELECT *,
       (SELECT round(Avg(RECEIVE_AMT),2) FROM customer AS c2 WHERE c2.CUST_COUNTRY = c1.CUST_COUNTRY) AS avg_rcv_amt
FROM customer AS c1;
/*This query Select all columns from the "customer" table,
Uses a subquery to calculate the average receive amount for each country, round it to two decimal places.
Alias the calculated average as avg_rcv_amt.*/


# 2, Write a sql query to create and call a UDF named avg_amt to return the average outstanding amount of the customers which are managed by a given agent. 
	# Also, call the UDF with the agent name ‘Mukesh’.

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


# 3. Write a sql query to create and call a subroutine called cust_detail to return all the details of the customer which are having the given grade. 
     # Also, call the subroutine with grade 2.
 
 -- Step1: Create the stored procedure cust_detail.
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


# 4. Write a stored procedure sp_name which will return the concatenated ord_num (comma separated) of the customer with input customer code using cursor. 
      # Also, write the procedure call query with cust_code ‘C00015’.

-- Step1: Create stored procedure sp_name.
DELIMITER //
CREATE PROCEDURE sp_name(IN p_cust_code VARCHAR(6))
BEGIN
  SELECT CONCAT_WS(', ', GROUP_CONCAT(ORD_NUM)) AS concatenated_ord_nums
  FROM orders
  WHERE CUST_CODE = p_cust_code;
END//
DELIMITER ;

-- Step2: call the stored procedure with cust_code 'C00015'.
CALL sp_name('C00015');

