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

