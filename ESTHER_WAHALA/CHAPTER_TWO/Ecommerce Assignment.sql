CREATE DATABASE ecommerce_db;

CREATE TABLE Users (
    user_id INT AUTO_INCREMENT,
    name VARCHAR(50),
    email VARCHAR(100),
    password VARCHAR(50),
    
    PRIMARY KEY (user_id)
);


CREATE TABLE Products (
    product_id INT AUTO_INCREMENT,
    title VARCHAR(100),
    price DECIMAL(10, 2),
    stock INT,
    
    PRIMARY KEY (product_id)
);


CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT,
    user_id INT,
    total_amount DECIMAL(10, 2),
    
    PRIMARY KEY (order_id),
    FOREIGN KEY (user_id) REFERENCES Users(user_id)
);


CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    quantity INT,
    
    PRIMARY KEY (order_item_id),
    FOREIGN KEY (order_id) REFERENCES Orders(order_id),
    FOREIGN KEY (product_id) REFERENCES Products(product_id)
);
