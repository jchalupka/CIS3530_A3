-- CIS*3530 Assignment 3
-- Made by Jordan Chalupka

-- Delete previous tables if any
\i ./clean_tables.sql 
-- end of delete

-- Create tables
CREATE TABLE vendor
(
  Vno varchar(8),
  Vname varchar(25),
  City varchar(25),
  Vbalance money,
  PRIMARY KEY (Vno)
);

CREATE TABLE customer
(
  Account varchar(8),
  Cname varchar(25),
  Province varchar(25),
  Cbalance money,
  Crlimit money,
  PRIMARY KEY (Account)
);

CREATE TABLE transaction
(
  Tno varchar(8),
  Vno varchar(8),
  Account varchar(8),
  T_Date date,
  Amount money,
  PRIMARY KEY (Tno)
);
-- End of create tables

-- Initialize tables
INSERT INTO vendor
VALUES 
  ('V1', 'Sears', 'Toronto', 200.00),
  ('V2', 'WalMart', 'Waterloo', 671.05),
  ('V3', 'Esso', 'Windsor', 0.00),
  ('V4', 'Esso', 'Waterloo', 225.00);

INSERT INTO customer
VALUES
  ('A1', 'Smith', 'ONT', 2525.00, 2000.00),
  ('A2', 'Jones', 'BC', 2014.00, 2500.00),
  ('A3', 'Doc', 'ONT', 150.00, 1000);

INSERT INTO transaction
VALUES
  ('T1', 'V2', 'A1', '2016-07-15', 1325.00),
  ('T2', 'V2', 'A3', '2015-12-16', 1900.00),
  ('T3', 'V3', 'A1', '2016-09-01', 2500.00),
  ('T4', 'V4', 'A2', '2016-03-20', 1613.00),
  ('T5', 'V4', 'A3', '2016-07-31', 3312.00);
-- End of initialize tables
