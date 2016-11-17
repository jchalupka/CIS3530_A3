-- CIS*3530 Assignment 3
-- Made By Jordan Chalupka

-- Displays information about customers who have transactions with a given vendor
-- INPUT: Vendor name
-- OUTPUT: Customer numbers, customer names, provinces

CREATE OR REPLACE FUNCTION p2(vendor_name varchar(25))
    RETURNS text AS
$$
  DECLARE
    c1 CURSOR FOR SELECT account, cname, province
                  FROM vendor natural join transaction natural join customer
                  WHERE vname LIKE vendor_name;
    account_number varchar(8);
    customer_name varchar(25);
    customer_province varchar(25);
    strresult text;

  BEGIN
    strresult := 'Customers who have transactions with ' || vendor_name || E':\n';
    OPEN c1;
    LOOP
      FETCH c1 INTO account_number, customer_name, customer_province;
      EXIT WHEN NOT FOUND;
      strresult := strresult || 'Account Number: ' || account_number || E'\n' 
                             || 'Customer Name: ' || customer_name || E'\n'
                             || 'Province: ' || customer_province || E'\n\n';
    END LOOP;
    CLOSE c1;

    RETURN strresult;
  END;
$$
LANGUAGE plpgsql;
