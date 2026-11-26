# Case Study 1: Danny's Diner

## Project Overview

Danny opened a small Japanese restaurant called **Danny's Diner** in early 2021. He needs help analyzing customer data to understand their visiting patterns, spending habits, and favorite menu items.

This project uses Microsoft SQL Server to answer the 10 questions in the [8 Week SQL Challenge - Case Study 1](https://8weeksqlchallenge.com/case-study-1/). The results help Danny improve the restaurant's customer experience and evaluate his loyalty program.

## Database Schema

The case study uses three related tables:

### `sales`

Stores every customer purchase.

| Column | Description |
|---|---|
| `customer_id` | ID of the customer |
| `order_date` | Date of the purchase |
| `product_id` | ID of the purchased menu item |

### `menu`

Stores menu items and prices.

| Column | Description |
|---|---|
| `product_id` | Unique menu item ID |
| `product_name` | Name of the menu item |
| `price` | Item price |

The available items are sushi (`$10`), curry (`$15`), and ramen (`$12`).

### `members`

Stores customer loyalty membership start dates.

| Column | Description |
|---|---|
| `customer_id` | ID of the customer |
| `join_date` | Date the customer joined the loyalty program |

## Business Questions

1. What is the total amount each customer spent at the restaurant?
2. How many days has each customer visited the restaurant?
3. What was the first item from the menu purchased by each customer?
4. What is the most purchased item on the menu, and how many times was it purchased by all customers?
5. Which item was the most popular for each customer?
6. Which item was purchased first by the customer after they became a member?
7. Which item was purchased just before the customer became a member?
8. What is the total items and amount spent for each member before they became a member?
9. If each $1 spent equates to 10 points and sushi has a 2x points multiplier, how many points would each customer have?
10. In the first week after joining the program (including the join date), a customer earns 2x points on all items. How many points would customer A and customer B have at the end of January?

## SQL Concepts Used

- `SELECT`, `FROM`, `WHERE`, and `ORDER BY`
- `JOIN` operations
- `GROUP BY` and aggregate functions
- `CASE` expressions
- Common Table Expressions (CTEs)
- Window functions
- Date calculations with `DATEADD`
- Ranking and row numbering

## Project Files

- [`dannysdinnercasestudy_solution.sql`](dannysdinnercasestudy_solution.sql) — database setup and solutions to all 10 questions
- [`README.md`](README.md) — project documentation

## Getting Started

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio or Azure Data Studio

### Setup

1. Open SQL Server Management Studio or Azure Data Studio.
2. Connect to your SQL Server instance.
3. Open `dannysdinnercasestudy_solution.sql`.
4. Execute the script to create the database, insert the sample data, and run the analysis queries.

> Note: The solution file includes the table setup and `USE` statements for the case study.

## Key Learnings

- Designing and querying a small relational database
- Combining customer, order, menu, and membership data
- Applying joins, aggregation, ranking, and conditional logic
- Calculating customer behavior, product popularity, and loyalty points
- Translating business questions into maintainable T-SQL queries

## Reference

- [Danny's Diner - 8 Week SQL Challenge](https://8weeksqlchallenge.com/case-study-1/)
