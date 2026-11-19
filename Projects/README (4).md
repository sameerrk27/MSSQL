# Querying a Large Relational Database

## Project Description

This project demonstrates SQL querying techniques using the Microsoft **AdventureWorks** relational database. AdventureWorks is a large sample database containing interconnected data related to customers, employees, sales, products, inventory, purchasing, and manufacturing.

The project explores the database schema, identifies relationships between tables, and uses SQL queries to retrieve, filter, aggregate, and combine business data. It provides practical experience with SQL Server and real-world relational database concepts.

## Problem Statement

The challenge was to answer business-related questions using data distributed across multiple related tables. Without a clear understanding of the database schema, it was difficult to determine:

- Which tables contain the required information
- How related tables are connected
- How to join tables without producing duplicate or incorrect results
- How to filter and aggregate data correctly
- How to write efficient queries for a large database
- How to present query results in a meaningful format

## Objectives

- Explore the structure of the AdventureWorks database
- Understand primary key and foreign key relationships
- Retrieve records using `SELECT`, `WHERE`, `ORDER BY`, and `TOP`
- Combine data using `INNER JOIN`, `LEFT JOIN`, and other join types
- Perform calculations with aggregate functions such as `COUNT`, `SUM`, `AVG`, `MIN`, and `MAX`
- Categorize and summarize records using `GROUP BY` and `HAVING`
- Use subqueries and SQL Server functions where required
- Write readable and efficient SQL queries
- Present query results in a clear and understandable format

## Database

This project uses the **AdventureWorks** sample database.

The database includes multiple interconnected schemas and tables, such as:

- **Person** – Customer and employee information
- **Sales** – Orders, customers, sales territories, and invoices
- **Production** – Products, categories, inventory, and manufacturing information
- **Purchasing** – Vendors, purchase orders, and supplier details
- **HumanResources** – Department and employee details

Download or restore the database from:

https://github.com/Microsoft/sql-server-samples/releases/tag/adventureworks

## Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio or Azure Data Studio
- Relational database concepts
- Microsoft AdventureWorks database

## Challenges Faced

- **Understanding the database structure:** AdventureWorks contains many tables across different schemas. Identifying which tables held the data needed for each question was challenging. I reviewed the tables, columns, and relationships before writing each query.

- **Choosing the correct tables and columns:** Some business information was spread across multiple tables. I checked the schema and used the relevant tables and columns to retrieve the required data.

- **Writing accurate joins:** Incorrect join conditions could create duplicate rows or omit records. I used the relationships between primary and foreign keys to choose the appropriate join columns and checked the results.

- **Handling large result sets:** Queries could return more records than needed, making the output harder to review. I used filters, sorting, and limits where appropriate to focus on relevant results.

- **Using aggregate functions correctly:** Summarizing data with functions such as `COUNT`, `SUM`, and `AVG` required grouping the results at the right level. I selected suitable `GROUP BY` columns and checked that the summaries made sense.

- **Filtering grouped data:** It was sometimes unclear whether a condition should be applied before or after aggregation. I used `WHERE` to filter individual rows and `HAVING` to filter grouped results.

- **Handling `NULL` values:** Missing values affected comparisons and calculations. I checked for `NULL` values and used `IS NULL`, `IS NOT NULL`, or functions such as `COALESCE` when suitable.

- **Making queries readable:** Queries with multiple joins and conditions became difficult to follow. I used consistent formatting, table aliases, and clear column names to make them easier to understand.

- **Verifying query results:** A query could run successfully but still return incorrect or unexpected results. I reviewed sample rows, checked row counts, and refined the query when the output did not match expectations.

## SQL Concepts Used

- `SELECT`
- `FROM`
- `WHERE`
- `GROUP BY`
- `HAVING`
- `ORDER BY`
- `JOIN`
- Subqueries
- Common Table Expressions
- Aggregate functions
- String and date functions
- `CAST` and `CONVERT`
- `CASE` expressions
- `NULL` handling
- Aliases
- SQL Server execution plans

## Project Structure

```text
.
├── README.md
└── sql/
    └── queries.sql
```

Update this structure to reflect the actual files in the repository.

## Getting Started

### Prerequisites

- Microsoft SQL Server
- SQL Server Management Studio or Azure Data Studio
- The AdventureWorks database restored on SQL Server

### Setup

1. Download the AdventureWorks backup from Microsoft SQL Server Samples.
2. Restore the database to your SQL Server instance.
3. Open SQL Server Management Studio or Azure Data Studio.
4. Connect to your SQL Server instance.
5. Select the AdventureWorks database.
6. Open the project SQL file and execute the queries.

```sql
USE AdventureWorks;
GO
```

## Example Query

```sql
SELECT TOP 10
    ProductID,
    Name,
    ListPrice
FROM Production.Product
WHERE ListPrice > 0
ORDER BY ListPrice DESC;
```

## Results

The project demonstrates how SQL can be used to:

- Retrieve relevant business records
- Identify relationships between tables
- Combine information from multiple sources
- Produce sales, product, customer, and employee summaries
- Transform raw database records into meaningful insights
- Validate query output using filtering and row counts

## Learning Outcomes

After completing this project, I gained practical experience in:

- Navigating a large relational database
- Reading and interpreting database schemas
- Writing T-SQL joins and aggregate queries
- Troubleshooting incorrect query results
- Handling data quality and `NULL` values
- Improving query readability
- Understanding basic SQL Server performance concepts
- Using SQL to support business analysis
