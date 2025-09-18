-- =============================================
-- Step 1: Create Database
-- =============================================
USE master;
GO

IF DB_ID('SportswearDB') IS NOT NULL
    DROP DATABASE SportswearDB;
GO

CREATE DATABASE SportswearDB;
GO

USE SportswearDB;
GO


-- =============================================
-- Step 2: Create Tables
-- =============================================

-- Table: color
CREATE TABLE color (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    extra_fee DECIMAL(5,2) DEFAULT 0.00 CHECK (extra_fee >= 0)
);

-- Table: customer
CREATE TABLE customer (
    id INT PRIMARY KEY,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    favorite_color_id INT NULL,
    CONSTRAINT FK_customer_color FOREIGN KEY (favorite_color_id)
        REFERENCES color(id)
);

-- Table: category
CREATE TABLE category (
    id INT PRIMARY KEY,
    name VARCHAR(50) NOT NULL,
    parent_id INT NULL,
    CONSTRAINT FK_category_parent FOREIGN KEY (parent_id)
        REFERENCES category(id)
);

-- Table: clothing
CREATE TABLE clothing (
    id INT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    size CHAR(3) NOT NULL CHECK (size IN ('S', 'M', 'L', 'XL', '2XL', '3XL')),
    price DECIMAL(8,2) NOT NULL CHECK (price > 0),
    color_id INT NOT NULL,
    category_id INT NOT NULL,
    CONSTRAINT FK_clothing_color FOREIGN KEY (color_id)
        REFERENCES color(id),
    CONSTRAINT FK_clothing_category FOREIGN KEY (category_id)
        REFERENCES category(id)
);

-- Table: clothing_order
CREATE TABLE clothing_order (
    id INT PRIMARY KEY,
    customer_id INT NOT NULL,
    clothing_id INT NOT NULL,
    items INT NOT NULL CHECK (items >= 1),
    order_date DATE NOT NULL,
    CONSTRAINT FK_clothing_order_customer FOREIGN KEY (customer_id)
        REFERENCES customer(id),
    CONSTRAINT FK_clothing_order_clothing FOREIGN KEY (clothing_id)
        REFERENCES clothing(id)
);

INSERT INTO color (id, name, extra_fee) VALUES
(1, 'Black', 0.00),
(2, 'White', 0.00),
(3, 'Red', 1.50),
(4, 'Blue', 1.20),
(5, 'Green', 1.00),
(6, 'Yellow', 0.80),
(7, 'Purple', 1.50),
(8, 'Pink', 1.20),
(9, 'Brown', 0.50),
(10, 'Gray', 0.30),
(11, 'Navy Blue', 1.00),
(12, 'Olive Green', 1.00),
(13, 'Sky Blue', 0.70),
(14, 'Maroon', 1.40),
(15, 'Beige', 0.40),
(16, 'Teal', 1.20),
(17, 'Orange', 1.10),
(18, 'Lavender', 1.30),
(19, 'Turquoise', 1.20),
(20, 'Mustard', 1.00),
(21, 'Charcoal', 0.50),
(22, 'Cream', 0.30),
(23, 'Khaki', 0.40),
(24, 'Cyan', 1.10),
(25, 'Magenta', 1.50);



INSERT INTO category (id, name, parent_id) VALUES
(1, 'Men', NULL),
(2, 'Women', NULL),
(3, 'Kids', NULL),
(4, 'Shirts', 1),
(5, 'T-Shirts', 1),
(6, 'Jeans', 1),
(7, 'Shoes', 1),
(8, 'Dresses', 2),
(9, 'Skirts', 2),
(10, 'Tops', 2),
(11, 'Shoes', 2),
(12, 'Jackets', 1),
(13, 'Sweaters', 1),
(14, 'Formal Wear', 1),
(15, 'Casual Wear', 2),
(16, 'Shorts', 1),
(17, 'Winter Wear', 2),
(18, 'School Uniforms', 3),
(19, 'Sportswear', 1),
(20, 'Accessories', 2),
(21, 'Baby Clothing', 3),
(22, 'Outerwear', 1),
(23, 'Party Wear', 2),
(24, 'Ethnic Wear', 2),
(25, 'Swimwear', 2);




