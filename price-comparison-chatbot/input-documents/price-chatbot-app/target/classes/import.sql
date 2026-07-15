-- Sample data for Price Comparison Chatbot

-- Insert Brands
INSERT INTO brands (id, name, website) VALUES (1, 'Amazon', 'https://www.amazon.com');
INSERT INTO brands (id, name, website) VALUES (2, 'Best Buy', 'https://www.bestbuy.com');
INSERT INTO brands (id, name, website) VALUES (3, 'Walmart', 'https://www.walmart.com');
INSERT INTO brands (id, name, website) VALUES (4, 'Apple Store', 'https://www.apple.com');
INSERT INTO brands (id, name, website) VALUES (5, 'Costco', 'https://www.costco.com');

-- Insert Products - Smartphones
INSERT INTO products (id, name, category, description, specifications) VALUES (1, 'iPhone 15 Pro', 'Smartphones', 'Latest Apple flagship smartphone with A17 Pro chip', 'Display: 6.1" OLED, Storage: 128GB, Camera: 48MP, 5G enabled');
INSERT INTO products (id, name, category, description, specifications) VALUES (2, 'Samsung Galaxy S24', 'Smartphones', 'Premium Android smartphone with AI features', 'Display: 6.2" AMOLED, Storage: 256GB, Camera: 50MP, 5G enabled');
INSERT INTO products (id, name, category, description, specifications) VALUES (3, 'Google Pixel 8 Pro', 'Smartphones', 'Google flagship with advanced AI photography', 'Display: 6.7" OLED, Storage: 128GB, Camera: 50MP, Tensor G3 chip');

-- Insert Products - Laptops
INSERT INTO products (id, name, category, description, specifications) VALUES (4, 'MacBook Air M2', 'Laptops', 'Thin and light laptop with Apple M2 chip', 'Display: 13.6" Liquid Retina, RAM: 8GB, Storage: 256GB SSD, Battery: 18 hours');
INSERT INTO products (id, name, category, description, specifications) VALUES (5, 'Dell XPS 15', 'Laptops', 'Premium Windows laptop for professionals', 'Display: 15.6" 4K OLED, RAM: 16GB, Storage: 512GB SSD, Intel i7');
INSERT INTO products (id, name, category, description, specifications) VALUES (6, 'HP Spectre x360', 'Laptops', 'Convertible 2-in-1 laptop with touchscreen', 'Display: 13.5" OLED Touch, RAM: 16GB, Storage: 512GB SSD, Intel i7');

-- Insert Products - Headphones
INSERT INTO products (id, name, category, description, specifications) VALUES (7, 'Sony WH-1000XM5', 'Headphones', 'Industry-leading noise canceling headphones', 'Type: Over-ear, Noise Canceling: Yes, Battery: 30 hours, Bluetooth 5.2');
INSERT INTO products (id, name, category, description, specifications) VALUES (8, 'AirPods Pro 2', 'Headphones', 'Apple wireless earbuds with active noise cancellation', 'Type: In-ear, Noise Canceling: Yes, Battery: 6 hours, Spatial Audio');
INSERT INTO products (id, name, category, description, specifications) VALUES (9, 'Bose QuietComfort 45', 'Headphones', 'Premium wireless headphones with excellent comfort', 'Type: Over-ear, Noise Canceling: Yes, Battery: 24 hours, Bluetooth 5.1');

-- Insert Products - Tablets
INSERT INTO products (id, name, category, description, specifications) VALUES (10, 'iPad Pro 12.9', 'Tablets', 'Professional tablet with M2 chip', 'Display: 12.9" Liquid Retina XDR, Storage: 256GB, M2 chip, 5G optional');

