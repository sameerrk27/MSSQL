CREATE DATABASE dannys_diner;
USE dannys_diner;

SET search_path = dannys_diner;

CREATE TABLE sales (
  customer_id VARCHAR(1),
  order_date DATE,
  product_id INTEGER
);

INSERT INTO sales
  (customer_id, order_date, product_id)
VALUES
  ('A', '2021-01-01', '1'),
  ('A', '2021-01-01', '2'),
  ('A', '2021-01-07', '2'),
  ('A', '2021-01-10', '3'),
  ('A', '2021-01-11', '3'),
  ('A', '2021-01-11', '3'),
  ('B', '2021-01-01', '2'),
  ('B', '2021-01-02', '2'),
  ('B', '2021-01-04', '1'),
  ('B', '2021-01-11', '1'),
  ('B', '2021-01-16', '3'),
  ('B', '2021-02-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-01', '3'),
  ('C', '2021-01-07', '3');
 



CREATE TABLE menu (
  product_id INTEGER,
  product_name VARCHAR(5),
  price INTEGER
);

INSERT INTO menu
  (product_id, product_name, price)
VALUES
  ('1', 'sushi', '10'),
  ('2', 'curry', '15'),
  ('3', 'ramen', '12');
  

CREATE TABLE members (
  customer_id VARCHAR(1),
  join_date DATE
);

INSERT INTO members
  (customer_id, join_date)
VALUES
  ('A', '2021-01-07'),
  ('B', '2021-01-09');

  SELECT * FROM sales
  SELECT * FROM menu
  SELECT * FROM members

  -----------------------------------------------------------------------------------------------------------------------------------------------------

-- 1. What is the total amount each customer spent at the restaurant?
 SELECT s.customer_id,sum(m.price) as Total_customers FROM sales s
 INNER JOIN menu m
 ON s.product_id = m.product_id
 GROUP BY s.customer_id

 -----------------------------------------------------------------------------------------------------------------------------------------------------

-- 2. How many days has each customer visited the restaurant?
SELECT 
customer_id,count(distinct(order_date)) as Visited_Customers
FROM sales
GROUP BY customer_id

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 3. What was the first item from the menu purchased by each customer?
SELECT customer_id , product_name AS first_product FROM (
SELECT customer_id , product_name,
ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY order_date) row_num
from sales s
INNER JOIN menu m
ON s.product_id = m.product_id) t
WHERE row_num = 1

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 4. What is the most purchased item on the menu and how many times was it purchased by all customers?
WITH most_purchased 
as (
SELECT Top 1 m.product_name FROM 
sales s
INNER JOIN menu m 
ON s.product_id = m.product_id
GROUP BY product_name 
ORDER BY count(*) DESC)                -- got the most purchased item on the menu

SELECT customer_id, count(*) as total_purchase FROM sales s
INNER JOIN menu m
ON s.product_id = m.product_id
WHERE m.product_name in (SELECT product_name FROM most_purchased )
GROUP BY customer_id                   -- got how many times was it purchased by all customers

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 5. Which item was the most popular for each customer?
SELECT customer_id,product_name FROM (
SELECT customer_id,product_name,
   ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY COUNT(*) DESC) AS row_num
FROM sales s 
INNER JOIN menu m
ON s.product_id = m.product_id
GROUP BY customer_id,product_name) T
WHERE row_num = 1

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 6. Which item was purchased first by the customer after they became a member?
WITH cte AS (
SELECT
     s.customer_id,
     m.product_name,
     DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date) AS rnk
FROM sales s
INNER JOIN menu m     ON s.product_id = m.product_id
INNER JOIN members mb ON s.customer_id = mb.customer_id
WHERE s.order_date >= mb.join_date
)
SELECT customer_id, product_name
FROM cte
WHERE rnk = 1
ORDER BY customer_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 7. Which item was purchased just before the customer became a member?
WITH cte AS (
SELECT
      s.customer_id,
      m.product_name,
      DENSE_RANK() OVER (PARTITION BY s.customer_id ORDER BY s.order_date DESC) AS rnk
FROM sales s
INNER JOIN menu m     ON s.product_id = m.product_id
INNER JOIN members mb ON s.customer_id = mb.customer_id
WHERE s.order_date < mb.join_date
)
SELECT customer_id, product_name
FROM cte
WHERE rnk = 1
ORDER BY customer_id, product_name;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 8. What is the total items and amount spent for each member before they became a member?
SELECT s.customer_id, SUM(price) Total_Price 
FROM sales s
INNER JOIN menu m ON s.product_id = m.product_id          -- want to know members : INNER JOIN
LEFT JOIN members mb ON s.customer_id = mb.customer_id    -- don't want to know members : LEFT JOIN
WHERE order_date<join_date or join_date IS NULL
GROUP BY s.customer_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier and
      -- how many points would each customer have?
SELECT
    s.customer_id,
    SUM(CASE WHEN m.product_name = 'sushi' THEN m.price * 20
             ELSE m.price * 10 END) AS total_points
FROM sales s
INNER JOIN menu m ON s.product_id = m.product_id
GROUP BY s.customer_id
ORDER BY s.customer_id;

-----------------------------------------------------------------------------------------------------------------------------------------------------

-- 10. In the first week after a customer joins the program (including their join date) they earn 2x points on all items,
     --not just sushi - how many points do customer A and B have at the end of January?
WITH cte AS (
SELECT
        s.customer_id,
        s.order_date,
        mb.join_date,
        DATEADD(DAY, 7, mb.join_date) AS first_week_end,
        m.product_name,
        m.price
FROM sales s
INNER JOIN menu m     ON s.product_id = m.product_id
INNER JOIN members mb ON s.customer_id = mb.customer_id
WHERE s.order_date >= mb.join_date
AND s.order_date <= '2021-01-31'
)
SELECT customer_id,
SUM(CASE
        WHEN product_name = 'sushi' THEN price * 20
        WHEN order_date < first_week_end THEN price * 20
        ELSE price * 10
        END
    ) AS total_points
FROM cte
GROUP BY customer_id
ORDER BY customer_id;