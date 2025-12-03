-- Лабораторна робота №1
-- Вставка тестових даних у таблиці бази даних

-- Вставка даних у таблицю suppliers
INSERT INTO suppliers (company_name, contact_person, phone, email, address) VALUES
('TechSupply Co.', 'Іван Петренко', '+380501234567', 'info@techsupply.com', 'вул. Хрещатик, 1, Київ'),
('ElectroWorld Ltd.', 'Марія Коваленко', '+380502345678', 'sales@electroworld.com', 'просп. Перемоги, 25, Львів'),
('Digital Solutions', 'Олександр Сидоренко', '+380503456789', 'contact@digitalsolutions.com', 'вул. Соборна, 10, Одеса');

-- Вставка даних у таблицю customers
INSERT INTO customers (full_name, email, phone, delivery_address) VALUES
('Петро Іваненко', 'petro.ivanenko@email.com', '+380671111111', 'вул. Шевченка, 15, кв. 23, Київ'),
('Олена Мельник', 'olena.melnyk@email.com', '+380672222222', 'просп. Грушевського, 42, Львів'),
('Василь Коваль', 'vasyl.koval@email.com', '+380673333333', 'вул. Дерибасівська, 8, Одеса'),
('Наталія Шевченко', 'natalia.shevchenko@email.com', '+380674444444', 'вул. Незалежності, 100, Харків');

-- Вставка даних у таблицю warehouses
INSERT INTO warehouses (warehouse_name, address, area_sqm, responsible_person) VALUES
('Склад №1 (Київ)', 'вул. Промислова, 50, Київ', 500.00, 'Сергій Лисенко'),
('Склад №2 (Львів)', 'вул. Складська, 12, Львів', 350.00, 'Тетяна Марченко');

-- Вставка даних у таблицю products
INSERT INTO products (product_name, category, purchase_price, selling_price, description, supplier_id) VALUES
('Ноутбук Dell XPS 15', 'Ноутбуки', 35000.00, 45000.00, '15.6", Intel i7, 16GB RAM, 512GB SSD', 1),
('Смартфон Samsung Galaxy S23', 'Смартфони', 25000.00, 32000.00, '6.1", 128GB, 5G', 2),
('Планшет iPad Pro 12.9"', 'Планшети', 40000.00, 52000.00, '12.9", M2, 256GB, Wi-Fi', 3),
('Ноутбук MacBook Pro 14"', 'Ноутбуки', 55000.00, 70000.00, '14", M2 Pro, 16GB RAM, 512GB SSD', 1),
('Смартфон iPhone 15 Pro', 'Смартфони', 38000.00, 48000.00, '6.1", 256GB, Titanium', 2);

-- Вставка даних у таблицю orders
INSERT INTO orders (order_date, status, total_amount, customer_id) VALUES
('2024-01-15', 'delivered', 77000.00, 1),
('2024-01-20', 'shipped', 48000.00, 2),
('2024-01-25', 'processing', 122000.00, 3);

-- Вставка даних у таблицю order_items
INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 45000.00),  -- Ноутбук Dell XPS 15
(1, 2, 1, 32000.00),  -- Смартфон Samsung Galaxy S23
(2, 5, 1, 48000.00),  -- Смартфон iPhone 15 Pro
(3, 4, 1, 70000.00),  -- Ноутбук MacBook Pro 14"
(3, 5, 1, 48000.00),  -- Смартфон iPhone 15 Pro
(3, 3, 1, 52000.00);  -- Планшет iPad Pro 12.9"

-- Вставка даних у таблицю warehouse_stock
INSERT INTO warehouse_stock (warehouse_id, product_id, quantity) VALUES
(1, 1, 5),   -- Ноутбук Dell XPS 15 на складі №1
(1, 2, 10),  -- Смартфон Samsung Galaxy S23 на складі №1
(1, 3, 3),   -- Планшет iPad Pro на складі №1
(1, 4, 2),   -- Ноутбук MacBook Pro на складі №1
(2, 2, 8),   -- Смартфон Samsung Galaxy S23 на складі №2
(2, 3, 5),   -- Планшет iPad Pro на складі №2
(2, 5, 12),  -- Смартфон iPhone 15 Pro на складі №2
(1, 5, 4);   -- Смартфон iPhone 15 Pro на складі №1

