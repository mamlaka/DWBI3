--Query 3: Ranking and dense ranking within the entire result
--
--Use both RANK and DENSE_RANK functions to rank customers in descending order by the count of inventory transactions for shipments (transaction type 5). 
--You should use the entire result as a single partition. 
--The result should include the customer name, count of transactions, rank, and dense rank.
SELECT NAME, COUNT(*) AS TOTAL_TRANSACTIONS, RANK () OVER (ORDER BY COUNT(*) DESC) AS CUST_STATE_RANK, DENSE_RANK () OVER (ORDER BY COUNT(*) DESC) AS CUST_STATE_DENSE_RANK
FROM INVENTORY_FACT F JOIN CUST_VENDOR_DIM C ON F.CUSTVENDORKEY = C.CUSTVENDORKEY
WHERE TRANSTYPEKEY = 5
GROUP BY NAME;