-- Insert Prices for iPhone 15 Pro
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (1, 1, 1, 999.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/iphone-15-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (2, 1, 2, 1049.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/iphone-15-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (3, 1, 3, 1099.99, 'USD', false, CURRENT_TIMESTAMP, 'https://walmart.com/iphone-15-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (4, 1, 4, 999.00, 'USD', true, CURRENT_TIMESTAMP, 'https://apple.com/iphone-15-pro');

-- Insert Prices for Samsung Galaxy S24
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (5, 2, 1, 849.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/galaxy-s24');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (6, 2, 2, 899.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/galaxy-s24');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (7, 2, 3, 849.00, 'USD', true, CURRENT_TIMESTAMP, 'https://walmart.com/galaxy-s24');

-- Insert Prices for Google Pixel 8 Pro
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (8, 3, 1, 899.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/pixel-8-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (9, 3, 2, 949.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/pixel-8-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (10, 3, 3, 899.00, 'USD', false, CURRENT_TIMESTAMP, 'https://walmart.com/pixel-8-pro');

-- Insert Prices for MacBook Air M2
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (11, 4, 1, 1149.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/macbook-air-m2');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (12, 4, 2, 1199.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/macbook-air-m2');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (13, 4, 4, 1199.00, 'USD', true, CURRENT_TIMESTAMP, 'https://apple.com/macbook-air');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url, notes) VALUES (14, 4, 5, 1099.99, 'USD', true, CURRENT_TIMESTAMP, 'https://costco.com/macbook-air-m2', 'Members only');

-- Insert Prices for Dell XPS 15
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (15, 5, 1, 1799.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/dell-xps-15');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (16, 5, 2, 1849.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/dell-xps-15');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (17, 5, 3, 1799.00, 'USD', true, CURRENT_TIMESTAMP, 'https://walmart.com/dell-xps-15');

-- Insert Prices for HP Spectre x360
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (18, 6, 1, 1449.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/hp-spectre-x360');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (19, 6, 2, 1499.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/hp-spectre-x360');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (20, 6, 3, 1449.00, 'USD', false, CURRENT_TIMESTAMP, 'https://walmart.com/hp-spectre-x360');

-- Insert Prices for Sony WH-1000XM5
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (21, 7, 1, 349.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/sony-wh1000xm5');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (22, 7, 2, 399.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/sony-wh1000xm5');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (23, 7, 3, 369.99, 'USD', true, CURRENT_TIMESTAMP, 'https://walmart.com/sony-wh1000xm5');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (24, 7, 5, 329.99, 'USD', true, CURRENT_TIMESTAMP, 'https://costco.com/sony-wh1000xm5');

-- Insert Prices for AirPods Pro 2
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (25, 8, 1, 249.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/airpods-pro-2');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (26, 8, 2, 249.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/airpods-pro-2');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (27, 8, 4, 249.00, 'USD', true, CURRENT_TIMESTAMP, 'https://apple.com/airpods-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (28, 8, 5, 229.99, 'USD', true, CURRENT_TIMESTAMP, 'https://costco.com/airpods-pro-2');

-- Insert Prices for Bose QuietComfort 45
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (29, 9, 1, 279.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/bose-qc45');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (30, 9, 2, 329.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/bose-qc45');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (31, 9, 3, 299.99, 'USD', true, CURRENT_TIMESTAMP, 'https://walmart.com/bose-qc45');

-- Insert Prices for iPad Pro 12.9
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (32, 10, 1, 1099.99, 'USD', true, CURRENT_TIMESTAMP, 'https://amazon.com/ipad-pro-129');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (33, 10, 2, 1149.99, 'USD', true, CURRENT_TIMESTAMP, 'https://bestbuy.com/ipad-pro-129');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (34, 10, 4, 1099.00, 'USD', true, CURRENT_TIMESTAMP, 'https://apple.com/ipad-pro');
INSERT INTO prices (id, product_id, brand_id, price, currency, instock, lastUpdated, url) VALUES (35, 10, 5, 1049.99, 'USD', true, CURRENT_TIMESTAMP, 'https://costco.com/ipad-pro-129');
