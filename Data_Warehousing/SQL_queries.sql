/* 1) List full transaction data relating to suppliers from Madison and consumers from Stevens Point where 
transaction value is higher than $10,000 (show supplier, consumer and product names, quantity and price)? */

SELECT s.Name AS Sup_Name,c.Name AS Con_Name,p.Name AS Prod_Name,t.Quantity,t.Price
FROM Tb_Supplier s, Tb_Consumer c, Tb_Product p, Tb_Transactions t
WHERE s.Supp_ID = t.Supp_ID
AND c.Con_ID = t.Con_ID
AND p.Prod_ID = t.Prod_ID
AND s.City = 'Madison'
AND c.City = 'Stevens Point'
AND t.Price > 10000


-- 2. Name of suppliers offering both computers and oranges? (do not use set operations)

SELECT s.Name 
FROM Tb_Supplier s, Tb_Offers o1, Tb_Product p1, Tb_Offers o2, Tb_Product p2
WHERE s.Supp_ID = o1.Supp_ID
AND p1.Prod_ID = o1.Prod_ID
AND p1.Name = 'Computer'
AND s.Supp_ID = o2.Supp_ID
AND p2.Prod_ID = o2.Prod_ID
AND p2.Name = 'Orange'


-- 3. Name of suppliers from Wausau or offering computers or offering oranges?

SELECT DISTINCT a.Name
FROM
	(SELECT s.Name,s.City,p.Name AS Prod_Name
	FROM Tb_Supplier s,Tb_Product p,Tb_Offers o
	WHERE s.Supp_ID = o.Supp_ID
	AND p.Prod_ID = o.Prod_ID) a
WHERE a.City = 'Wausau' 
OR a.Prod_Name = 'Computer'
OR a.Prod_Name = 'Orange'


-- 4. Name of suppliers offering computer, auto and orange?

SELECT s.Name 
FROM Tb_Supplier s, Tb_Offers o1, Tb_Offers o2, Tb_Offers o3, Tb_Product p1, Tb_Product p2, Tb_Product p3
WHERE s.Supp_ID = o1.Supp_ID
AND p1.Prod_ID = o1.Prod_ID
AND p1.Name = 'Computer'
AND s.Supp_ID = o2.Supp_ID
AND p2.Prod_ID = o2.Prod_ID
AND p2.Name = 'Orange'
AND s.Supp_ID = o3.Supp_ID
AND p3.Prod_ID = o3.Prod_ID
AND p3.Name = 'Auto'


-- 5. Name of products not offered in Chicago?

SELECT Tb_Product.Name
FROM Tb_Product
WHERE Tb_Product.Name NOT IN
	(SELECT DISTINCT Tb_Product.Name
	FROM Tb_Product,Tb_Supplier,Tb_Offers
	WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
	AND Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
	AND Tb_Supplier.City = 'Chicago')


-- 6. Name of consumers requesting only computers?

SELECT Tb_Consumer.Name
FROM Tb_Consumer, Tb_Product, Tb_Requests
WHERE Tb_Consumer.Con_ID = Tb_Requests.Con_ID
AND Tb_Product.Prod_ID = Tb_Requests.Prod_ID
AND Tb_Product.Name = 'Computer'


-- 7. Name of products requested by all consumers?

SELECT Name
FROM Tb_Product
WHERE NOT EXISTS(SELECT *
				FROM Tb_Consumer
				WHERE NOT EXISTS (SELECT *
								FROM Tb_Requests
								WHERE Tb_Product.Prod_ID = Tb_Requests.Prod_ID
								AND Tb_Consumer.Con_ID = Tb_Requests.Con_ID))


-- 8. Name of products sold in all cities except Stevens Point?

SELECT Name
FROM Tb_Product
WHERE NOT EXISTS(SELECT *
				FROM Tb_Consumer
				WHERE NOT EXISTS (SELECT *
								FROM Tb_Transactions
								WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
								AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
								AND Tb_Consumer.City = 'Stevens Point'))

-- Tried to find the answer in another way

SELECT Name
FROM Tb_Product
WHERE NOT EXISTS(SELECT DISTINCT Tb_Product.Name -- Tb_Consumer.City
				FROM Tb_Product, Tb_Consumer, Tb_Transactions
				WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
				AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
				AND Tb_Consumer.City = 'Stevens Point')


-- 9. Product name and supplier having the largest offer for that product?

SELECT DISTINCT Tb_Product.Name AS Prod_Name, Tb_Supplier.Name AS Sup_Name, Tb_Offers.Price
FROM Tb_Product, Tb_Supplier, Tb_Offers
WHERE Tb_Product.Prod_ID = Tb_Offers.Prod_ID
AND Tb_Supplier.Supp_ID = Tb_Offers.Supp_ID
AND Tb_Offers.Price >= ALL (SELECT Tb_Offers.Price
							FROM Tb_Offers
							WHERE Tb_Offers.Prod_ID = Tb_Product.Prod_ID) 


-- 10. Product name and city where that product sold in largest quantity?

SELECT DISTINCT Tb_Product.Name AS Prod_Name, Tb_Consumer.City, Tb_Transactions.Quantity
FROM Tb_Product, Tb_Consumer, Tb_Transactions
WHERE Tb_Product.Prod_ID = Tb_Transactions.Prod_ID
AND Tb_Consumer.Con_ID = Tb_Transactions.Con_ID
AND Tb_Transactions.Quantity >= ALL (SELECT Tb_Transactions.Quantity
									FROM Tb_Transactions
									WHERE Tb_Transactions.Prod_ID = Tb_Product.Prod_ID)