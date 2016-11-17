-- CIS*3530 Assignment 3
-- Made By Jordan Chalupka

-- Displays information about all the transactions of a given customer
-- INPUT: Customer name
-- OUTPUT: Vendor name, date, amount

CREATE OR REPLACE FUNCTION p1(customer_name varchar(25)) 
    RETURNS text AS 
$$
  DECLARE
    c1 CURSOR FOR SELECT vname, t_date, amount
                  FROM transaction NATURAL JOIN customer NATURAL JOIN vendor
                  WHERE cname LIKE customer_name;
    vendor_name varchar(25);
    trans_date date;
    trans_amount money; 
    strresult text;

  BEGIN
    strresult := customer_name || E'''s Transaction Information:\n';
    OPEN c1;
    LOOP 
      FETCH c1 INTO vendor_name, trans_date, trans_amount;
      EXIT WHEN NOT FOUND;
      strresult := strresult || 'Vendor Name: ' || vendor_name || E'\n' 
                             || 'Transaction Date: ' || trans_date || E'\n'
                             || 'Transaction Amount: ' || trans_amount || E'\n\n';

    END LOOP;
    CLOSE c1;

    RETURN strresult;
  END;
$$ 
LANGUAGE plpgsql;
