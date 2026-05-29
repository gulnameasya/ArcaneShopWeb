
-- USERS
CREATE TABLE IF NOT EXISTS users (
    id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    password VARCHAR(255) NOT NULL,
    phone VARCHAR(20),
    address TEXT,
    role VARCHAR(20) DEFAULT 'customer',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- CATEGORIES
CREATE TABLE IF NOT EXISTS categories (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT,
    is_active BOOLEAN DEFAULT TRUE
);

-- PRODUCTS
CREATE TABLE IF NOT EXISTS products (
    id SERIAL PRIMARY KEY,
    category_id INT REFERENCES categories(id),
    name VARCHAR(150) NOT NULL,
    description TEXT,
    price NUMERIC(10,2) NOT NULL,
    stock INT NOT NULL,
    image_url VARCHAR(255),
    is_active BOOLEAN DEFAULT TRUE,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- ORDERS
CREATE TABLE IF NOT EXISTS orders (
    id SERIAL PRIMARY KEY,
    user_id INT REFERENCES users(id),
    order_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    total_amount NUMERIC(10,2),
    status VARCHAR(50)
);

-- ORDER ITEMS
CREATE TABLE IF NOT EXISTS order_items (
    id SERIAL PRIMARY KEY,
    order_id INT REFERENCES orders(id),
    product_id INT REFERENCES products(id),
    quantity INT NOT NULL,
    unit_price NUMERIC(10,2),
    subtotal NUMERIC(10,2)
);

-- TEST DATA (KATEGORİ)
INSERT INTO categories (name, description)
VALUES 
('Kitap', 'Kitaplar'),
('Elektronik', 'Elektronik ürünler')
ON CONFLICT DO NOTHING;

-- TEST DATA (ÜRÜN)
INSERT INTO products (category_id, name, description, price, stock)
VALUES 
(1, 'Fantastik Roman', 'Büyülü bir hikaye', 150.00, 10),
(2, 'Kulaklık', 'Kablosuz kulaklık', 800.00, 5);

SELECT * FROM products;
