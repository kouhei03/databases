/*SQLチェック制約
CHECK制約は、列に配置することができる値の範囲を制限するために使用されます。
CHECK列に制約を定義すると、この列には特定の値のみが許可されます。
CHECKテーブルに制約を定義すると、その行の他の列の値に基づいて、特定の列の値を制限できます。*/


/*CREATETABLEのSQLチェック
次のSQLはCHECK、「Persons」テーブルの作成時に
「Age」列に制約を作成します。CHECK人の年齢が18、
またはそれ以上の年齢でなければならないという制約を保証します。*/

create database test1;
use test1;
CREATE TABLE Persons6 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    CHECK (Age>=18)
);

/*CHECK制約の命名を許可し CHECK、複数の列に制約を定義するには、次のSQL構文を使用します。*/
use test1;
CREATE TABLE Persons888 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255),
    CONSTRAINT CHK_Person CHECK (Age>=18 AND City='Sandnes')
);

/*SQLDEFAULT制約
DEFAULT制約は、列のデフォルト値を設定するために使用されます。

他の値が指定されていない場合、デフォルト値がすべての新しいレコードに追加されます。

CREATETABLEのSQLDEFAULT
次のSQLはDEFAULT、「Persons」テーブルが作成されるときに「City」列の値を設定します。*/

CREATE TABLE Persons66 (
    ID int NOT NULL,
    LastName varchar(255) NOT NULL,
    FirstName varchar(255),
    Age int,
    City varchar(255) DEFAULT 'Sandnes'
);

/*ALTERTABLEのSQLDEFAULT
DEFAULTテーブルがすでに作成されているときに「City」列に制約を
作成するには、次のSQLを使用します。*/
ALTER TABLE Persons66
ALTER City SET DEFAULT 'Sandnes';

/*デフォルトの制約を削除する
DEFAULT制約を削除するには、次のSQLを使用します。*/
ALTER TABLE Persons66
ALTER City DROP DEFAULT;


/*SQL CREATEINDEXステートメント
このCREATE INDEXステートメントは、テーブルにインデックスを作成するために使用されます。

インデックスは、他の方法よりも迅速にデータベースからデータを取得するために使用されます。ユーザーはインデックスを見ることができず、検索/クエリを高速化するために使用されます。

注：インデックスを使用してテーブルを更新する場合は、インデックスを使用せずにテーブルを更新するよりも時間がかかります（インデックスも更新する必要があるため）。したがって、頻繁に検索される列にのみインデックスを作成します。

CREATEINDEX構文
テーブルにインデックスを作成します。重複する値が許可されます：

CREATE INDEX index_name
ON table_name (column1, column2, ...);
CREATE UNIQUEINDEX構文
テーブルに一意のインデックスを作成します。重複する値は許可されていません：

CREATE UNIQUE INDEX index_name
ON table_name (column1, column2, ...);
*/


/*CREATEINDEXの例
以下のSQLステートメントは、「Persons」テーブルの「LastName」列に
「idx_lastname」という名前のインデックスを作成します。*/
CREATE INDEX idx_lastname
ON Persons66 (LastName);

/*列の組み合わせにインデックスを作成する場合は、
括弧内に列名をコンマで区切ってリストできます。*/
CREATE INDEX idx_pname
ON Persons66 (LastName, FirstName);

/*DROPINDEXステートメント
このDROP INDEXステートメントは、テーブル内の
インデックスを削除するために使用されます。*/
ALTER TABLE Persons66
DROP INDEX idx_pname;

/*OrderDateが「2008-11-11」のレコードを選択します。*/
use Northwind;
SELECT * FROM SalesOrder WHERE orderDate='2008-11-11';

/**/
/**/
/**/
/**/
/**/
/**/
/**/
/**/

