/*Webで更改されているMysqlのサンプルNorthwindデータベースを使用*/
/*Customerテーブルを使用*/

use Northwind;
show databases;
show tables;

/*SQLステートメント
データベースで実行する必要のあるアクションのほとんどは、
SQLステートメントを使用して実行されます。
次のSQLステートメントは、「Customers」テーブルのすべてのレコードを選択します。*/

show databases;
show tables;
SELECT * FROM Category;
SELECT * FROM CustCustDemographics;
SELECT * FROM Customer;
SELECT * FROM CustomerDemographics;
SELECT * FROM Employee;
SELECT * FROM EmployeeTerritory;
SELECT * FROM OrderDetail;
SELECT * FROM Product;
SELECT * FROM Region;
SELECT * FROM SalesOrder;
SELECT * FROM Shipper;
SELECT * FROM Supplier;
SELECT * FROM Territory;

/* SQLSELECTステートメント
このSELECTステートメントは、データベースからデータを選択するために使用されます。
返されたデータは、結果セットと呼ばれる結果テーブルに格納されます。 */

/* SELECT構文
    SELECT column1, column2, ...  FROM table_name;
    ここで、column1、column2、...は、データを選択するテーブルのフィールド名です。
    テーブルで使用可能なすべてのフィールドを選択する場合は、次の構文を使用します。
    SELECT * FROM table_name;
 */
/* SELECT列の例
    次のSQLステートメントは、「Customers」テーブルから「CustomerName」列と
    「City」列を選択します。
 */

 /*  DISTINCTを使用しないSELECTの例
次のSQLステートメントは、「Customers」テーブルの「Country」列から
すべての（重複を含む）値を選択します。*/
SELECT Country FROM Customer;
/* SQL SELECTDISTINCTステートメント
このSELECT DISTINCTステートメントは、異なる（異なる）値のみを返すために使用されます。
テーブル内の列には、多くの場合、重複する値が多数含まれています。
また、異なる（個別の）値のみをリストしたい場合もあります。

SELECTDISTINCT構文
SELECT DISTINCT column1, column2, ...
FROM table_name;
 */
/*  */

SELECT ContactName,City FROM Customer;


/* SELECTDISTINCTの例
次のSQLステートメントは、「Customers」テーブルの「Country」列から
DISTINCT値のみを選択します。 */
SELECT DISTINCT Country FROM Customer;

/*次のSQLステートメントは、さまざまな（個別の）顧客の国の数を示しています  */
SELECT COUNT(DISTINCT Country) FROM Customer;

/*SQLWHERE句
このWHERE句は、レコードをフィルタリングするために使用されます。
指定された条件を満たすレコードのみを抽出するために使用されます。

WHERE構文
SELECT column1, column2, ...
FROM table_name
WHERE condition;
*/

/*WHERE句の例
次のSQLステートメントは、「Customers」テーブルで、国「Mexico」から
すべての顧客を選択します。*/

SELECT * FROM Customer WHERE Country='Mexico';


/*テキストフィールドと数値フィールド
SQLでは、テキスト値を一重引用符で囲む必要があります
（ほとんどのデータベースシステムでは、二重引用符も使用できます）。
ただし、数値フィールドは引用符で囲むべきではありません。*/

SELECT * FROM Customer WHERE custId=1;


/*SQL AND、OR、およびNOT演算子
WHERE句は、と組み合わせることができ AND、ORおよび NOTオペレーター。

ANDそしてOR、オペレータは、複数の条件に基づいてフィルタレコードに使用されます。

でAND区切られたすべての条件 AND がTRUEの場合、オペレーターはレコードを表示します。
でOR区切られた条件のいずれか ORがTRUEの場合、オペレーターはレコードを表示します。
NOTオペレータディスプレイ条件（s）が真でない場合、レコード。*/

/*次のSQLステートメントは、国が「ドイツ」で都市が「ベルリン」である「顧客」から
すべてのフィールドを選択します。*/


/*
    【AND構文】
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition1 AND condition2 AND condition3 ...;

    【OR構文】
    SELECT column1, column2, ...
    FROM table_name
    WHERE condition1 OR condition2 OR condition3 ...;

    【NOT構文】
    SELECT column1, column2, ...
    FROM table_name
    WHERE NOT condition;
*/

/*ANDの例
次のSQLステートメントは、国が「ドイツ」で都市が「ベルリン」である「顧客」から
すべてのフィールドを選択します。*/
SELECT * FROM Customer
WHERE Country='Germany' AND City='Berlin';


/*または例
次のSQLステートメントは、都市が「ベルリン」または「ミュンヘン」である「顧客」から
すべてのフィールドを選択します。*/
SELECT * FROM Customers
WHERE City='Berlin' OR City='München';

/*次のSQLステートメントは、国が「ドイツ」または
「スペイン」である「顧客」からすべてのフィールドを選択します。*/

SELECT * FROM Customers
WHERE Country='Germany' OR Country='Spain';

/*次のSQLステートメントは、国が「ドイツ」ではない「顧客」から
すべてのフィールドを選択します。*/
SELECT * FROM Customer
WHERE NOT Country='Germany';


/*AND、OR、NOTの組み合わせ
あなたも組み合わせることができAND、 ORおよびNOT演算子を。

次のSQLステートメントは、「Customers」からすべてのフィールドを選択します。
ここで、countryは「Germany」であり、cityは「Berlin」または
「München」である必要があります（括弧を使用して複雑な式を形成します）。*/

SELECT * FROM Customer
WHERE Country='Germany' AND (City='Berlin' OR City='München');

/*次のSQLステートメントは、国が「ドイツ」でも「米国」でもない
「顧客」からすべてのフィールドを選択します。*/

SELECT * FROM Customer
WHERE NOT Country='Germany' AND NOT Country='USA';
