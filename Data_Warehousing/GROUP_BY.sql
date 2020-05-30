-- 1) Product categories and number of products in each category?

SELECT Product_Category, COUNT(DISTINCT Prod_ID) AS Prod_Number
FROM Tb_Product
GROUP BY Product_Category 


-- 2) Cities having at least 3 different consumers?

SELECT City
FROM Tb_Consumer
GROUP BY City
HAVING COUNT(DISTINCT Con_ID) >= 3


-- 3) Cities and number of different products offered in city?

SELECT Tb_Supplier.City, COUNT(DISTINCT Tb_Product.Prod_ID) AS Num_Product
FROM Tb_Supplier, Tb_Product, Tb_Offers
WHERE Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
AND Tb_Offers.Prod_ID = Tb_Product.Prod_ID
GROUP BY Tb_Supplier.City


-- 4) List of states and number of car suppliers in each state?

SELECT Tb_Supplier.State, COUNT(DISTINCT Tb_Supplier.Supp_ID) AS Num_Suppliers
FROM Tb_Supplier, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID
AND Tb_Product.Prod_ID=Tb_Transactions.Prod_ID
AND Tb_Product.Name='Auto'
GROUP BY Tb_Supplier.State


-- 5) Product name and quantity offered in each city?

SELECT Tb_Supplier.City, Tb_Product.Name, SUM(Tb_Offers.Quantity) AS Quantity
FROM Tb_Supplier, Tb_Product, Tb_Offers
WHERE Tb_Supplier.Supp_ID=Tb_Offers.Supp_ID
AND Tb_Product.Prod_ID=Tb_Offers.Prod_ID
GROUP BY Tb_Supplier.City, Tb_Product.Name
ORDER BY Tb_Supplier.City, Tb_Product.Name


-- 6) Supplier name and quantity of TV sold in each consumer city?

SELECT Tb_Consumer.City, Tb_Supplier.Name AS Sup_Name, SUM(Tb_Transactions.Quantity) AS Tot_quantity
FROM  Tb_Supplier, Tb_Product, Tb_Transactions, Tb_Consumer
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID
AND Tb_Product.Prod_ID=Tb_Transactions.Prod_ID
AND Tb_Consumer.Con_ID=Tb_Transactions.Con_ID
AND Tb_Product.Name = 'TV'
GROUP BY Tb_Consumer.City, Tb_Supplier.Name
ORDER BY Tb_Consumer.City, Tb_Supplier.Name


/* 7) Supplier-consumer-product names such that supplier is selling product to consumer 
      with total value of transactions between supplier and consumer for given product? */

SELECT Tb_Supplier.Name AS sup_Name, Tb_Consumer.Name AS con_Name, 
		Tb_Product.Name AS prod_Name, SUM(Tb_Transactions.Price * Tb_Transactions.Quantity) AS tot_Value
FROM Tb_Supplier, Tb_Consumer, Tb_Product, Tb_Transactions
WHERE Tb_Supplier.Supp_ID=Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
GROUP BY Tb_Product.Name, Tb_Supplier.Name, Tb_Consumer.Name
ORDER BY Tb_Supplier.Name, Tb_Consumer.Name, Tb_Product.Name


/* 8) Monthly sales data (total transactions quantity, number of transactions, 
      total transactions value) by supplier, consumer, and product during the year 2018? */

SELECT D.DateMonth, D.DateMonthName "Month", S.Name "Supplier Name", C.Name "Consumer Name", P.Name "Product Name", 
		SUM(Quantity) "Total Transactions Quantity", COUNT(Tran_ID) "Number of Transactions",
		SUM(Quantity*Price) "Total Transactions Value"
FROM Tb_Supplier S, Tb_Consumer C, Tb_Product P, Tb_Transactions T, Tb_Date D
WHERE S.Supp_ID = T.Supp_ID 
AND C.Con_ID=T.Con_ID 
AND P.Prod_ID=T.Prod_ID 
AND T.DateKey=D.DateKey
AND D.DateYear = '2018'
GROUP BY S.Name, C.Name, P.Name, D.DateMonth, D.DateMonthName
ORDER BY D.DateMonth, S.Name, C.Name, P.Name


-- 9) States where the number of suppliers exceeds the number of consumers?

SELECT Tb_Supplier.State
FROM Tb_Supplier, Tb_Consumer
WHERE Tb_Supplier.State = Tb_Consumer.State
GROUP BY Tb_Supplier.State
HAVING (COUNT(DISTINCT Tb_Supplier.Supp_ID) > COUNT(DISTINCT Tb_Consumer.Con_ID))


/* 10) Comparative list of supplier or consumer states and cities with respective number of suppliers 
       and consumers in each city (columns are State, City, NumberOfSuppliers, NumberOfConsumers)? */

SELECT S.State, S.City, S.NumberOfSuppliers, C.NumberOfConsumers
FROM
(SELECT Tb_Supplier.State "State", Tb_Supplier.City "City", COUNT(DISTINCT Tb_Supplier.Supp_ID) "NumberOfSuppliers"
FROM Tb_Supplier
GROUP BY Tb_Supplier.State, Tb_Supplier.City) S
FULL JOIN
(SELECT Tb_Consumer.State "State", Tb_Consumer.City "City", COUNT(DISTINCT Tb_Consumer.Con_ID) "NumberOfConsumers"
FROM Tb_Consumer
GROUP BY Tb_Consumer.State, Tb_Consumer.City) C
ON S.State = C.State AND S.City = C.City


/* 11) (Extra Credit 2%) For each product list the quantity sold by suppliers in Madison to 
consumers in Chicago versus the quantity sold by suppliers in Chicago to consumers in Madison 
(result columns: product name, quantity Madison_Chicago, quantity Chicago_Madison)? */

SELECT A.Product_Name, A.quantity_Madison_Chicago, B.quantity_Chicago_Madison
FROM
(SELECT Tb_Product.Name "Product_Name", SUM(Tb_Transactions.Quantity) "quantity_Madison_Chicago"
FROM Tb_Product, Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Supplier.City = 'Madison' 
AND Tb_Consumer.City = 'Chicago'
GROUP BY Tb_Product.Name) A
LEFT JOIN
(SELECT Tb_Product.Name "Product_Name", SUM(Tb_Transactions.Quantity) "quantity_Chicago_Madison"
FROM Tb_Product, Tb_Supplier, Tb_Consumer, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Transactions.Supp_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Supplier.City = 'Chicago' 
AND Tb_Consumer.City = 'Madison'
GROUP BY Tb_Product.Name) B
ON A.Product_Name = B.Product_Name

