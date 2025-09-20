-- Create the Northwind database if it doesn't already exist
IF NOT EXISTS (SELECT * FROM sys.databases WHERE name = 'Northwind')
BEGIN
    CREATE DATABASE Northwind;
END
GO

USE Northwind;
GO

-- Drop tables if they exist to allow for clean re-execution
IF OBJECT_ID('dbo.order_items', 'U') IS NOT NULL DROP TABLE dbo.order_items;
IF OBJECT_ID('dbo.orders', 'U') IS NOT NULL DROP TABLE dbo.orders;
IF OBJECT_ID('dbo.customers', 'U') IS NOT NULL DROP TABLE dbo.customers;
IF OBJECT_ID('dbo.products', 'U') IS NOT NULL DROP TABLE dbo.products;
IF OBJECT_ID('dbo.categories', 'U') IS NOT NULL DROP TABLE dbo.categories;
IF OBJECT_ID('dbo.channels', 'U') IS NOT NULL DROP TABLE dbo.channels;
GO

-- Create channels table
CREATE TABLE channels (
    id INT PRIMARY KEY,
    channel_name VARCHAR(50) NOT NULL
);

-- Create categories table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL,
    description VARCHAR(255)
);

-- Create products table with a foreign key to categories
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    category_id INT FOREIGN KEY REFERENCES categories(category_id),
    unit_price DECIMAL(10, 2) NOT NULL,
    discontinued BIT NOT NULL
);

-- Create customers table with a foreign key to channels
CREATE TABLE customers (
    customer_id INT PRIMARY KEY,
    email VARCHAR(100) NOT NULL,
    full_name VARCHAR(100) NOT NULL,
    address VARCHAR(255),
    city VARCHAR(50),
    region VARCHAR(50),
    postal_code VARCHAR(20),
    country VARCHAR(50),
    phone VARCHAR(20),
    registration_date DATE,
    channel_id INT FOREIGN KEY REFERENCES channels(id),
    first_order_id INT,
    first_order_date DATE,
    last_order_id INT,
    last_order_date DATE
);

-- Create orders table with a foreign key to customers
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_id INT FOREIGN KEY REFERENCES customers(customer_id),
    order_date DATE NOT NULL,
    total_amount DECIMAL(10, 2) NOT NULL,
    ship_name VARCHAR(100),
    ship_address VARCHAR(255),
    ship_city VARCHAR(50),
    ship_region VARCHAR(50),
    ship_postalcode VARCHAR(20),
    ship_country VARCHAR(50),
    shipped_date DATE
);

-- Create order_items table with composite primary key and foreign keys
CREATE TABLE order_items (
    order_id INT FOREIGN KEY REFERENCES orders(order_id),
    product_id INT FOREIGN KEY REFERENCES products(product_id),
    unit_price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    discount DECIMAL(4, 2) NOT NULL,
    PRIMARY KEY (order_id, product_id)
);
GO