INSERT INTO customer (id, first_name, last_name, favorite_color_id) VALUES
(1, 'Ali', 'Khan', 3),
(2, 'Sara', 'Ahmed', 8),
(3, 'John', 'Smith', 1),
(4, 'Emily', 'Brown', 4),
(5, 'David', 'Johnson', 5),
(6, 'Ayesha', 'Malik', 2),
(7, 'Michael', 'Williams', 11),
(8, 'Emma', 'Taylor', 6),
(9, 'Omar', 'Hassan', 9),
(10, 'Sophia', 'Lee', 7),
(11, 'James', 'Clark', 10),
(12, 'Maria', 'Rodriguez', 12),
(13, 'Ahmed', 'Raza', 14),
(14, 'William', 'Davis', 13),
(15, 'Noor', 'Fatima', 18),
(16, 'Hassan', 'Shah', 21),
(17, 'Olivia', 'Martin', 17),
(18, 'Zara', 'Sheikh', 15),
(19, 'Robert', 'Miller', 20),
(20, 'Hina', 'Javed', 19),
(21, 'Daniel', 'Anderson', 23),
(22, 'Maryam', 'Ali', 16),
(23, 'Christopher', 'Hall', 25),
(24, 'Fatima', 'Yousuf', 22),
(25, 'Adam', 'Scott', 24);


INSERT INTO clothing (id, name, size, price, color_id, category_id) VALUES
(1, 'Casual Shirt', 'M', 25.00, 1, 4),
(2, 'Formal Shirt', 'L', 35.00, 2, 4),
(3, 'Blue Jeans', 'M', 40.00, 4, 6),
(4, 'Red T-Shirt', 'S', 20.00, 3, 5),
(5, 'Black Dress', 'M', 60.00, 1, 8),
(6, 'White Sneakers', 'L', 50.00, 2, 7),
(7, 'Green Hoodie', 'XL', 45.00, 5, 12),
(8, 'Yellow Skirt', 'M', 30.00, 6, 9),
(9, 'Purple Top', 'S', 28.00, 7, 10),
(10, 'Pink Heels', 'M', 55.00, 8, 11),
(11, 'Brown Jacket', 'L', 80.00, 9, 12),
(12, 'Gray Sweater', 'M', 35.00, 10, 13),
(13, 'Navy Blue Suit', 'L', 120.00, 11, 14),
(14, 'Casual T-Shirt', 'M', 22.00, 12, 15),
(15, 'Olive Shorts', 'M', 25.00, 12, 16),
(16, 'Winter Coat', 'XL', 150.00, 21, 17),
(17, 'School Uniform Shirt', 'M', 20.00, 2, 18),
(18, 'Sportswear Tracksuit', 'L', 70.00, 4, 19),
(19, 'Handbag', 'M', 90.00, 15, 20),
(20, 'Baby Onesie', 'S', 15.00, 22, 21),
(21, 'Leather Jacket', 'M', 110.00, 1, 22),
(22, 'Evening Gown', 'M', 200.00, 18, 23),
(23, 'Kurta', 'L', 50.00, 14, 24),
(24, 'Swimsuit', 'S', 35.00, 17, 25),
(25, 'Track Pants', 'M', 40.00, 13, 19);



INSERT INTO clothing_order (id, customer_id, clothing_id, items, order_date) VALUES
(1, 1, 3, 1, '2025-01-12'),
(2, 1, 4, 2, '2025-01-15'),
(3, 2, 5, 1, '2025-02-01'),
(4, 3, 1, 3, '2025-02-10'),
(5, 3, 2, 1, '2025-02-18'),
(6, 3, 6, 1, '2025-02-25'),
(7, 4, 7, 1, '2025-03-01'),
(8, 5, 8, 2, '2025-03-05'),
(9, 6, 9, 1, '2025-03-08'),
(10, 7, 10, 1, '2025-03-10'),
(11, 7, 11, 1, '2025-03-15'),
(12, 8, 12, 2, '2025-03-18'),
(13, 9, 13, 1, '2025-03-20'),
(14, 10, 14, 1, '2025-03-22'),
(15, 11, 15, 2, '2025-03-25'),
(16, 12, 16, 1, '2025-04-01'),
(17, 13, 17, 3, '2025-04-05'),
(18, 14, 18, 1, '2025-04-07'),
(19, 15, 19, 1, '2025-04-10'),
(20, 16, 20, 2, '2025-04-12'),
(21, 17, 21, 1, '2025-04-15'),
(22, 18, 22, 1, '2025-04-18'),
(23, 19, 23, 1, '2025-04-20'),
(24, 20, 24, 1, '2025-04-25'),
(25, 21, 25, 2, '2025-04-28');

SELECT 'color' AS table_name, COUNT(*) Total_Values FROM color
UNION ALL
SELECT 'category', COUNT(*) FROM category
UNION ALL
SELECT 'customer', COUNT(*) FROM customer
UNION ALL
SELECT 'clothing', COUNT(*) FROM clothing
UNION ALL
SELECT 'clothing_order', COUNT(*) FROM clothing_order;