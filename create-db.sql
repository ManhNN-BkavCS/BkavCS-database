CREATE DATABASE IF NOT EXISTS `Bkav_CS`;
USE `Bkav_CS`;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `full_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` ENUM('admin', 'super_admin') NOT NULL DEFAULT 'admin',
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
);

CREATE TABLE IF NOT EXISTS `categories` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `name` VARCHAR(255) NOT NULL,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    
)