--	3. Rewrite Query 1 of the Module 2 Assignment
--Using the materialized views that you created in problems 1 and 2, you should rewrite query 1 from the module 2 assignment. 
--After you submit the module 2 assignment, 
--you will have access to the solution as part of the peer assessment. 
--You should rewrite query 1 using the materialized views to replace the fact table and possibly dimension tables. 
--You should not use a CREATE VIEW statement in your solution. 
--For ease of reference, here are the requirements for query 1 of the module 2 assignment.
--Write an SQL statement to display the sum of the extended cost and the sum of the quantity. 
--The results should include data for shipments (transaction type 5) in calendar year 2011. 
--Summarize the result by calendar month and Address Category Code 1. 
--The result should include the full set of subtotals for every combination of grouped fields.

SELECT D.CALMONTH, C.ADDRCATCODE1, SUM(MV.TOTAL_COST) AS TOTAL_COST, SUM(MV.TOTAL_QUANTITY) AS TOTAL_QUANTITY
FROM SALESBYVENDORDATEKEYMV2011 MV JOIN CUST_VENDOR_DIM C ON MV.CUSTVENDORKEY = C.CUSTVENDORKEY
                                   JOIN DATE_DIM D ON MV.DATEKEY = D.DATEKEY
GROUP BY CUBE(D.CALMONTH, C.ADDRCATCODE1)
ORDER BY D.CALMONTH, C.ADDRCATCODE1;