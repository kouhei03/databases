
/*SQL UNIONALLの例
    次のSQLステートメントは、「Customers」テーブルと「Suppliers」テーブルの
    両方から都市（重複する値も）を返します。*/
SELECT City FROM Customer
UNION all
SELECT City FROM Supplier
ORDER BY City;

/*SQL UNION With WHERE
    次のSQLステートメントは、「Customers」テーブルと「Suppliers」テーブルの
    両方からドイツの都市（個別の値のみ）を返します。
*/

SELECT City, Country FROM Customer
WHERE Country='Germany'
UNION
SELECT City, Country FROM Supplier
WHERE Country='Germany'
ORDER BY City;

/*SQL UNION ALL With WHERE
次のSQLステートメントは、「Customers」テーブルと「Suppliers」テーブルの
両方からドイツの都市（重複する値も）を返します。*/

SELECT City, Country FROM Customer
WHERE Country='Germany'
UNION ALL
SELECT City, Country FROM Supplier
WHERE Country='Germany'
ORDER BY City;

/*別のUNIONの例
次のSQLステートメントは、すべての顧客とサプライヤを一覧表示します。
*/
SELECT 'contactName' AS Type, companyName, City, Country
FROM Customer
UNION
SELECT 'Supplier', ContactName, City, Country
FROM Supplier;

/*SQL GROUPBYステートメント
このGROUP BYステートメントは、「各国の顧客数を検索する」のように、
同じ値を持つ行を要約行にグループ化します。

GROUP BYステートメントは、しばしば、集約関数（で使用されCOUNT()、 
MAX()、 MIN()、SUM()、 AVG()1つ以上の列によって結果セットのグループに）。

GROUPBY構文
SELECT column_name(s)
FROM table_name
WHERE condition
GROUP BY column_name(s)
ORDER BY column_name(s);*/


/*SQL GROUPBYの例
次のSQLステートメントは、各国の顧客数を示しています。
*/
SELECT COUNT(custId), Country
FROM Customer
GROUP BY Country;


/*次のSQLステートメントは、各国の顧客数を上位から下位に並べ替えたものです。*/
SELECT COUNT(custId), Country
FROM Customer
GROUP BY Country
ORDER BY COUNT(custId) DESC;

/*次のSQLステートメントは、各荷送人から送信された注文の数を示しています*/

SELECT Shipper.companyName,COUNT(SalesOrder.orderId) AS NumberOfOrders FROM SalesOrder
LEFT JOIN Shipper ON SalesOrder.shipperId = Shipper.shipperId
GROUP BY companyName;

/*SQLHAVINGの例
次のSQLステートメントは、各国の顧客数を示しています。5人以上の顧客がいる国のみを含めます。*/
SELECT COUNT(custId), Country
FROM Customer
GROUP BY Country
HAVING COUNT(custId) > 5;

/*
次のSQLステートメントは、各国の顧客数を上位から下位に並べ替えて
リストしています（5人を超える顧客を持つ国のみを含む）。*/
SELECT COUNT(custId), Country
FROM Customer
GROUP BY Country
HAVING COUNT(custId) > 5
ORDER BY COUNT(custId) DESC;

/*次のSQLステートメントは、10を超える注文を登録した従業員を一覧表示します。*/
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM (Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID)
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 10;
/*次のSQLステートメントは、従業員「Davolio」または
「Fuller」が25を超える注文を登録したかどうかを示しています。*/
SELECT Employees.LastName, COUNT(Orders.OrderID) AS NumberOfOrders
FROM Orders
INNER JOIN Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE LastName = 'Davolio' OR LastName = 'Fuller'
GROUP BY LastName
HAVING COUNT(Orders.OrderID) > 25;

/*SQLEXISTSの例
次のSQLステートメントはTRUEを返し、製品価格が20未満のサプライヤーをリストします。*/
SELECT companyName
FROM Supplier
WHERE EXISTS (SELECT productName FROM Product 
WHERE Product.supplierId = Supplier.supplierId AND unitPrice < 20);

