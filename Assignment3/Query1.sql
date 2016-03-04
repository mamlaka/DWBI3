--Query 1: Ranking within the entire result

--Use the RANK function to rank customers in descending order by the sum of extended cost for shipments (transaction type 5). 
--You should use the entire result as a single partition. The result should include the customer name, sum of the extended cost, and rank.
SELECT NAME, SUM(EXTCOST) AS TOTAL_COST, RANK () OVER (ORDER BY SUM(EXTCOST) DESC) AS CUST_RANK
FROM INVENTORY_FACT F JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5
GROUP BY NAME;