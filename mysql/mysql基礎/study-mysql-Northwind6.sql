
/*SQL算術演算子*/
SELECT 30 + 20;
SELECT 30 - 20;
SELECT 30 * 20;
SELECT 30 / 10;
SELECT 17 % 5;

/*SQL比較演算子*/
SELECT * FROM Product
WHERE unitPrice = 18;

SELECT * FROM Product
WHERE unitPrice > 30;

SELECT * FROM Product
WHERE unitPrice < 30;

SELECT * FROM Product
WHERE unitPrice >= 30;

SELECT * FROM Product
WHERE unitPrice <= 30;

SELECT * FROM Product
WHERE unitPrice <> 30;



/*CREATEDATABASEの例
次のSQLステートメントは、「testDB」というデータベースを作成します。*/
CREATE DATABASE testDB;

/*DROPDATABASEの例
    次のSQLステートメントは、既存のデータベース「testDB」を削除します。*/
    DROP DATABASE testDB;

/*
SQL BACKUPDATABASEステートメント
このBACKUP DATABASEステートメントは、SQL Serverで、既存のSQLデータベースの
完全バックアップを作成するために使用されます。*/

/*バックアップデータベースの例
次のSQLステートメントは、既存のデータベース「testDB」のDディスクへの完全バックアップを作成します。*/
BACKUP DATABASE testDB
TO DISK = 'D:\backups\testDB.bak';

/*SQL BACKUP WITHDIFFERENTIALステートメント
差分バックアップは、最後の完全データベースバックアップ以降に
変更されたデータベースの部分のみをバックアップします。*/

BACKUP DATABASE databasename
TO DISK = 'filepath'
WITH DIFFERENTIAL;

/*SQL CREATETABLEステートメント
このCREATE TABLEステートメントは、データベースに新しいテーブルを作成するために使用されます。

構文
CREATE TABLE table_name (
    column1 datatype,
    column2 datatype,
    column3 datatype,
   ....
);
列パラメーターは、テーブルの列の名前を指定します。

datatypeパラメーターは、列が保持できるデータのタイプ（varchar、integer、dateなど）を指定します。*/


/*SQL CREATETABLEの例
次の例では、PersonID、LastName、FirstName、Address、
Cityの5つの列を含む「Persons」というテーブルを作成します。*/
CREATE TABLE Persons
(
PersonID int,
LastName varchar(255),
FirstName varchar(255),
Address varchar(255),
City varchar(255)
);

/*別のテーブルを使用してテーブルを作成する
既存のテーブルのコピーは、を使用して作成することもできます CREATE TABLE。

新しいテーブルは同じ列定義を取得します。すべての列または特定の列を選択できます。
既存のテーブルを使用して新しいテーブルを作成する場合、
新しいテーブルには古いテーブルの既存の値が入力されます。*/

/*次のSQLは、「TestTables」（「Customers」テーブルのコピー）という新しいテーブルを作成します。*/
CREATE TABLE TestTable7 AS
SELECT companyName, contactName
FROM Customer;

/*SQL ALTERTABLEステートメント
このALTER TABLEステートメントは、既存のテーブルの列を追加、削除、または変更するために使用されます。

このALTER TABLEステートメントは、既存のテーブルにさまざまな制約を追加および削除するためにも使用されます。

ALTERTABLE-ADD列
テーブルに列を追加するには、次の構文を使用します。

ALTER TABLE table_name
ADD column_name datatype;*/

/*のSQLは、「Email」列を「test77」テーブルに追加します。*/
ALTER TABLE test77
ADD Email varchar(255);


/*ALTER TABLE-DROP COLUMN
テーブルの列を削除するには、次の構文を使用します（一部のデータベースシステムでは列の削除が許可されていないことに注意してください）。

ALTER TABLE table_name
DROP COLUMN column_name;
次のSQLは、「Customers」テーブルから「Email」列を削除します。*/

ALTER TABLE Customers
DROP COLUMN Email;

/*
ALTER TABLE-ALTER / MODIFY COLUMN
テーブルの列のデータ型を変更するには、次の構文を使用します。

SQL Server / MS Access：

ALTER TABLE table_name
ALTER COLUMN column_name datatype;
私のSQL / Oracle（以前のバージョン10G）：

ALTER TABLE table_name
MODIFY COLUMN column_name datatype;

Oracle 10G以降：

ALTER TABLE table_name
MODIFY column_name datatype;
*/