/*次のSQLステートメントはTRUEを返し、製品価格が22のサプライヤーをリストします。*/
SELECT contactName
FROM Supplier
WHERE EXISTS (SELECT ProductName FROM Product 
WHERE Product.supplierId  = Supplier.supplierId  AND unitPrice = 22);

/*
次のSQLステートメントは、OrderDetailsテーブルでQuantityが10に等しいレコードを
検出した場合にProductNameを一覧表示します
（Quantity列の値が10であるため、これはTRUEを返します）。*/
SELECT productName
FROM Product
WHERE productId = ANY 
    (SELECT productId FROM OrderDetail WHERE quantity = 10);

/*
次のSQLステートメントは、OrderDetailsテーブルで99より大きいQuantityのレコードが
見つかった場合にProductNameを一覧表示します
（Quantity列の値が99より大きいため、これはTRUEを返します）。*/
SELECT productName
FROM Product
WHERE productId = ANY 
 (SELECT productId FROM OrderDetail WHERE quantity  > 99);

/*SQLALLの例
次のSQLステートメントは、すべての製品名をリストしています*/
SELECT ALL productName
FROM Product
WHERE TRUE;

/*SQL INSERT INTOSELECTステートメント
このINSERT INTO SELECTステートメントは、あるテーブルからデータをコピーし、それを別のテーブルに挿入します。

このINSERT INTO SELECTステートメントでは、ソーステーブルとターゲットテーブルのデータ型が一致している必要があります。

注：ターゲットテーブルの既存のレコードは影響を受けません。

INSERT INTOSELECT構文
あるテーブルから別のテーブルにすべての列をコピーします。

INSERT INTO table2
SELECT * FROM table1
WHERE condition;
あるテーブルから別のテーブルに一部の列のみをコピーします。

INSERT INTO table2 (column1, column2, column3, ...)
SELECT column1, column2, column3, ...
FROM table1
WHERE condition;*/

/*次のSQLステートメントは、「Suppliers」を「Customers」に
コピーします（データが入力されていない列にはNULLが含まれます）。*/
INSERT INTO Customer (companyName, City, Country)
SELECT companyName, City, Country FROM Supplier;

/*次のSQLステートメントは、「Suppliers」を「Customers」にコピーします（すべての列に入力します）*/
INSERT INTO Customer (companyName, ContactName, Address, City, PostalCode, Country)
SELECT companyName, ContactName, Address, City, PostalCode, Country FROM Supplier;


/*次のSQLステートメントは、ドイツのサプライヤーのみを「顧客」にコピーします。*/
INSERT INTO Customer (companyName, city, country)
SELECT 	companyName, City, country FROM Supplier
WHERE country='Germany';

/*
SQLCASEステートメント
CASE文は条件を通過し、第一の条件は、（IF-THEN-else文のように）満たされている値を返します。したがって、条件が真になると、読み取りを停止して結果を返します。真の条件がない場合は、ELSE句の値を返します。

ELSEパーツがなく、条件が真でない場合は、NULLを返します。

CASE構文
CASE
    WHEN condition1 THEN result1
    WHEN condition2 THEN result2
    WHEN conditionN THEN resultN
    ELSE result
END;
*/

/*SQLCASEの例
次のSQLは条件を通過し、最初の条件が満たされたときに値を返します。
*/
SELECT OrderID, Quantity,
CASE WHEN Quantity > 30 THEN 'The quantity is greater than 30'
WHEN Quantity = 30 THEN 'The quantity is 30'
ELSE 'The quantity is under 30'
END AS QuantityText
FROM OrderDetail;


/*次のSQLは、市ごとに顧客を注文します。
ただし、CityがNULLの場合は、国別に並べ替えます。*/
SELECT companyName, city, country FROM Customer
ORDER BY (CASE
WHEN city IS NULL THEN country
ELSE city
END);

/*単一行コメント
1行コメントは--。で始まります。
-と行末の間のテキストは無視されます（実行されません）。
次の例では、説明として1行のコメントを使用しています。
*/
-- Select all:
SELECT * FROM Customer;
SELECT * FROM Customer -- WHERE City='Berlin';

