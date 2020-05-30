/*
Tb_Supplier(Supp_ID, Name, City, State)
Tb_Consumer(Con_ID, Name, City, State)
Tb_Product(Prod_ID, Name, Product_Category, Product_Line,
Product_Packaging)
Tb_Offers(Supp_ID, Prod_ID, Quantity, Price)
Tb_Requests(Con_ID, Prod_ID, Quantity, Price)
Tb_Transactions(Tran_ID, Supp_ID, Con_ID, Prod_ID, Quantity, Price)

use SQL with GROUP BY, CUBE and ROLLUP to create a cube with the following characteristics:

The dimensions of the cube are: Tb_Supplier and Tb_Product.
Measure groups table is: Tb_Offers.
Measure aggregates: SUM(Quantity), SUM(Quantity*Price), MAX(Price) , MIN(Price)

Dimension hierarchies:
Tb_Supplier: State > City > Name
Tb_Product: Product_Packaging > Name
			Product_Category > Product_Line > Name
*/


SELECT DISTINCT S.Name "Supplier Name",S.City "Supplier City",S.State "Supplier State",
				P.Name "Product Name",P.Product_Category "Product Category",
				P.Product_Line "Product Line",P.Product_Packaging "Product Packaging",
				SUM(Quantity) "Total Transactions Quantity",
				SUM(Quantity*Price) "Total Transaction Price",
				MAX(Price) "Max_Price",
				MIN(Price) "Min_Price"
INTO Tb_Transactions_Final
FROM Tb_Supplier S, Tb_Product P, Tb_Offers O
WHERE S.Supp_ID=O.Supp_ID  
	AND P.Prod_ID=O.Prod_ID
GROUP BY CUBE((S.State, S.City, S.Name),
			(P.Product_Packaging,P.Name),
			(P.Product_Category,P.Product_Line,P.Name)),
ROLLUP(S.State, S.City, S.Name), 
ROLLUP(p.Product_Packaging,P.Name),
ROLLUP(P.Product_Category,P.Product_Line,P.Name)


-- b) Given the cube created at point a) solve the following queries using SQL:

-- 1. Value of products offered by supplier and by product packaging? (2 points)

SELECT [Supplier Name], [Product Name], [Product Packaging], [Total Transaction Price]
FROM Tb_Transactions_Final
WHERE "Supplier Name" IS NOT NULL
AND "Supplier City" IS NOT NULL
AND "Supplier State" IS NOT NULL
AND "Product Name" IS NOT NULL
AND "Product Line" IS NULL
AND "Product Packaging" IS NOT NULL
AND "Product Category" IS NULL

-- 2. Volume of milk offered by each supplier in Wisconsin? (2 points)

SELECT [Supplier Name], [Total Transactions Quantity]
FROM Tb_Transactions_Final
WHERE "Supplier Name" IS NOT NULL
AND "Supplier City" IS NOT NULL
AND "Supplier State" = 'Wisconsin'
AND "Product Name" = 'Milk'
AND "Product Line" IS NOT NULL
AND "Product Packaging" IS NOT NULL
AND "Product Category" IS NOT NULL

-- 3. Find the maximum price for each product offered in Madison? (5 points)

SELECT [Product Name], [Max_Price]
FROM Tb_Transactions_Final
WHERE "Supplier Name" IS NULL
AND "Supplier City" = 'Madison'
AND "Supplier State" IS NOT NULL
AND "Product Name" IS NOT NULL
AND "Product Line" IS NOT NULL
AND "Product Packaging" IS NOT NULL
AND "Product Category" IS NOT NULL

-- 4. For each supplier city find the product offered in largest quantity? (8 points)

SELECT A.[Supplier City],A.[Product Name],A.[Total Transactions Quantity]
FROM (SELECT [Supplier City], [Product Name], [Total Transactions Quantity],
             DENSE_RANK() OVER (PARTITION BY [Supplier City] ORDER BY [Total Transactions Quantity] DESC) AS order_qty
      FROM Tb_Transactions_Final
      WHERE "Supplier Name" IS NULL
		AND "Supplier City" IS NOT NULL
		AND "Supplier State" IS NOT NULL
		AND "Product Name" IS NOT NULL
		AND "Product Line" IS NULL
		AND "Product Packaging" IS NOT NULL
		AND "Product Category" IS NULL 
      ) A
WHERE order_qty = 1

-- 5. For each product find the city where it is offered at the lowest price? (8 points)

SELECT A.[Product Name],A.[Supplier City],A.[Min_Price]
FROM (SELECT [Product Name],[Supplier City],[Min_Price],
             DENSE_RANK() OVER (PARTITION BY [Product Name] ORDER BY [Min_Price] ASC) AS order_minPrice
      FROM Tb_Transactions_Final
      WHERE "Supplier Name" IS NULL
		AND "Supplier City" IS NOT NULL
		AND "Supplier State" IS NOT NULL
		AND "Product Name" IS NOT NULL
		AND "Product Line" IS NULL
		AND "Product Packaging" IS NOT NULL
		AND "Product Category" IS NULL 
      ) A
WHERE order_minPrice = 1