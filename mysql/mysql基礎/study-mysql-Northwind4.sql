
/*SQLエイリアス
    SQLエイリアスは、テーブルまたはテーブル内の列に一時的な名前を付けるために使用されます。
    エイリアスは、列名を読みやすくするためによく使用されます。

    エイリアスは、そのクエリの期間中のみ存在します。
    ASキーワードを使用してエイリアスが作成されます。

    エイリアス列の構文
    SELECT column_name AS alias_name
    FROM table_name;
    エイリアステーブルの構文
    SELECT column_name(s)
    FROM table_name AS alias_name;
*/

/*列のエイリアスの例
次のSQLステートメントは、CustomerID列用と
CustomerName列用の2つのエイリアスを作成します。*/

use Northwind;
SELECT custId AS ID, companyName AS Customer
FROM Customer;


/*
次のSQLステートメントは、CustomerName列用とContactName列用の
2つのエイリアスを作成します。注：エイリアス名にスペースが含まれている場合は、
二重引用符または角括弧が必要です。*/
SELECT companyName AS Customers, 
contactName AS "Contact Person" FROM Customer;

/*
次のSQLステートメントは、4つの列（Address、PostalCode、City、Country）
を組み合わせた「Address」という名前のエイリアスを作成します。*/
SELECT companyName, Address + ', ' + PostalCode + ' ' + City + ', ' + Country AS Address
FROM Customer;


/*
次のSQLステートメントは、CustomerID = 4（Around the Horn）の顧客からの
すべての注文を選択します。「Customers」テーブルと「Orders」テーブルを使用し、
それぞれ「c」と「o」のテーブルエイリアスを指定します
（ここでは、エイリアスを使用してSQLを短くしています）。
*/
SELECT o.OrderID, o.OrderDate, c.companyName
FROM Customer AS c, SalesOrder AS o
WHERE c.CustomerName='Allen, Michael' AND c.custId=o.custId;


/*SQL結合
JOIN句は、それらの間に関連する列に基づいて、
二つ以上のテーブルから行を結合するために使用されます。

「注文」テーブルからの選択を見てみましょう。

OrderID	CustomerID	OrderDate
10308	2	1996-09-18
10309	37	1996-09-19
10310	77	1996-09-20
次に、「顧客」テーブルからの選択を見てください。

CustomerID	CustomerName	ContactName	Country
1	Alfreds Futterkiste	Maria Anders	Germany
2	Ana Trujillo Emparedados y helados	Ana Trujillo	Mexico
3	Antonio Moreno Taquería	Antonio Moreno	Mexico

「Orders」テーブルの「CustomerID」列が「Customers」テーブルの
「CustomerID」を参照していることに注意してください。
上記の2つのテーブル間の関係は、「CustomerID」列です。*/

/*次に、 INNER JOIN両方のテーブルで値が一致するレコードを選択する
次のSQLステートメント（を含む）を作成できます。
*/
SELECT SalesOrder.OrderID, Customer.companyName, SalesOrder.OrderDate
FROM SalesOrder
INNER JOIN Customer ON SalesOrder.custId=Customer.custId;

/*次のSQLステートメントは、顧客情報を含むすべての注文を選択します。*/
SELECT SalesOrder.orderId, Customer.companyName
FROM SalesOrder
INNER JOIN Customer ON SalesOrder.custId = Customer.custId;


/*次のSQLステートメントは、顧客と配送業者の情報を
含むすべての注文を選択します。*/
SELECT SalesOrder.orderId, Customer.custId, Shipper.companyName
FROM ((SalesOrder
INNER JOIN Customer ON SalesOrder.custId = Customer.custId)
INNER JOIN Shipper ON SalesOrder.shipperId = Shipper.shipperId);

/*SQL LEFTJOINの例
次のSQLステートメントは、すべての顧客と、顧客が持つ可能性のあるすべての注文を選択します。
*/
SELECT Customer.companyName, SalesOrder.orderId
FROM Customer
LEFT JOIN SalesOrder
ON Customer.custId=SalesOrder.custId
ORDER BY Customer.companyName;

/*SQL RIGHTJOINキーワード
RIGHT JOINキーワードは、右テーブルのすべてのレコード（表2）を返し、左テーブル（TABLE1）から一致するレコード。一致するものがない場合、結果は左側から0レコードになります。

RIGHTJOIN構文
SELECT column_name(s)
FROM table1
RIGHT JOIN table2
ON table1.column_name = table2.column_name;
注：一部のデータベースでRIGHT JOINは、と呼ばれ RIGHT OUTER JOINます。
*/

/*次のSQLステートメントは、すべての従業員と
、従業員が行った可能性のあるすべての注文を返します。*/
SELECT SalesOrder.orderId, Employee.lastname, Employee.firstname
FROM SalesOrder
RIGHT JOIN Employee
ON SalesOrder.EmployeeID = Employee.employeeId	
ORDER BY SalesOrder.orderId;

/*SQL自己結合
自己結合は通常の結合ですが、テーブルはそれ自体と結合されます。

自己結合構文
SELECT column_name(s)
FROM table1 T1, table1 T2
WHERE condition;
T1とT2は、同じテーブルの異なるテーブルエイリアスです。
*/

/*SQL自己結合の例
次のSQLステートメントは、同じ都市の顧客と一致します。
*/
SELECT A.companyName AS CustomerName1, B.companyName AS CustomerName2, A.City
FROM Customer A, Customer B
WHERE A.custId<> B.custId
AND A.City = B.City 
ORDER BY A.City;

/*
SQLUNION演算子
UNIONオペレータは、二つ以上の結果セットを組み合わせるために使用される SELECT ステートメント。

SELECT内のすべてのステートメント UNIONは、同じ数の列を持っている必要があります
列も同様のデータ型である必要があります
すべてのSELECTステートメントの列も同じ順序である必要があります
UNION構文
SELECT column_name(s) FROM table1
UNION
SELECT column_name(s) FROM table2;
UNIONALL構文
UNIONオペレータは、デフォルトでのみ異なる値を選択します。重複する値を許可するには、次を使用しますUNION ALL。

SELECT column_name(s) FROM table1
UNION ALL
SELECT column_name(s) FROM table2;
*/

/*次のSQLステートメントは、「Customers」テーブルと「Suppliers」テーブルの
両方から都市（個別の値のみ）を返します。*/
SELECT City FROM Customer
UNION
SELECT City FROM Supplier
ORDER BY City;


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


