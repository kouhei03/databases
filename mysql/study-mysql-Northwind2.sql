
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


/*NULL値とは何ですか？
NULL値のあるフィールドは、値のないフィールドです。

テーブルのフィールドがオプションの場合、このフィールドに値を追加せずに、
新しいレコードを挿入したり、レコードを更新したりすることができます。
次に、フィールドはNULL値で保存されます。

注： NULL値は、ゼロ値またはスペースを含むフィールドとは異なります。
NULL値のフィールドは、レコードの作成中に空白のままにされたフィールドです。

NULL値をテストする方法は？
=、<、<>などの比較演算子を使用してNULL値をテストすることはできません。

代わりにIS NULLand IS NOT NULL演算子を使用する必要があります。

＜ISNULL構文＞
SELECT column_names
FROM table_name
WHERE column_name IS NULL;

＜IS NOTNULL構文＞
SELECT column_names
FROM table_name
WHERE column_name IS NOT NULL;
*/

/*ISNULL演算子
IS NULLオペレータは、空の値（NULL値）をテストするために使用されます。
次のSQLは、「アドレス」フィールドにNULL値を持つすべての顧客をリストします。*/

SELECT companyName, ContactName, Address
FROM Customer
WHERE Address IS NULL;



/*IS NOTNULL演算子
IS NOT NULLオペレータは、非空の値（NOT NULL値）をテストするために使用されます。
次のSQLは、「アドレス」フィールドに値を持つすべての顧客を一覧表示します。*/

SELECT companyName, ContactName, Address
FROM Customer
WHERE Address IS NULL;

SELECT companyName, ContactName, Address
FROM Customer
WHERE Address IS NOT NULL;


/*SQLUPDATEステートメント
このUPDATEステートメントは、テーブル内の既存のレコードを変更するために使用されます。

UPDATE構文
UPDATE table_name
SET column1 = value1, column2 = value2, ...
WHERE condition;
*/

/*UPDATEテーブル
次のSQLステートメントは、最初の顧客（CustomerID = 1）を
新しい連絡担当者と 新しい都市で更新します。*/

UPDATE Customer
SET companyName='Alfred Schmidt', City='Frankfurt'
WHERE custId=1;


/*複数のレコードを更新する
それはWHERE更新されるレコードの数を決定する句。
次のSQLステートメントは、国が「メキシコ」であるすべての
レコードのContactNameを「Juan」に更新します。*/

UPDATE Customer
SET ContactName='Juan'
WHERE Country='Mexico';


/*警告を更新してください！
レコードを更新するときは注意してください。
この WHERE句を省略すると、すべてのレコードが更新されます。
*/

UPDATE Customer
SET ContactName='Juan';

/*SQLDELETEの例
次のSQLステートメントは、「Customers」テーブルから
顧客「AlfredsFutterkiste」を削除します。*/
DELETE FROM Customer WHERE companyName='Alfred Schmidt';

/*すべてのレコードを削除する
テーブルを削除せずに、テーブル内のすべての行を削除することができます。
これは、テーブルの構造、属性、およびインデックスがそのまま残ることを意味します。*/

DELETE FROM Customer;




