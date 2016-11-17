-- INPUT none
-- OUTPUT vendor numbers, vendor names, new balances
-- SIDE EFFECT sum of the transactions of every vendor in the transaction table is added to the vendor's current balance.

CREATE OR REPLACE FUNCTION p5()
    RETURNS text AS
$$
DECLARE
  cur_vendor  REFCURSOR;
  vendor_sum  money;
  output  TEXT DEFAULT '';
  my_vendor RECORD;

BEGIN
  OPEN cur_vendor FOR SELECT * FROM vendor;
  LOOP
    FETCH cur_vendor INTO my_vendor;
    EXIT WHEN NOT FOUND;
    SET vendor_sum = (SELECT SUM(ammount) 
                      FROM transaction 
                      GROUP BY vno 
                      WHERE
    output := output || my_vendor.vno || ' ' || my_vendor.vname || ' ' || my_vendor.vbalance || E'\n';
  END LOOP;
  RETURN output;
END
$$
LANGUAGE plpgsql;
