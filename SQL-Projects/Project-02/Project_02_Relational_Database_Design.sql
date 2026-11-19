CREATE DATABASE RELATIONAL
USE RELATIONAL

-- PARENT TABLES: role,user_account,status
-- CHILD TABLES : user_has_role,user_has_status
-- CREATE PARENT TABLES FIRST & THEN CHILD TABLES

CREATE TABLE role (
    id INT PRIMARY KEY,
    role_name VARCHAR(100)
);

CREATE TABLE user_account (
    id INT PRIMARY KEY,
    user_name VARCHAR(100),
    email VARCHAR(254),
    password VARCHAR(200),
    password_salt VARCHAR(50) NULL,          -- N in diagram = nullable
    password_hash_algorithm VARCHAR(50)
);

CREATE TABLE status (
    id INT PRIMARY KEY,
    status_name VARCHAR(100),
    is_user_working BIT
);

-- CHILD TABLES (WITH FOREIGN KEYS)

CREATE TABLE user_has_role (
    id INT PRIMARY KEY,
    role_start_time DATETIME2,
    role_end_time DATETIME2 NULL,            -- N in diagram = nullable
    user_account_id INT FOREIGN KEY REFERENCES user_account(id),
    role_id INT FOREIGN KEY REFERENCES role(id)
);

CREATE TABLE user_has_status (
    id INT PRIMARY KEY,
    status_start_time DATETIME2,
    status_end_time DATETIME2 NULL,          -- N in diagram = nullable
    user_account_id INT FOREIGN KEY REFERENCES user_account(id),
    status_id INT FOREIGN KEY REFERENCES status(id)
);
GO

-- Q.1] Insert data into each of the above tables. With at least two rows in each of the tables.
-- Make sure that you have created respective foreign keys. 
-- INSERT DATA (parents first) 

INSERT INTO role VALUES (1, 'Admin'), (2, 'Manager');

INSERT INTO user_account VALUES
(1, 'sameer_khan', 'sameer@example.com', 'hash123abc', 'salt1', 'SHA-256'),
(2, 'priya_sharma', 'priya@example.com', 'hash456def', NULL, 'bcrypt');

INSERT INTO status VALUES (1, 'Active', 1), (2, 'On Leave', 0);

INSERT INTO user_has_role VALUES
(1, '2026-01-01 09:00:00', NULL, 1, 1),
(2, '2026-02-15 09:00:00', NULL, 2, 2);

INSERT INTO user_has_status VALUES
(1, '2026-01-01 09:00:00', NULL, 1, 1),
(2, '2026-02-15 09:00:00', NULL, 2, 2);
GO


SELECT * FROM role
SELECT * FROM user_account
SELECT * FROM status
SELECT * FROM user_has_role
SELECT * FROM user_has_status

SP_HELP 'user_has_role'
SP_HELP 'user_has_status'

-- Q.2] Delete all the data from each of the tables. 
-- DELETE DATA (children first)

DELETE FROM user_has_role
DELETE FROM user_has_status
DELETE FROM role
DELETE FROM user_account
DELETE FROM status