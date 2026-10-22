CREATE TABLE INVENTORY (
    item_id INT NOT NULL PRIMARY KEY,
    item_name VARCHAR(40) NOT NULL,
    category VARCHAR(30),
    quantity INT,
    unit_cost DECIMAL(7,2),
    received_on DATE
);
-- ====================================================================================
-- STEP 7
--adding items into the schema
-- ====================================================================================
insert into inventory (item_id, item_name, category, quantity, unit_cost, received_on)
VALUES 
    (1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10'),
    (2, 'Mechanical Keyboard', 'Peripherals', 12, 64.00, '2026-03-05'),
    (3, 'USB Hub', 'Accessories', 40, 22.75, '2026-04-18')
;

SELECT * FROM INVENTORY;

-- ====================================================================================
-- STEP 8
-- updating the cost of only the keyboard
-- ====================================================================================
SELECT item_id, item_name, unit_cost
FROM inventory;

UPDATE inventory
SET unit_cost = 59.99
WHERE item_id = 2;

-- ====================================================================================
-- STEP 9
--creating a view with total values
-- ====================================================================================

CREATE VIEW INVENTORY_VALUE AS
SELECT item_name, quantity, unit_cost, quantity * unit_cost AS total_value
FROM inventory
ORDER BY total_value DESC;

SELECT * FROM inventory_value;

-- ====================================================================================
-- STEP 10
--create a copy of the table
-- ====================================================================================

CREATE TABLE INVENTORY_COPY AS
SELECT *
FROM inventory;

SHOW CREATE TABLE INVENTORY_COPY;

ALTER TABLE inventory_copy
ADD PRIMARY KEY (item_id);

SHOW COLUMNS FROM INVENTORY_COPY;

INSERT INTO inventory_copy (
    item_id, item_name, category, quantity, unit_cost, received_on)
VALUES
(1, 'Laser Mouse', 'Peripherals', 25, 18.50, '2026-02-10');

-- ====================================================================================
-- STEP 11
-- create a new user
-- ====================================================================================
-- creates a new user
CREATE USER 'stockclerk'@'localhost' IDENTIFIED BY 'Stock#2026';
--selects the list and lists all users
SELECT user, host FROM mysql.user ORDER BY user;

-- ====================================================================================
-- STEP 12
-- sign into Git
-- ====================================================================================

--I am on my personal device with Git already signed in

-- ====================================================================================
-- STEP 13
-- push to git
-- ====================================================================================
