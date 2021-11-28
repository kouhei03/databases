
/*Webで更改されているMysqlのサンプルNorthwindデータベースを使用*/
/*Customerテーブルを使用*/

/*SQL ORDERBYキーワード
ORDER BYキーワードは、昇順または降順で結果セットをソートするために使用されます。

ORDER BYキーワードは、デフォルトでは昇順でレコードをソートします。
レコードを降順で並べ替えるには、 DESCキーワードを使用します。

ORDERBY構文
SELECT column1, column2, ...
FROM table_name
ORDER BY column1, column2, ... ASC|DESC;
*/


/*ORDERBYの例
次のSQLステートメントは、「Country」列でソートされた
「Customers」テーブルからすべての顧客を選択します。

例*/

SELECT * FROM Customer
ORDER BY Country;


*/
/*ORDER BYDESCの例
次のSQLステートメントは、「Customers」テーブルから
すべての顧客を選択し、「Country」列で降順でソートします。
*/

SELECT * FROM Customer
ORDER BY Country DESC;


/*ORDERBY複数の列の例
次のSQLステートメントは、「Customers」テーブルからすべての顧客を選択し、
「Country」列と「CustomerName」列でソートします。
これは、国で並べ替えることを意味しますが、一部の行に同じ国がある場合は、
companyNameで並べ替えます。
*/

SELECT * FROM Customer
ORDER BY Country, companyName;


/*ORDERBY複数の列の例2
次のSQLステートメントは、「Customers」テーブルからすべての顧客を選択し、
「Country」で昇順、「companyName」列で降順にソートします。*/

SELECT * FROM Customer
ORDER BY Country ASC, companyName DESC;


/*次の演算子をWHERE句で使用できます 	Equal*/
SELECT * FROM Product
WHERE unitPrice = 18;

/*次の演算子をWHERE句で使用できます 	Greater than*/
SELECT * FROM Product
WHERE unitPrice > 30;

/*次の演算子をWHERE句で使用できます 		Less than*/
SELECT * FROM Product
WHERE unitPrice < 30;

/*次の演算子をWHERE句で使用できます 	Greater than or equal*/
SELECT * FROM Product
WHERE unitPrice >= 30;

/*次の演算子をWHERE句で使用できます 	Less than or equal*/

SELECT * FROM Product
WHERE unitPrice <= 30;


/*次の演算子をWHERE句で使用できます 	
    Not equal. Note: In some versions of SQL this operator may be written as !=*/
SELECT * FROM Product
WHERE unitPrice <> 18;

/*次の演算子をWHERE句で使用できます 	Between a certain range*/
SELECT * FROM Product
WHERE unitPrice BETWEEN 50 AND 60;

/*次の演算子をWHERE句で使用できます 	Search for a pattern*/
SELECT * FROM Customer
WHERE City LIKE 's%';
/*次の演算子をWHERE句で使用できます  To specify multiple possible values for a column*/
SELECT * FROM Customer
WHERE City IN ('Paris','London');


/**/
INSERT INTO Customer (companyName, ContactName, Address, City, PostalCode, Country)
VALUES ('Cardinal','Tom B. Erichsen','Skagen 21','Stavanger','4006','Norway');

/*指定した列にのみデータを挿入する
特定の列にのみデータを挿入することもできます。

次のSQLステートメントは新しいレコードを挿入しますが、
「CustomerName」、「City」、および「Country」列にのみ
データを挿入します（CustomerIDは自動的に更新されます）。
*/
INSERT INTO Customer (companyName, City, Country)
VALUES ('Cardinal2', 'Stavanger', 'Norway');
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
