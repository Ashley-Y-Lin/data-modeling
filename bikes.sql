CREATE TABLE customers (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(25) NOT NULL,
    last_name VARCHAR(25) NOT NULL
);

CREATE TABLE bikes (
    code VARCHAR(4) PRIMARY KEY,
    name VARCHAR(25) NOT NULL,
    price NUMERIC(4, 2) NOT NULL
);

CREATE TABLE single_sale (
    id SERIAL PRIMARY KEY,
    sale_price NUMERIC(4, 2) NOT NULL,
    note VARCHAR(100),
    bike_code VARCHAR(4) NOT NULL REFERENCES bikes,
    order_id SERIAL NOT NULL REFERENCES orders
);

CREATE TABLE orders (
    id SERIAL PRIMARY KEY,
    num_items INT NOT NULL,
    date TIMESTAMP WITH TIME ZONE NOT NULL,
    customer_id SERIAL NOT NULL REFERENCES customers
);