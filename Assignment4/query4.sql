--	4. Rewrite Query 2 of the Module 2 Assignment
--Using the materialized views that you created in problems 1 and 2, you should rewrite query 2 from the module 2 assignment. 
--After you submit the module 2 assignment, you will have access to the solution as part of the peer assessment. 
--You should rewrite query 2 using the materialized views to replace the fact table and possibly dimension tables. 
--You can use either the CUBE or GROUPING SETS operator in your solution. 
--You should not use a CREATE VIEW statement in your solution. For ease of reference, here are the requirements for query 2 of the module 2 assignment.
--Write an SQL statement to display the sum of the extended cost and the number of inventory transactions. 
--The results should include data for shipments (transaction type 5) in calendar years 2011 and 2012. 
--Summarize the result by calendar quarter, customer zip code, and customer name. 
--The result should include the grouped columns and the full set of subtotals for every combination of grouped columns.

SELECT CALQUARTER, ZIP, NAME, SUM(TOTAL_COST) AS TOTAL_COST, SUM(TOTAL_TRANSACTIONS) AS TOTAL_TRANSACTIONS
FROM( 
SELECT D.CALQUARTER, C.ZIP, C.NAME, TOTAL_COST, TOTAL_TRANSACTIONS
FROM SALESBYVENDORDATEKEYMV2011 MV JOIN DATE_DIM D ON MV.DATEKEY = D.DATEKEY
                                   JOIN CUST_VENDOR_DIM C ON MV.CUSTVENDORKEY = C.CUSTVENDORKEY
UNION
SELECT D.CALQUARTER, C.ZIP, C.NAME, TOTAL_COST, TOTAL_TRANSACTIONS
FROM SALESBYVENDORDATEKEYMV2012 MV JOIN DATE_DIM D ON MV.DATEKEY = D.DATEKEY
                                   JOIN CUST_VENDOR_DIM C ON MV.CUSTVENDORKEY = C.CUSTVENDORKEY
)
GROUP BY CUBE (CALQUARTER, ZIP, NAME)
ORDER BY 1,2,3;

