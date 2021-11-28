/*SQL MIN（）およびMAX（）関数
このMIN()関数は、選択した列の最小値を返します。

このMAX()関数は、選択した列の最大値を返します。

MIN（）構文
SELECT MIN(column_name)
FROM table_name
WHERE condition;

MAX（）構文
SELECT MAX(column_name)
FROM table_name
WHERE condition;
*/


/*MIN（）の例
次のSQLステートメントは、最も安い製品の価格を示しています。*/

SELECT MIN(unitPrice) AS SmallestPrice
FROM Product;

/*MAX（）の例
次のSQLステートメントは、最も高価な製品の価格を示しています。*/

SELECT MAX(unitPrice) AS LargestPrice
FROM Product;


/*COUNT（）の例
次のSQLステートメントは、製品の数を検索します。*/
SELECT COUNT(ProductID)
FROM Product;

/*SQL COUNT（）、AVG（）、およびSUM（）関数
このCOUNT()関数は、指定された基準に一致する行数を返します。

COUNT（）構文
SELECT COUNT(column_name)
FROM table_name
WHERE condition;
このAVG()関数は、数値列の平均値を返します。 

AVG（）構文
SELECT AVG(column_name)
FROM table_name
WHERE condition;
このSUM()関数は、数値列の合計を返します。 

SUM（）構文
SELECT SUM(column_name)
FROM table_name
WHERE condition;
*/

/*COUNT（）の例
次のSQLステートメントは、製品の数を検索します。
注： NULL値はカウントされません。
*/

SELECT COUNT(ProductID)
FROM Product;

/*AVG（）の例
次のSQLステートメントは、すべての製品の平均価格を検索します。*/
SELECT AVG(unitPrice)
FROM Product;

/*SUM（）の例
次のSQLステートメントは、「OrderDetails」テーブルの
「Quantity」フィールドの合計を検索します。*/

SELECT SUM(Quantity)
FROM OrderDetail;


/*SQLLIKE演算子
LIKEオペレータがで使用される WHEREカラムで指定されたパターンを検索する句。

LIKE演算子と組み合わせて使用​​されることが多い2つのワイルドカードがあります。

 パーセント記号（％）は、0文字、1文字、または複数文字を表します
 アンダースコア記号（_）は、1つの単一文字を表します
 パーセント記号とアンダースコアは組み合わせて使用​​することもできます。

【LIKE構文】
SELECT column1, column2, ...
FROM table_name
WHERE columnN LIKE pattern;
*/


/*SQLLIKEの例
次のSQLステートメントは、companyNameが「C」で始まるすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE companyName LIKE 'C%';


/*次のSQLステートメントは、companyNameが「C」で終わるすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE companyName LIKE '%C';

/*次のSQLステートメントは、任意の位置に「om」がある
companyNameを持つすべての顧客を選択します。*/

SELECT * FROM Customer
WHERE companyName LIKE '%om%';


/*次のSQLステートメントは、2番目の位置に「u」がある
companyNameを持つすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE companyName LIKE '_u%';

/*次のSQLステートメントは、「C」で始まり、
長さが3文字以上のcompanyNameを持つすべての顧客を選択します。*/

SELECT * FROM Customer
WHERE companyName LIKE 'C__%';

/*次のSQLステートメントは、「a」で始まり
「o」で終わるContactNameを持つすべての顧客を選択します。*/
SELECT * FROM Customers
WHERE ContactName LIKE 'a%o';



/*次のSQLステートメントは、「a」で始まらないCustomerNameを
持つすべての顧客を選択します。*/

SELECT * FROM Customers
WHERE CustomerName NOT LIKE 'a%';

/*次のSQLステートメントは、「ber」で始まる都市を持つ
すべての顧客を選択します。*/
SELECT * FROM Customer
WHERE City LIKE 'Ber%';

/*次のSQLステートメントは、パターン「es」を含む都市を持つすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE City LIKE '%es%';

/*次のSQLステートメントは、Cityが任意の文字で始まり、
その後に「ondon」が続くすべての顧客を選択します。*/

SELECT * FROM Customer
WHERE City LIKE '_ondon';

/*次のSQLステートメントは、Cityが「L」で始まり、
任意の文字、「n」、任意の文字、「on」の順であるすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE City LIKE 'L_n_on';

/*[charlist]ワイルドカードの使用
次のSQLステートメントは、「b」、「s」、または「p」で始まる
都市を持つすべての顧客を選択します。*/


/*SQLIN演算子
INオペレータは、あなたが複数の値を指定することができます WHERE句。

INオペレータは、複数の省略形です OR条件。

IN構文
SELECT column_name(s)
FROM table_name
WHERE column_name IN (value1, value2, ...);
また：

SELECT column_name(s)
FROM table_name
WHERE column_name IN (SELECT STATEMENT);
*/


/*IN演算子の例
次のSQLステートメントは、「ドイツ」、「フランス」、
または「英国」にあるすべての顧客を選択します。*/

SELECT * FROM Customer
WHERE Country IN ('Germany', 'France', 'UK');


/*次のSQLステートメントは、「ドイツ」、「フランス」、
または「英国」にないすべての顧客を選択します。*/
SELECT * FROM Customer
WHERE Country NOT IN ('Germany', 'France', 'UK');

/*次のSQLステートメントは、サプライヤと同じ国のすべての顧客を選択します。
サプライやテーブルを参照*/
SELECT * FROM Customer
WHERE Country IN (SELECT Country FROM Supplier);

/*SQLBETWEEN演算子
BETWEEN与えられた範囲内のオペレータ選択値。値には、数値、テキスト、または日付を指定できます。

BETWEENオペレータは、包括的である：開始と終了の値が含まれています。 

BETWEEN構文
SELECT column_name(s)
FROM table_name
WHERE column_name BETWEEN value1 AND value2;*/

/*次のSQLステートメントは、価格が10〜20のすべての製品を選択します。*/
SELECT * FROM Product
WHERE unitPrice BETWEEN 10 AND 20;


/*前の例の範囲外の製品を表示するには、次を使用します NOT BETWEEN。*/
SELECT * FROM Product
WHERE unitPrice NOT BETWEEN 10 AND 20;

/*次のSQLステートメントは、価格が10〜20のすべての製品を選択します。
CategoryIDが1、2、または3の商品は表示されません。*/
SELECT * FROM Product
WHERE unitPrice BETWEEN 10 AND 20
AND CategoryID NOT IN (1,2,3);

/*次のSQLステートメントは、ProductNameがProduct RECZEと
Product WEUJZの間にあるすべての製品を選択します。*/
SELECT * FROM Product
WHERE ProductName BETWEEN 'Product RECZE' AND 'Product WEUJZ'
ORDER BY ProductName;

/**/
/**/
/**/
/**/
/**/
/**/
/**/





