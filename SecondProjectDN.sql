
--Second Project By Daniel Nasi--

--------11111111111111----------


WITH CTE AS 
    (SELECT
        YEAR(so.orderdate) AS Year,
        SUM(sl.unitprice*sl.PickedQuantity) AS IncomePerYear,
        COUNT(DISTINCT MONTH(so.OrderDate)) AS NumberOfDistinctMonths
    FROM Sales.Orders SO JOIN Sales.OrderLines SL 
	on SO.OrderID = SL.OrderID
    GROUP BY YEAR(so.OrderDate)),

CTE2 AS 
    (SELECT
        Year, IncomePerYear, NumberOfDistinctMonths,
        (IncomePerYear / NumberOfDistinctMonths) * 12 AS YearlyLinearIncome
    FROM CTE),

CTE3 AS 
    (SELECT
        Year, IncomePerYear, NumberOfDistinctMonths, YearlyLinearIncome,
        ROUND((YearlyLinearIncome - LAG(YearlyLinearIncome) OVER (ORDER BY Year)) / 
        LAG(YearlyLinearIncome) OVER (ORDER BY Year) * 100, 2) AS GrowthRate
    FROM CTE2)

SELECT
    Year, IncomePerYear,
    NumberOfDistinctMonths,
    YearlyLinearIncome, GrowthRate
FROM CTE3
ORDER BY Year


-----------222222222222------------
GO

WITH CTE AS (
    SELECT 
        YEAR(so.OrderDate) AS TheYear,
        DATEPART(Quarter,so.OrderDate) AS TheQuarter,
        CustomerName,
        SUM(SLL.ExtendedPrice-SLL.TaxAmount) AS IncomePerYear
    FROM Sales.InvoiceLines SLL JOIN Sales.Invoices SI 
	ON SLL.InvoiceID = SI.InvoiceID
		JOIN Sales.orders SO ON SI.OrderID = SO.OrderID 
		JOIN Sales.Customers SC ON SO.CustomerID = SC.CustomerID
    GROUP BY 
        YEAR(so.OrderDate), DATEPART(Quarter,so.OrderDate), CustomerName
),
CTE2 AS (
    SELECT 
        TheYear, TheQuarter,
        CustomerName, IncomePerYear,
        ROW_NUMBER() OVER ( PARTITION BY TheYear, TheQuarter 
        ORDER BY IncomePerYear DESC ) AS DNR
    FROM CTE)

SELECT 
    TheYear, TheQuarter,
    CustomerName, IncomePerYear, DNR
FROM CTE2
WHERE DNR <= 5
ORDER BY TheYear, TheQuarter, DNR


-----------3333333333333----------
GO

SELECT TOP 10 WS.StockItemID, WS.StockItemName, SUM(IL.ExtendedPrice - IL.TaxAmount) AS "TotalProfit"
FROM Warehouse.StockItems WS JOIN Sales.InvoiceLines IL
ON WS.StockItemID = IL.StockItemID 
GROUP BY  WS.StockItemID, WS.StockItemName
ORDER BY TotalProfit DESC


----------44444444444444-----------
GO

SELECT
ROW_NUMBER() OVER (ORDER BY WS.RecommendedRetailPrice - WS.UnitPrice DESC) AS Rn,
WS.StockItemID, WS.StockItemName, WS.UnitPrice,WS.RecommendedRetailPrice,
(WS.RecommendedRetailPrice - WS.UnitPrice) AS NominalProductProfit,
DENSE_RANK() OVER (ORDER BY RecommendedRetailPrice - UnitPrice DESC) AS DNR
From Warehouse.StockItems WS
WHERE ValidFrom <= GETDATE() AND ValidTo > GETDATE()


---------555555555555555----------
GO

SELECT CONCAT_WS ('-', PS.SupplierID, PS.SupplierName) AS SupplierDetails,
STRING_AGG (CONCAT_WS(' ', WS.StockItemID, WS.StockItemName), ', /') AS ProductDetails
FROM Purchasing.Suppliers PS JOIN Warehouse.StockItems WS
ON PS.SupplierID = WS.SupplierID
GROUP BY PS.SupplierID, PS.SupplierName;


--------6666666666666666-----------
GO

SELECT TOP 5 SI.CustomerID, AC.CityName, ACT.CountryName,
ACT.Continent,ACT.Region, FORMAT(SUM(SL.ExtendedPrice),'N') AS TotalExtendedPrice
FROM Sales.customers SC JOIN sales.orders SO
ON SC.CustomerID = SO.CustomerID 
JOIN Sales.Invoices SI
ON SO.OrderID = SI.OrderID
JOIN Sales.InvoiceLines SL 
ON SI.InvoiceID = SL.InvoiceID 
JOIN Application.Cities AC
ON SC.DeliverycityID = AC.CityID
JOIN Application.StateProvinces AP 
ON AC.StateProvinceID = AP.StateProvinceID
JOIN Application.Countries ACT
ON AP.CountryID = ACT.CountryID
GROUP BY SI.CustomerID, AC.CityName, ACT.CountryName, ACT.Continent, ACT.Region
ORDER BY  SUM(SL.ExtendedPrice) DESC


