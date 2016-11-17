-- CIS*3530 Assignment 3
-- Made By Jordan Chalupka

-- Inserts a new customer record
-- INPUT: account, cname, province, crlimit
-- OUTPUT: All customer records

CREATE OR REPLACE FUNCTION p3
    (customer_account varchar(8), customer_name varchar(25), customer_province varchar(25),crlimit money)
    RETURNS SETOF customer AS
$$
  BEGIN
    INSERT INTO customer VALUES
    (customer_account, customer_name, customer_province, 0, crlimit);
    
    RETURN QUERY SELECT * FROM customer;
  END;
$$
LANGUAGE plpgsql;
