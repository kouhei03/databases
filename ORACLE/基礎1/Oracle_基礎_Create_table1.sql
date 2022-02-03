
CREATE TABLE TM_商品(
         商品コード     NUMBER  ( 6)    PRIMARY KEY
        ,商品名         VARCHAR2(40)
        ,商品区分       VARCHAR2(20)
        ,仕入単価       NUMBER  ( 9)
        ,売上単価       NUMBER  ( 9)
);
 
CREATE TABLE TM_担当者(
         担当者コード   NUMBER  ( 3)    PRIMARY KEY
        ,上司コード     NUMBER  ( 3)                    /* 上司の担当者コード(自分が主任はNULL) */
        ,担当者名       VARCHAR2(20)
        ,生年月日       DATE
        ,性別           NUMBER  ( 1)                    /* 1:男性 , 2:女性 */
);
 
CREATE TABLE TM_得意先(
         得意先コード   NUMBER  ( 6)    PRIMARY KEY
        ,得意先名       VARCHAR2(20)
        ,住所           VARCHAR2(40)
        ,電話番号       VARCHAR2(16)
        ,請求締日       VARCHAR2( 2)                    /*末日:99*/
);
 
CREATE TABLE TT_売上(
         売上番号       NUMBER  ( 8)    PRIMARY KEY
        ,売上日         DATE
        ,得意先コード   NUMBER  ( 6)
        ,担当者コード   NUMBER  ( 3)
);
 
CREATE TABLE TT_売上明細(
         売上番号       NUMBER  ( 8)
        ,明細番号       NUMBER  ( 3)
        ,商品コード     NUMBER  ( 6)
        ,売上数量       NUMBER  ( 6)
);
ALTER TABLE TT_売上明細 ADD PRIMARY KEY (売上番号,明細番号);