--------777777777777777-----------
GO

WITH CTE AS (
    SELECT 
        YEAR(OrderDate) AS OrderYear,
        MONTH(OrderDate) AS OrderMonth,
        SUM(SIL.ExtendedPrice - SIL.TaxAmount) AS MonthlyTotal
    FROM Sales.Orders SO JOIN Sales.Invoices SI
	ON SO.OrderID = SI.OrderID
    JOIN Sales.InvoiceLines SIL 
	ON SI.InvoiceID = SIL.InvoiceID
    GROUP BY YEAR(OrderDate), MONTH(OrderDate))

SELECT OrderYear,
       CASE WHEN OrderMonth IS NULL THEN 'Grand Total'
			ELSE CAST(OrderMonth AS VARCHAR)
	   END AS OrderMonth,
       MonthlyTotal, CumulativeTotal
	   FROM (SELECT OrderYear, OrderMonth, MonthlyTotal,
				    SUM(MonthlyTotal) OVER (PARTITION BY OrderYear ORDER BY OrderMonth) AS CumulativeTotal
			 FROM CTE
       UNION ALL

SELECT OrderYear, NULL AS OrderMonth,
       SUM(MonthlyTotal) AS MonthlyTotal,
       SUM(MonthlyTotal) AS CumulativeTotal
FROM CTE
GROUP BY OrderYear) AS Result
ORDER BY OrderYear, CumulativeTotal ASC


--------8888888888888888----------
GO

WITH CTE AS 
	(SELECT YEAR(SA.OrderDate) AS OrderYear, MONTH(SA.OrderDate) AS OrderMonth,
	COUNT(SA.OrderID) AS OrderCount
	FROM Sales.Orders SA
	GROUP BY YEAR(SA.OrderDate), MONTH(SA.OrderDate))

SELECT OrderMonth, [2013],[2014],[2015],
CASE 
WHEN [2016] IS NULL THEN 0
ELSE [2016]
	END AS '2016'
From CTE
PIVOT(SUM(OrderCount)
For OrderYear IN ([2013],[2014],[2015],[2016])) AS "PIVOT"


--------9999999999999----------
GO

WITh CTE AS 
     (SELECT SC.CustomerID, SC.CustomerName, SO.OrderDate
     ,LAG(SO.OrderDate) OVER(PARTITION BY SC.CustomerID ORDER BY SO.OrderDate) AS PreviousOrderDate
	 ,MAX(SO.OrderDate) OVER(PARTITION BY SC.customerID) AS LastOrder
     FROM Sales.Customers SC JOIN Sales.Orders SO
     ON SC.CustomerID = SO.CustomerID),

CTE2 AS 
    (SELECT CustomerID, CustomerName, OrderDate, PreviousOrderDate
    ,DATEDIFF(DD, LastOrder, MAX(OrderDate) OVER()) AS DaysSinceLastOrder
    ,AVG(DATEDIFF(DD, PreviousOrderDate, OrderDate)) OVER(PARTITION BY CustomerID) AS AvgDaysBetweenOrders
	FROM CTE)

SELECT CustomerID, CustomerName, OrderDate, PreviousOrderDate, DaysSinceLastOrder, AvgDaysBetweenOrders,
CASE 
WHEN DaysSinceLastOrder > AvgDaysBetweenOrders*2
THEN 'Potential Churn'
ELSE 'Active'
        END AS CustomerStatus
FROM CTE2
ORDER BY CustomerID


--------10101010101010---------
GO

WITH CTE AS 
		(SELECT  CC.CustomerCategoryName
		,CASE
			WHEN CustomerName LIKE 'Tailspin%' THEN 'Tailspin'
			WHEN CustomerName LIKE 'Wingtip%' THEN 'Wingtip'
			ELSE CustomerName
		END AS CustomerName
	    FROM Sales.CustomerCategories CC RIGHT JOIN Sales.Customers SC
		ON SC.CustomerCategoryID = CC.CustomerCategoryID ),
 
 CTE2 AS ( SELECT
			CustomerCategoryName 
		   ,COUNT(DISTINCT CustomerName) AS CustomerCount
		 FROM CTE
		 GROUP BY CustomerCategoryName )

SELECT CustomerCategoryName,CustomerCount
,SUM(CustomerCount) OVER() AS TotalCustCount
,CONCAT (ROUND(CAST((CustomerCount*100) AS FLOAT)/
(SUM(CustomerCount) OVER()),2),'%') AS DistributionFactor
FROM CTE2
