
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
/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/
