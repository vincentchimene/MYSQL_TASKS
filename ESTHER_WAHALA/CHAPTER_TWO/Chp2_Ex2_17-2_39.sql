-- 2.17
SELECT SKU, SKU_Description FROM INVENTORY;

-- 2.18
SELECT SKU_Description, SKU FROM INVENTORY;

-- 2.19
SELECT WarehouseID FROM INVENTORY;

-- 2.20 Write an SQL statement to display unique WarehouseIDs.
SELECT distinct WarehouseID FROM INVENTORY;

-- 2.21 Write an SQL statement to display all of the columns without using the SQL asterisk(*) wildcard character.
SELECT WarehouseID, SKU, SKU_Description, QuantityOnHand, QuantityOnOrder FROM INVENTORY;

-- 2.22 Write an SQL statement to display all of the columns using the SQL asterisk (*) wild-card character.
SELECT * FROM INVENTORY;

-- 2.23 Write an SQL statement to display all data on products having a QuantityOnHand greater than 0.
SELECT * FROM INVENTORY WHERE QuantityOnHand > 0;

-- 2.24 Write an SQL statement to display the SKU and SKU_Description for products having QuantityOnHand equal to 0.
SELECT SKU, SKU_Description FROM INVENTORY WHERE QuantityOnHand = 0;

-- 2.25 Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for products that have a QuantityOnHand equal to 0. Sort the results in ascending orderby WarehouseID.
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 ORDER BY WarehouseID; 

-- 2.26 Write an SQL statement to display the SKU, SKU_Description, and WarehouseID for products that have a QuantityOnHand greater than 0. Sort the results in descending order by WarehouseID and in ascending order by SKU.
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand > 0 ORDER BY WarehouseID desc, SKU asc;

-- 2.27 Write an SQL statement to display SKU, SKU_Description, and WarehouseID for all products that have a QuantityOnHand equal to 0 and a QuantityOnOrder greater than 0. Sort the results in descending order by WarehouseID and in ascending order by SKU.
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 AND QuantityOnOrder > 0 ORDER BY WarehouseID desc, SKU asc;

-- 2.28 Write an SQL statement to display SKU, SKU_Description, and WarehouseID for all products that have a QuantityOnHand equal to 0 or a QuantityOnOrder equal to 0. Sort the results in descending order by WarehouseID and in ascending order by SKU.
SELECT SKU, SKU_Description, WarehouseID FROM INVENTORY WHERE QuantityOnHand = 0 OR QuantityOnOrder = 0 ORDER BY WarehouseID desc, SKU asc;

-- 2.29 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and QuantityOnHand for all products having a QuantityOnHand greater than 1 and less than 10. Do not use the BETWEEN keyword.
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand > 1 AND QuantityOnHand < 10;

-- 2.30 Write an SQL statement to display the SKU, SKU_Description, WarehouseID, and QuantityOnHand for all products having a QuantityOnHand greater than 1 and less than 10. Use the BETWEEN keyword.
SELECT SKU, SKU_Description, WarehouseID, QuantityOnHand FROM INVENTORY WHERE QuantityOnHand BETWEEN 2 AND 9;											