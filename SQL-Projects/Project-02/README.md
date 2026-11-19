# Relational Database Design

## Project Description

This project demonstrates how to convert a relational design into tables in Microsoft SQL Server. The design contains users, roles, user accounts, account statuses, and the relationships between them.

The project converts the entities and relationships into SQL Server tables, adds primary and foreign keys, inserts sample data, and deletes the data in the correct child-to-parent order.

## Problem Statement

How do you convert a relational design into tables in SQL Server?

The task is to create the database, define parent and child relationships, insert at least two rows in every table, maintain valid foreign-key references, display the records, and remove the data after testing.

## User Roles Data Schema

![User Roles Data Schema](User-Roles-Schema.png)

The diagram contains five tables:

- `role`
- `user_account`
- `statuses`
- `user_has_role`
- `user_has_status`

## Database Tables

### Parent Tables

| Table | Primary Key | Purpose |
|---|---|---|
| `role` | `id` | Stores available roles, such as Admin and Manager |
| `user_account` | `id` | Stores user names and authentication details |
| `statuses` | `id` | Stores account statuses and whether the user is working |

### Child Tables

| Table | Primary and Foreign Keys | Purpose |
|---|---|---|
| `user_has_role` | `id` as primary key; `user_account_id` and `role_id` as foreign keys | Assigns roles to user accounts |
| `user_has_status` | `id` as primary key; `user_account_id` and `status_id` as foreign keys | Assigns statuses to user accounts |

## Topics Covered

- Relational database design
- Entity and attribute definition
- Primary keys
- Foreign keys
- SQL Server table creation
- Sample data insertion
- Data deletion
- Child-before-parent deletion
- Null and non-null values

## Objectives

- Convert the relational design into SQL Server tables
- Define primary keys for every table
- Create foreign keys for every relationship
- Insert at least two records into each table
- Verify that foreign-key relationships work correctly
- Delete all test data

## Technologies Used

- Microsoft SQL Server
- T-SQL
- SQL Server Management Studio or Azure Data Studio

## Project Structure

```text
SQL-Projects/
└── Project-02/
    ├── README.md
    ├── User-Roles-Schema.png
    └── Project_02_Relational_Database_Design.sql
```

## SQL File

The complete SQL implementation is available in:

- [`Project_02_Relational_Database_Design.sql`](Project_02_Relational_Database_Design.sql)

## Getting Started

1. Open SQL Server Management Studio or Azure Data Studio.
2. Connect to a SQL Server instance.
3. Open `Project_02_Relational_Database_Design.sql`.
4. Execute the script from top to bottom.
5. Review the tables and inserted records.

## Parent-First Creation Order

The parent tables are created before the child tables:

```sql
role
user_account
statuses
user_has_role
user_has_status
```

## Relationship Examples

- One `user_account` can have one or more roles through `user_has_role`.
- A `role` can be assigned to one or more user accounts.
- One `user_account` can have one or more statuses through `user_has_status`.
- A `statuses` record can be assigned to one or more user accounts.

## Foreign Keys

- `user_has_role.user_account_id` references `user_account.id`
- `user_has_role.role_id` references `role.id`
- `user_has_status.user_account_id` references `user_account.id`
- `user_has_status.status_id` references `statuses.id`

## Data Insertion

At least two rows are inserted into each table. Parent data is inserted before child data so that all foreign keys reference existing records.

## Deleting the Data

To avoid foreign-key conflicts, child tables must be deleted before parent tables:

```sql
DELETE FROM user_has_role;
DELETE FROM user_has_status;
DELETE FROM role;
DELETE FROM user_account;
DELETE FROM statuses;
```

## Learning Outcomes

After completing this project, I learned:

- How to convert a relational diagram into SQL tables
- How to choose primary keys
- How to create foreign-key relationships
- How to insert data in a valid parent-to-child order
- How to verify table relationships
- How to delete child data before parent data
