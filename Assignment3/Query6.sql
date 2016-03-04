--Query 6: Ratio to report applied to the entire result
--
--Calculate the ratio to report of the sum of extended cost for adjustments (transaction type 1). You should sort on descending order by sum of extended cost. 
--The result should contain the second item id, sum of extended cost, and ratio to report.
SELECT SECONDITEMID, SUM(EXTCOST) AS TOTAL_COST, RATIO_TO_REPORT (SUM(EXTCOST)) OVER () AS RATIO_TO_REPORT
FROM INVENTORY_FACT F JOIN ITEM_MASTER_DIM I ON F.ITEMMASTERKEY = I.ITEMMASTERKEY
WHERE TRANSTYPEKEY = 1
GROUP BY SECONDITEMID
ORDER BY 2 DESC;