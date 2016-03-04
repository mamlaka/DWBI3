--2. Sales Order Shipments by Name, Zip, and Quarter
SELECT D.CALQUARTER, C.ZIP, C.NAME, SUM(EXTCOST) AS TOTAL_COST, COUNT(INVENTORYKEY)  AS TOTAL_TRANSACTIONS
FROM INVENTORY_FACT F JOIN DATE_DIM D ON F.DATEKEY = D.DATEKEY
                      JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5 AND D.CALYEAR IN (2011,2012)
GROUP BY GROUPING SETS (D.CALQUARTER, 
                       C.ZIP,
                       C.NAME,
                       (D.CALQUARTER,C.ZIP),
                       (D.CALQUARTER, C.NAME),
                       (C.ZIP,C.NAME),
                       (D.CALQUARTER,C.ZIP,C.NAME),
                       ())
ORDER BY D.CALQUARTER, C.ZIP, C.NAME;