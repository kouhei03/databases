
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