/*
SQL NOTNULL制約
デフォルトでは、列はNULL値を保持できます。

NOT NULL制約は、NULL値を受け入れないように列を適用します。
これにより、フィールドに常に値が含まれるようになります。
つまり、このフィールドに値を追加せずに、新しいレコードを挿入したり、
レコードを更新したりすることはできません。

CREATETABLEでSQLNOT NULL
次のSQLは、「Persons77」テーブルの作成時に「ID」、「
LastName」、および「FirstName」列がNULL値を受け入れないようにします。*/

CREATE TABLE Persons77 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255) NOT NULL,
    Age int
);

/*ALTERTABLEでSQLNOT NULL
NOT NULL「Persons」テーブルがすでに作成されているときに
「Age」列に制約を作成するには、次のSQLを使用します。*/
ALTER TABLE Persons77
MODIFY Age int NOT NULL;

/*SQLUNIQUE制約
UNIQUE制約は、列のすべての値が異なっていることを保証します。

UNIQUEと PRIMARY KEY制約の両方が、列または列のセットの一意性を保証します。

PRIMARY KEY制約が自動的に持ち UNIQUE制約を。

ただし、UNIQUEテーブルごとに多くの制約を設定できますが、テーブルPRIMARY KEYごとに1つの制約のみ を設定できます。

CREATETABLEに対するSQLUNIQUE制約
次のSQLはUNIQUE、「Persons」テーブルが作成されるときに「ID」列に制約を作成します。*/
CREATE TABLE Persons777 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    UNIQUE (ID)
);
/*ALTERTABLEに対するSQLUNIQUE制約
UNIQUEテーブルがすでに作成されているときに「ID」列に制約を作成するには、次のSQLを使用します。
MySQL / SQL Server / Oracle / MS Access：*/

ALTER TABLE Customer
ADD UNIQUE (custId);
/*UNIQUE制約に名前を付け、UNIQUE複数の列に制約を定義する には、次のSQL構文を使用します。*/
ALTER TABLE Customer
ADD CONSTRAINT UC_Person UNIQUE (custId,LastName);

/*一意の制約を削除する
UNIQUE制約を削除するには、次のSQLを使用します。*/
ALTER TABLE Persons
DROP INDEX UC_Person;

/*SQL PRIMARYKEY制約
PRIMARY KEY制約は、一意にテーブル内の各レコードを識別する。

主キーにはUNIQUE値を含める必要があり、NULL値を含めることはできません。
テーブルに含めることができる主キーは1つだけです。表では、この主キーは単一または複数の列（フィールド）で構成できます。

CREATETABLEのSQLPRIMARY KEY
次のSQLはPRIMARY KEY、「Persons」テーブルが作成されるときに「ID」列にを作成します。*/
CREATE TABLE Persons7777 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    PRIMARY KEY (ID)
);

/*PRIMARY KEY制約の命名を許可しPRIMARY KEY、
複数の列に制約を定義する には、次のSQL構文を使用します。*/
CREATE TABLE Persons77777 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CONSTRAINT PK_Person PRIMARY KEY (ID,LastName)
);
/*ALTERTABLEのSQLPRIMARY KEY
PRIMARY KEYテーブルがすでに作成されているときに「ID」列に
制約を作成するには、次のSQLを使用します。*/
ALTER TABLE Persons77
ADD PRIMARY KEY (ID);

/*主キー制約を削除する
PRIMARY KEY制約を削除するには、次のSQLを使用します。*/
ALTER TABLE Persons77
DROP PRIMARY KEY;

/*CREATETABLEのSQL外部キー
次のSQLはFOREIGN KEY、「Orders」テーブルが作成されるときに「PersonID」列にを作成します。*/
CREATE TABLE Orders777 (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    custId int,
    PRIMARY KEY (orderID),
    FOREIGN KEY (custId) REFERENCES Customer(custId)
);
/*FOREIGN KEY制約の命名を許可し FOREIGN KEY、複数の列に
制約を定義するには、次のSQL構文を使用します。*/

CREATE TABLE Orders77 (
    OrderID int NOT NULL,
    OrderNumber int NOT NULL,
    custID int,
    PRIMARY KEY (OrderID),
    CONSTRAINT FK_PersonOrder FOREIGN KEY (custID)
    REFERENCES Customer(custID)
);

/*ALTERTABLEのSQL外部キー
FOREIGN KEY「Orders」テーブルがすでに作成されているときに
「PersonID」列に制約を作成するには、次のSQLを使用します。*/
ALTER TABLE Orders77
ADD FOREIGN KEY (custID) REFERENCES Customer(custID);
/*外部キーの確認方法*/
SHOW CREATE TABLE Orders77;

/*外部キー制約を削除する
FOREIGN KEY制約を削除するには、次のSQLを使用します。*/
ALTER TABLE Orders
DROP FOREIGN KEY FK_PersonOrder;
