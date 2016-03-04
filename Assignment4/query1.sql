--1. Create Materialized View for 2011 Shipments
--Write a CREATE MATERIALIZED VIEW statement according to the following specifications:
--•	The result should contain the sum of the extended cost, the sum of the quantity, and the count of inventory transactions.
--•	These calculated amounts should be summarized by the customer vendor key and the date key.
--•	The result should include only sales shipment transactions (transaction type 5) for the year 2011.
--•	The materialized view should not contain subtotals that are created by the CUBE and the ROLLUP keywords.
--•	To make the peer assessment easier, you should name your materialized view “SalesByVendorDateKeyMV2011”.
CREATE MATERIALIZED VIEW SALESBYVENDORDATEKEYMV2011
BUILD IMMEDIATE
REFRESH COMPLETE ON DEMAND
ENABLE QUERY REWRITE AS
SELECT CUSTVENDORKEY, F.DATEKEY, SUM(EXTCOST) AS TOTAL_COST, SUM(QUANTITY) AS TOTAL_QUANTITY, COUNT(*) AS TOTAL_TRANSACTIONS
FROM INVENTORY_FACT F JOIN DATE_DIM D ON F.DATEKEY = D.DATEKEY
WHERE TRANSTYPEKEY = 5 AND CALYEAR = 2011 
GROUP BY CUSTVENDORKEY, F.DATEKEY;