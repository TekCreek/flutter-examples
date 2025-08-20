CREATE DATABASE demodb;

USE demodb;

CREATE TABLE users (
    userId INT PRIMARY KEY AUTO_INCREMENT,
    username VARCHAR(100) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    firstname VARCHAR(100) NOT NULL,
    lastname VARCHAR(100) NOT NULL
);

CREATE TABLE posts (
    postId INT PRIMARY KEY AUTO_INCREMENT,
    title VARCHAR(255) NOT NULL,
    description TEXT,
    userId INT NOT NULL,
    FOREIGN KEY (userId) REFERENCES users(userId) ON DELETE CASCADE
);

INSERT INTO demodb.users
(userId, username, password, firstname, lastname)
VALUES(1, 'testuser', '$2b$10$fSBCDwg3bLqtCt.Zq6p01uhgKlbqtk1/wKunONIWkt5A9TEyux5kK', 'Test', 'User');
