
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

/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
