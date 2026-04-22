CREATE DATABASE IF NOT EXISTS testdb;
USE testdb;

CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50),
    password VARCHAR(50)
);

INSERT INTO users (username, password) VALUES
('admin', 'admin123'),
('john', 'john123'),
('alice', 'alice123');

CREATE TABLE books (
    id INT AUTO_INCREMENT PRIMARY KEY,
    title VARCHAR(100),
	author VARCHAR(100),
    publisher VARCHAR(100)
);

INSERT INTO books (title, publisher) VALUES
('Java Basics', 'ABC', 'Pearson'),
('Cyber Security', 'XYZ', 'OReilly'),
('Networks', 'PQR', 'McGrawHill');