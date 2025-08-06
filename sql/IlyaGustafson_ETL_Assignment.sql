DROP TABLE IF EXISTS stagingTable;

CREATE TABLE stagingTable (
    yearInt INT(4),
    monthInt INT(2),
    state TEXT,
    country TEXT,
    region TEXT,
    Product_Name TEXT,
    unitPrice INT,
    quantity INT,
    orderTotal INT,
    customer_id INT
);

INSERT INTO stagingTable("monthInt", "state", "country", "region", "Product_Name", "unitPrice", "quantity", "orderTotal", "customer_id")
SELECT `Month`, `State`, `Country`, `Region`, `Product`, `Per-Unit_Price`, `Quantity`, `Order_Total`, NULL FROM pd2022;

UPDATE stagingTable SET yearInt=2022;

INSERT INTO stagingTable("monthInt", "state", "country", "region", "Product_Name", "unitPrice", "quantity", "orderTotal", "customer_id")
SELECT `Month`, NULL, NULL, `Region`, `Product`, `Per-Unit_Price`, (`Quantity_1` + `Quantity_2`), (`Per-Unit_Price` * (`Quantity_1` + `Quantity_2`)), `Customer_ID` FROM pd2023;

UPDATE stagingTable SET yearInt=2023 WHERE yearInt ISNULL;

INSERT INTO stagingTable("monthInt", "state", "country", "region", "Product_Name", "unitPrice", "quantity", "orderTotal", "customer_id")
SELECT `Month`, `State`, `Country`, `Region`, `Product`, `Per-Unit_Price`, `Quantity`, (`Order_Subtotal` - `Quantity_Discount`), NULL FROM pd2024;

UPDATE stagingTable SET yearInt=2024 WHERE yearInt ISNULL;

SELECT * FROM stagingTable;

SELECT sum(yearInt * monthInt * orderTotal)%2341 as checksum FROM stagingTable;