CREATE TABLE products (
    id INT SERIAL PRIMARY KEY,
    product_name text,
    price DECIMAL,
    stock_quantity INT,
);

CREATE TABLE customers (
    id INT SERIAL PRIMARY KEY,
    first_name text,
    last_name text,
    email text,
);

CREATE TABLE orders (
    id INT SERIAL PRIMARY KEY,
    customer_id INT REFERENCES customers(id),
    order_date date,
);

CREATE TABLE order_items (
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT,
    PRIMARY KEY (order_id, product_id),
);

INSERT INTO products (product_name, price, stock_quantity) VALUES
('Laptop', 1200.99, 10),
('Mouse', 12.49, 50),
('Keyboard', 39.99, 20),
('Monitor', 199.99, 15),
('Printer', 89.99, 5);

INSERT INTO customers (first_name, last_name, email) VALUES
('Alice', 'Johnson', 'alice@example.com'),
('Bob', 'Smith', 'bob@example.com'),
('Carol', 'Davis', 'carol@example.com'),
('Dave', 'Miller', 'dave@example.com');

INSERT INTO orders (customer_id, order_date) VALUES
(1, '2023-01-01'),
(2, '2023-01-05'),
(1, '2023-02-10'),
(4, '2023-02-15'),
(3, '2023-03-01');

INSERT INTO order_items (order_id, product_id, quantity) VALUES
(1, 1, 1),
(1, 2, 2),
(2, 3, 1),
(2, 4, 1),
(3, 1, 1),
(3, 5, 1),
(4, 2, 2),
(4, 3, 1),
(5, 4, 1),
(5, 5, 1);

SELECT products.product_name, order_items.quantity FROM products;

SELECT products.product_name, order_items.quantity FROM products
JOIN order_items
  ON products.id = order_items.product_id;
WHERE order_items.order_id = 1;

SELECT orders.id, order_items.product_id, order_items.quantity FROM orders
JOIN order_items
  ON orders.id = order_items.order_id;
WHERE orders.customer_id = 1;

UPDATE products SET stock_quantity = stock_quantity - order_items.quantity FROM order_items
WHERE products.id = order_items.product_id AND order_items.order_id = 1;