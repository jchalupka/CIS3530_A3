CREATE OR REPLACE FUNCTION p4()
  RETURNS text AS
$$
DECLARE
  output TEXT DEFAULT '';
  customer varchar(8);
  cur_customer REFCURSOR;
  cur_transaction REFCURSOR;
  last_transaction RECORD;

BEGIN
  OPEN cur_customer FOR SELECT * FROM customer;
  LOOP
    FETCH cur_customer INTO customer;
    EXIT WHEN NOT FOUND;
    output := output || customer; 
    OPEN cur_transaction FOR
        SELECT *
        FROM transaction AS t  NATURAL JOIN customer AS c
          WHERE customer = account
            AND t_date = (SELECT MAX(t_date)
                          FROM transaction AS t
                          WHERE t.account = customer);
        FETCH cur_transaction INTO last_transaction;
        IF NOT FOUND THEN
          output := output || ' No transaction' || E'\n';
        ELSE
          output := output || ' ' || last_transaction.amount || E'\n';
        END IF;
    CLOSE cur_transaction;
  END LOOP;
  CLOSE cur_customer;
  RETURN output;
END;
$$
LANGUAGE plpgsql;
