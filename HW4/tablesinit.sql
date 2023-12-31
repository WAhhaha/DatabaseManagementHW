USE HW4;

DROP TABLE IF EXISTS 商品;
DROP TABLE IF EXISTS 商品成本;
DROP TABLE IF EXISTS 商品類別;
DROP TABLE IF EXISTS 客戶資訊;
DROP TABLE IF EXISTS 銷貨單;
DROP TABLE IF EXISTS 交易人員;
DROP TABLE IF EXISTS 交易資訊;

CREATE TABLE 商品 (
  品號 NVARCHAR(16) PRIMARY KEY,
  品名 NVARCHAR(64),
  單位 NVARCHAR(16)
);

CREATE TABLE 商品成本 (
  品號 NVARCHAR(16) NOT NULL,
  成本 FLOAT,
  CONSTRAINT FK_PRCO FOREIGN KEY (品號)
  REFERENCES 商品(品號)
);

CREATE TABLE 商品類別 (
  品號 NVARCHAR(16) NOT NULL,
  分類 NVARCHAR(32),
  CONSTRAINT FK_PRCA FOREIGN KEY (品號)
  REFERENCES 商品(品號)
);

CREATE TABLE 商品庫存 (
  品號 NVARCHAR(16) NOT NULL,
  庫存 INT,
  CONSTRAINT FK_PRST FOREIGN KEY (品號)
  REFERENCES 商品(品號)
)

CREATE TABLE 客戶資訊 (
  客戶 NVARCHAR(16) PRIMARY KEY,
  簡稱 NVARCHAR(32)
);

CREATE TABLE 銷貨單 (
  單號 NVARCHAR(32) PRIMARY KEY,
  日期 NVARCHAR(16)
);

CREATE TABLE 交易人員 (
  單號 NVARCHAR(32) NOT NULL,
  客戶 NVARCHAR(16) NOT NULL,
  業務 NVARCHAR(16),
  CONSTRAINT FK_SAPA FOREIGN KEY (單號)
  REFERENCES 銷貨單(單號),
  CONSTRAINT FK_CUPA FOREIGN KEY (客戶)
  REFERENCES 客戶資訊(客戶)
);

CREATE TABLE 交易資訊 (
  單號 NVARCHAR(32) NOT NULL,
  品號 NVARCHAR(16) NOT NULL,
  售價 FLOAT NOT NULL,
  數量 INT NOT NULL, 
  CONSTRAINT FK_SASI FOREIGN KEY (單號)
  REFERENCES 銷貨單(單號),
  CONSTRAINT FK_PRSI FOREIGN KEY (品號)
  REFERENCES 商品(品號)
);

