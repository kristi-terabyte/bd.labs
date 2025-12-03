-- Лабораторна робота №1
-- Створення бази даних та таблиць для системи управління складом та логістикою
-- інтернет-магазину електроніки

-- Створення бази даних
CREATE DATABASE electronics_store;

-- Підключення до бази даних
\c electronics_store;

-- Таблиця Постачальники
CREATE TABLE suppliers (
    supplier_id SERIAL PRIMARY KEY,
    company_name VARCHAR(100) NOT NULL,
    contact_person VARCHAR(100),
    phone VARCHAR(20) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    address TEXT
);

-- Таблиця Клієнти
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20) NOT NULL,
    delivery_address TEXT NOT NULL
);

-- Таблиця Склади
CREATE TABLE warehouses (
    warehouse_id SERIAL PRIMARY KEY,
    warehouse_name VARCHAR(100) NOT NULL UNIQUE,
    address TEXT NOT NULL,
    area_sqm DECIMAL(10,2),
    responsible_person VARCHAR(100)
);

-- Таблиця Товари
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(200) NOT NULL,
    category VARCHAR(50) NOT NULL,
    purchase_price DECIMAL(10,2) NOT NULL,
    selling_price DECIMAL(10,2) NOT NULL,
    description TEXT,
    supplier_id INTEGER NOT NULL,
    CONSTRAINT fk_supplier FOREIGN KEY (supplier_id) 
        REFERENCES suppliers(supplier_id) ON DELETE RESTRICT
);

-- Таблиця Замовлення
CREATE TABLE orders (
    order_id SERIAL PRIMARY KEY,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    status VARCHAR(20) NOT NULL DEFAULT 'pending',
    total_amount DECIMAL(10,2) NOT NULL,
    customer_id INTEGER NOT NULL,
    CONSTRAINT fk_customer FOREIGN KEY (customer_id) 
        REFERENCES customers(customer_id) ON DELETE RESTRICT,
    CONSTRAINT chk_status CHECK (status IN ('pending', 'processing', 'shipped', 'delivered', 'cancelled'))
);

-- Таблиця Позиції замовлення (зв'язок N:M між Замовленнями та Товарами)
CREATE TABLE order_items (
    order_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL CHECK (quantity > 0),
    unit_price DECIMAL(10,2) NOT NULL,
    PRIMARY KEY (order_id, product_id),
    CONSTRAINT fk_order FOREIGN KEY (order_id) 
        REFERENCES orders(order_id) ON DELETE CASCADE,
    CONSTRAINT fk_product_order FOREIGN KEY (product_id) 
        REFERENCES products(product_id) ON DELETE RESTRICT
);

-- Таблиця Наявність товарів на складах (зв'язок N:M між Складами та Товарами)
CREATE TABLE warehouse_stock (
    warehouse_id INTEGER NOT NULL,
    product_id INTEGER NOT NULL,
    quantity INTEGER NOT NULL DEFAULT 0 CHECK (quantity >= 0),
    PRIMARY KEY (warehouse_id, product_id),
    CONSTRAINT fk_warehouse FOREIGN KEY (warehouse_id) 
        REFERENCES warehouses(warehouse_id) ON DELETE CASCADE,
    CONSTRAINT fk_product_stock FOREIGN KEY (product_id) 
        REFERENCES products(product_id) ON DELETE CASCADE
);

-- Створення індексів для покращення продуктивності
CREATE INDEX idx_products_supplier ON products(supplier_id);
CREATE INDEX idx_orders_customer ON orders(customer_id);
CREATE INDEX idx_orders_date ON orders(order_date);
CREATE INDEX idx_order_items_order ON order_items(order_id);
CREATE INDEX idx_order_items_product ON order_items(product_id);
CREATE INDEX idx_warehouse_stock_warehouse ON warehouse_stock(warehouse_id);
CREATE INDEX idx_warehouse_stock_product ON warehouse_stock(product_id);

-- Коментарі до таблиць
COMMENT ON TABLE suppliers IS 'Таблиця постачальників товарів';
COMMENT ON TABLE customers IS 'Таблиця клієнтів інтернет-магазину';
COMMENT ON TABLE warehouses IS 'Таблиця складських приміщень';
COMMENT ON TABLE products IS 'Таблиця товарів, що продаються в магазині';
COMMENT ON TABLE orders IS 'Таблиця замовлень клієнтів';
COMMENT ON TABLE order_items IS 'Таблиця позицій замовлень (зв''язок N:M між замовленнями та товарами)';
COMMENT ON TABLE warehouse_stock IS 'Таблиця наявності товарів на складах (зв''язок N:M між складами та товарами)';

