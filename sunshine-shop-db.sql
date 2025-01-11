CREATE DATABASE SUNSHINE_SHOP_DB;
USE SUNSHINE_SHOP_DB;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    role ENUM('admin', 'user') DEFAULT 'user',
    status ENUM('active', 'pending', 'inactive') DEFAULT 'active',
    email VARCHAR(100) NOT NULL UNIQUE,
    fullname VARCHAR(100) NOT NULL,
    token VARCHAR(255),
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE suppliers (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    phone VARCHAR(15) NOT NULL,
    address VARCHAR(255) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description TEXT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    quantity INT NOT NULL,
    image VARCHAR(255) NOT NULL,
    description TEXT NOT NULL,
    supplier_id INT NOT NULL,
    category_id INT NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (supplier_id) REFERENCES suppliers(id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    total DECIMAL(10, 2) NOT NULL,
    status VARCHAR(50) NOT NULL,     
    address VARCHAR(255) NOT NULL,                        -- Địa chỉ nhận hàng
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,      -- Ngày đặt hàng
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP, -- Ngày cập nhật
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE order_items (
    order_id INT NOT NULL,
    product_id INT NOT NULL,
    PRIMARY KEY (order_id, product_id),
    quantity INT NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

USE SUNSHINE_SHOP_DB;

INSERT INTO users (username, password, role, status, email, fullname, phone, address) VALUES
('user1', 'password1', 'user', 'active', 'user1@example.com', 'User One', '1234567890', 'Address 1'),
('user2', 'password2', 'user', 'active', 'user2@example.com', 'User Two', '1234567891', 'Address 2'),
('user3', 'password3', 'user', 'active', 'user3@example.com', 'User Three', '1234567892', 'Address 3'),
('user4', 'password4', 'user', 'active', 'user4@example.com', 'User Four', '1234567893', 'Address 4'),
('user5', 'password5', 'user', 'active', 'user5@example.com', 'User Five', '1234567894', 'Address 5'),
('user6', 'password6', 'user', 'active', 'user6@example.com', 'User Six', '1234567895', 'Address 6'),
('user7', 'password7', 'user', 'active', 'user7@example.com', 'User Seven', '1234567896', 'Address 7'),
('user8', 'password8', 'user', 'active', 'user8@example.com', 'User Eight', '1234567897', 'Address 8'),
('user9', 'password9', 'user', 'active', 'user9@example.com', 'User Nine', '1234567898', 'Address 9'),
('user10', 'password10', 'user', 'active', 'user10@example.com', 'User Ten', '1234567899', 'Address 10'),
('user11', 'password11', 'user', 'active', 'user11@example.com', 'User Eleven', '1234567800', 'Address 11'),
('user12', 'password12', 'user', 'active', 'user12@example.com', 'User Twelve', '1234567801', 'Address 12'),
('user13', 'password13', 'user', 'active', 'user13@example.com', 'User Thirteen', '1234567802', 'Address 13'),
('user14', 'password14', 'user', 'active', 'user14@example.com', 'User Fourteen', '1234567803', 'Address 14'),
('user15', 'password15', 'user', 'active', 'user15@example.com', 'User Fifteen', '1234567804', 'Address 15'),
('user16', 'password16', 'user', 'active', 'user16@example.com', 'User Sixteen', '1234567805', 'Address 16'),
('user17', 'password17', 'user', 'active', 'user17@example.com', 'User Seventeen', '1234567806', 'Address 17'),
('user18', 'password18', 'user', 'active', 'user18@example.com', 'User Eighteen', '1234567807', 'Address 18'),
('user19', 'password19', 'user', 'active', 'user19@example.com', 'User Nineteen', '1234567808', 'Address 19'),
('user20', 'password20', 'user', 'active', 'user20@example.com', 'User Twenty', '1234567809', 'Address 20'),
('user21', 'password21', 'user', 'active', 'user21@example.com', 'User Twenty-One', '1234567810', 'Address 21'),
('user22', 'password22', 'user', 'active', 'user22@example.com', 'User Twenty-Two', '1234567811', 'Address 22'),
('user23', 'password23', 'user', 'active', 'user23@example.com', 'User Twenty-Three', '1234567812', 'Address 23'),
('user24', 'password24', 'user', 'active', 'user24@example.com', 'User Twenty-Four', '1234567813', 'Address 24'),
('user25', 'password25', 'user', 'active', 'user25@example.com', 'User Twenty-Five', '1234567814', 'Address 25'),
('user26', 'password26', 'user', 'active', 'user26@example.com', 'User Twenty-Six', '1234567815', 'Address 26'),
('user27', 'password27', 'user', 'active', 'user27@example.com', 'User Twenty-Seven', '1234567816', 'Address 27'),
('user28', 'password28', 'user', 'active', 'user28@example.com', 'User Twenty-Eight', '1234567817', 'Address 28'),
('user29', 'password29', 'user', 'active', 'user29@example.com', 'User Twenty-Nine', '1234567818', 'Address 29'),
('user30', 'password30', 'user', 'active', 'user30@example.com', 'User Thirty', '1234567819', 'Address 30');


INSERT INTO categories (name, description) VALUES
('Electronics', 'Devices and gadgets'),
('Books', 'Various kinds of books'),
('Clothing', 'Men and women clothing'),
('Home Appliances', 'Appliances for home use'),
('Sports', 'Sports equipment and accessories'),
('Toys', 'Toys for children of all ages'),
('Beauty', 'Beauty and personal care products'),
('Automotive', 'Automotive parts and accessories'),
('Furniture', 'Home and office furniture'),
('Garden', 'Garden tools and accessories'),
('Health', 'Health and wellness products'),
('Jewelry', 'Jewelry and accessories'),
('Music', 'Musical instruments and accessories'),
('Office Supplies', 'Office supplies and equipment'),
('Pet Supplies', 'Supplies for pets'),
('Shoes', 'Footwear for all ages'),
('Software', 'Software and applications'),
('Tools', 'Tools and hardware'),
('Video Games', 'Video games and consoles'),
('Watches', 'Watches and accessories'),
('Groceries', 'Daily groceries and food items'),
('Baby Products', 'Products for babies and toddlers'),
('Crafts', 'Craft supplies and materials'),
('Electronics Accessories', 'Accessories for electronic devices'),
('Fitness', 'Fitness equipment and accessories'),
('Gourmet Food', 'Gourmet food and beverages'),
('Handmade', 'Handmade products and crafts'),
('Industrial', 'Industrial equipment and supplies'),
('Luggage', 'Luggage and travel accessories'),
('Movies', 'Movies and TV shows');

INSERT INTO suppliers (name, phone, address) VALUES
('Tech Solutions Inc.', '0123456789', '123 Tech Street, Silicon Valley'),
('Global Electronics', '0234567890', '456 Global Avenue, New York'),
('Smart Devices Co.', '0345678901', '789 Smart Road, Tokyo'),
('Digital Systems Ltd.', '0456789012', '321 Digital Lane, London'),
('Future Tech Corp.', '0567890123', '654 Future Boulevard, Seoul'),
('Innovation Hub', '0678901234', '987 Innovation Way, Berlin'),
('Quality Electronics', '0789012345', '147 Quality Street, Paris'),
('Prime Components', '0890123456', '258 Prime Road, Toronto'),
('Advanced Systems', '0901234567', '369 Advanced Avenue, Sydney'),
('Elite Technologies', '0012345678', '741 Elite Street, Singapore'),
('Modern Solutions', '1234567890', '852 Modern Lane, Mumbai'),
('Best Electronics', '2345678901', '963 Best Road, Dubai'),
('Pro Systems', '3456789012', '159 Pro Avenue, Moscow'),
('Expert Components', '4567890123', '357 Expert Street, Madrid'),
('Top Tech Ltd.', '5678901234', '246 Top Boulevard, Amsterdam'),
('Smart Solutions', '6789012345', '135 Smart Lane, Stockholm'),
('Global Systems', '7890123456', '468 Global Road, Oslo'),
('Prime Tech', '8901234567', '791 Prime Street, Copenhagen'),
('Advanced Components', '9012345678', '024 Advanced Avenue, Helsinki'),
('Elite Systems', '0123456780', '357 Elite Road, Vienna'),
('Digital Solutions', '1234567891', '680 Digital Street, Brussels'),
('Future Components', '2345678902', '913 Future Avenue, Lisbon'),
('Quality Systems', '3456789013', '246 Quality Boulevard, Athens'),
('Innovation Tech', '4567890124', '579 Innovation Road, Warsaw'),
('Modern Components', '5678901235', '802 Modern Street, Prague'),
('Best Systems', '6789012346', '135 Best Avenue, Budapest'),
('Pro Components', '7890123457', '468 Pro Boulevard, Dublin'),
('Expert Tech', '8901234568', '791 Expert Lane, Edinburgh'),
('Top Solutions', '9012345679', '024 Top Road, Mexico City'),
('Smart Components', '0123456781', '357 Smart Street, Vancouver');

INSERT INTO products (name, price, quantity, image, description, supplier_id, category_id) VALUES
# ('iPhone 14 Pro', 999.99, 50, 'iphone14pro.jpg', 'Latest Apple flagship smartphone with A16 Bionic chip', 1, 1),
# ('Samsung Galaxy S23', 899.99, 45, 'galaxys23.jpg', 'Premium Android smartphone with Snapdragon 8 Gen 2', 2, 1),
# ('MacBook Pro M2', 1499.99, 30, 'macbookm2.jpg', '14-inch MacBook Pro with M2 chip', 1, 1),
# ('Dell XPS 15', 1299.99, 25, 'dellxps15.jpg', 'Premium Windows laptop with Intel i7', 3, 1),
# ('iPad Air', 599.99, 60, 'ipadair.jpg', '10.9-inch iPad Air with M1 chip', 1, 1),
# ('Sony WH-1000XM4', 349.99, 40, 'sony1000xm4.jpg', 'Wireless noise-cancelling headphones', 4, 1),
# ('Nike Air Max', 129.99, 100, 'nikeairmax.jpg', 'Classic running shoes', 5, 3),
# ('Adidas Ultraboost', 159.99, 80, 'ultraboost.jpg', 'Premium running shoes with Boost technology', 5, 3),
# ('The Art of Programming', 49.99, 150, 'artprogramming.jpg', 'Comprehensive programming guide', 6, 2),
# ('Clean Code', 39.99, 120, 'cleancode.jpg', 'Guide to writing maintainable code', 6, 2),
# ('Samsung 4K TV', 799.99, 20, 'samsung4k.jpg', '55-inch 4K Smart TV', 2, 1),
# ('LG OLED TV', 1299.99, 15, 'lgoled.jpg', '65-inch OLED 4K Smart TV', 7, 1),
# ('Canon EOS R6', 2499.99, 10, 'canonr6.jpg', 'Full-frame mirrorless camera', 8, 1),
# ('Sony A7 IV', 2699.99, 12, 'sonya7iv.jpg', 'Professional mirrorless camera', 4, 1),
# ('Microsoft Xbox Series X', 499.99, 30, 'xboxseriesx.jpg', 'Next-gen gaming console', 9, 1),
# ('PS5', 499.99, 25, 'ps5.jpg', 'Sony PlayStation 5 console', 4, 1),
# ('Nintendo Switch OLED', 349.99, 40, 'switcholed.jpg', 'Portable gaming console', 10, 1),
# ('Levi 501 Jeans', 69.99, 200, 'levis501.jpg', 'Classic straight fit jeans', 11, 3),
# ('Nike Dri-FIT Shirt', 29.99, 150, 'nikedrifit.jpg', 'Athletic performance shirt', 5, 3),
# ('Under Armour Hoodie', 59.99, 100, 'uahoodie.jpg', 'Fleece training hoodie', 12, 3),
# ('Apple Watch Series 8', 399.99, 50, 'watchs8.jpg', 'Latest Apple smartwatch', 1, 1),
# ('Samsung Galaxy Watch 5', 279.99, 45, 'galaxywatch5.jpg', 'Advanced Android smartwatch', 2, 1),
# ('Kindle Paperwhite', 139.99, 70, 'kindle.jpg', 'E-reader with backlight', 13, 1),
# ('Google Pixel 7', 599.99, 40, 'pixel7.jpg', 'Google flagship smartphone', 14, 1),
# ('Microsoft Surface Laptop', 999.99, 25, 'surfacelaptop.jpg', 'Premium Windows laptop', 9, 1),
# ('Bose QuietComfort', 299.99, 35, 'boseqc.jpg', 'Noise-cancelling headphones', 15, 1),
# ('Amazon Echo Dot', 49.99, 100, 'echodot.jpg', 'Smart speaker with Alexa', 13, 1),
# ('Fitbit Versa 4', 229.99, 60, 'fitbitversa.jpg', 'Advanced fitness tracker', 16, 1),
# ('GoPro Hero 11', 399.99, 30, 'goprohero11.jpg', 'Action camera', 17, 1),
# ('DJI Mini 3 Pro', 759.99, 20, 'djimini3.jpg', 'Compact drone with 4K camera', 18, 1),
# ('Mechanical Keyboard', 149.99, 50, 'mechkeyboard.jpg', 'RGB mechanical gaming keyboard', 19, 1),
# ('Gaming Mouse', 79.99, 75, 'gamingmouse.jpg', 'High-DPI gaming mouse', 19, 1),
# ('27" Gaming Monitor', 299.99, 30, 'gamingmonitor.jpg', '144Hz gaming monitor', 20, 1),
# ('External SSD 1TB', 149.99, 80, 'ssd1tb.jpg', 'Portable SSD drive', 21, 1),
# ('Wireless Router', 199.99, 40, 'router.jpg', 'WiFi 6 mesh router', 22, 1),
# ('Smart Doorbell', 179.99, 45, 'doorbell.jpg', 'Video doorbell with camera', 23, 1),
# ('Security Camera', 129.99, 60, 'security.jpg', 'Indoor security camera', 23, 1),
# ('Robot Vacuum', 299.99, 25, 'vacuum.jpg', 'Smart robot vacuum cleaner', 24, 1),
# ('Coffee Maker', 199.99, 40, 'coffee.jpg', 'Smart coffee maker', 25, 1),
# ('Air Purifier', 249.99, 30, 'airpurifier.jpg', 'HEPA air purifier', 26, 1),
# ('Smart Light Bulbs', 29.99, 150, 'smartbulb.jpg', 'WiFi-enabled smart bulbs', 27, 1),
# ('Portable Charger', 49.99, 100, 'powerbank.jpg', '20000mAh power bank', 28, 1),
# ('USB-C Hub', 69.99, 80, 'usbhub.jpg', 'Multi-port USB-C hub', 29, 1),
# ('Wireless Earbuds', 159.99, 70, 'earbuds.jpg', 'True wireless earbuds', 30, 1),
# ('Gaming Chair', 249.99, 25, 'gamingchair.jpg', 'Ergonomic gaming chair', 19, 1),
# ('Desk Lamp', 39.99, 90, 'desklamp.jpg', 'LED desk lamp with wireless charging', 27, 1),
# ('Webcam', 89.99, 55, 'webcam.jpg', '1080p webcam with microphone', 21, 1),
# ('Graphic Tablet', 299.99, 35, 'tablet.jpg', 'Digital drawing tablet', 18, 1),
# ('Smart Scale', 59.99, 65, 'scale.jpg', 'WiFi-enabled smart scale', 16, 1),
# ('Bluetooth Speaker', 129.99, 50, 'speaker.jpg', 'Portable waterproof speaker', 15, 1),
# ('Smart Thermostat', 199.99, 30, 'thermostat.jpg', 'WiFi-enabled smart thermostat', 23, 1);

INSERT INTO products
(name, price, quantity, image, description, supplier_id, category_id)
VALUES
-- 1
('Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
 109.95,
 120,
 'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
 'Your perfect pack for everyday use and walks in the forest.',
 1,
 1
),

-- 2
('Mens Casual Premium Slim Fit T-Shirts',
 22.30,
 259,
 'https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879_.jpg',
 'Slim-fitting style, contrast raglan long sleeve, three-button henley placket...',
 1,
 1
),

-- 3
('Mens Cotton Jacket',
 55.99,
 500,
 'https://fakestoreapi.com/img/71li-ujtlUL._AC_UX679_.jpg',
 'Great outerwear jackets for Spring/Autumn, suitable for many occasions...',
 1,
 1
),

-- 4
('Mens Casual Slim Fit',
 15.99,
 430,
 'https://fakestoreapi.com/img/71YXzeOuslL._AC_UY879_.jpg',
 'The color could be slightly different from the picture due to light reflection...',
 1,
 1
),

-- 5
('John Hardy Women''s Legends Naga Gold & Silver Dragon Station Chain Bracelet',
 695.00,
 400,
 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_ML3_.jpg',
 'From our Legends Collection, the Naga was inspired by the mythical water dragon...',
 1,
 2
),

-- 6
('Solid Gold Petite Micropave',
 168.00,
 70,
 'https://fakestoreapi.com/img/61sbMiUnoGL._AC_UL640_QL65_.jpg',
 'Satisfaction Guaranteed. Return or exchange any order within 30 days...',
 1,
 2
),

-- 7
('White Gold Plated Princess',
 9.99,
 400,
 'https://fakestoreapi.com/img/71YAIFU48IL._AC_UL640_QL65_.jpg',
 'Classic Created Wedding Engagement Solitaire Diamond Promise Ring...',
 1,
 2
),

-- 8
('Pierced Owl Rose Gold Plated Stainless Steel Double',
 10.99,
 100,
 'https://fakestoreapi.com/img/51UDEzMJVpL._AC_UL640_QL65_.jpg',
 'Rose Gold Plated Double Flared Tunnel Plug Earrings...',
 1,
 2
),

-- 9
('WD 2TB Elements Portable External Hard Drive - USB 3.0',
 64.00,
 203,
 'https://fakestoreapi.com/img/61IBBVJvSDL._AC_SY879_.jpg',
 'USB 3.0 and USB 2.0 Compatibility, Fast data transfers, Improve PC Performance...',
 1,
 3
),

-- 10
('SanDisk SSD PLUS 1TB Internal SSD - SATA III 6 Gb/s',
 109.00,
 470,
 'https://fakestoreapi.com/img/61U7T1koQqL._AC_SX679_.jpg',
 'Easy upgrade for faster boot-up, shutdown, application load and response...',
 1,
 3
),

-- 11
('Silicon Power 256GB SSD 3D NAND A55 SLC Cache Performance Boost',
 109.00,
 319,
 'https://fakestoreapi.com/img/71fPDxh4CAL._AC_SY879_.jpg',
 '3D NAND flash are applied to deliver high transfer speeds...',
 1,
 3
),

-- 12
('WD 4TB Gaming Drive Works with Playstation 4 Portable External Hard Drive',
 114.00,
 400,
 'https://fakestoreapi.com/img/61mtL65D4cL._AC_SX679_.jpg',
 'Expand your PS4 gaming experience, easy to use device...',
 1,
 3
),

-- 13
('Acer SB220Q bi 21.5 inches Full HD (1920 x 1080) IPS Ultra-Thin',
 599.00,
 250,
 'https://fakestoreapi.com/img/81QpkIctqPL._AC_SX679_.jpg',
 '21.5 inches Full HD IPS Ultra-Thin, 75Hz refresh rate, 4ms response time...',
 1,
 3
),

-- 14
('Samsung 49-Inch CHG90 144Hz Curved Gaming Monitor',
 999.99,
 140,
 'https://fakestoreapi.com/img/81Zt42ioCgL._AC_SX679_.jpg',
 '49 INCH SUPER ULTRAWIDE 32:9 CURVED Gaming Monitor, QLED technology...',
 1,
 3
),

-- 15
('BIYLACLESEN Women''s 3-in-1 Snowboard Jacket Winter Coats',
 56.99,
 235,
 'https://fakestoreapi.com/img/51Y5NI-I5jL._AC_UX679_.jpg',
 'Note: The Jackets is US standard size, please choose size accordingly...',
 1,
 4
),

-- 16
('Lock and Love Women''s Removable Hooded Faux Leather Moto Biker Jacket',
 29.95,
 52,
 'https://fakestoreapi.com/img/81XH0e8fefL._AC_UY879_.jpg',
 '100% POLYURETHANE (Faux Leather), High quality hardware, removable hood...',
 1,
 4
),

-- 17
('Rain Jacket Women Windbreaker Striped Climbing Raincoats',
 39.99,
 39,
 'https://fakestoreapi.com/img/71HblAHs5xL._AC_UY879_-2.jpg',
 'Lightweight perfet for trip or casual wear. Long sleeve with hooded...',
 1,
 4
),

-- 18
('MBJ Women''s Solid Short Sleeve Boat Neck V ',
 9.85,
 133,
 'https://fakestoreapi.com/img/71z3kpMAYsL._AC_UY879_.jpg',
 '95% RAYON 5% SPANDEX, Made in USA or Imported, Do Not Bleach...',
 1,
 4
),

-- 19
('Opna Women''s Short Sleeve Moisture',
 7.95,
 146,
 'https://fakestoreapi.com/img/51eg55uWmdL._AC_UX679_.jpg',
 '100% Polyester, Machine wash, Lightweight, Classic fit, Double-needle sleeve and bottom hem...',
 1,
 4
),

-- 20
('DANVOUY Womens T Shirt Casual Cotton Short',
 12.99,
 145,
 'https://fakestoreapi.com/img/61pHAEJ4NML._AC_UX679_.jpg',
 '95%Cotton,5%Spandex, Features: Short Sleeve, V-Neckline, Soft and Stretchy...',
 1,
 4
);
