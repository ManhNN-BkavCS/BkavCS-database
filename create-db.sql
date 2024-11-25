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
    `login_time` DATETIME,
    `refresh_token` VARCHAR(255),
    `is_active` BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
);

CREATE TABLE IF NOT EXISTS `categories` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `category_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `products` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_category` INT NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `preview` TEXT,
    `logo` VARCHAR(255),
    `image` VARCHAR(255),
    `link_demo` VARCHAR(255),
    `file_download` VARCHAR(255),
    `content` TEXT,
    `view` INT DEFAULT 0,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_category`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `services` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `service_name` VARCHAR(255) NOT NULL,
    `preview` TEXT,
    `content` TEXT,
    `image` VARCHAR(255),
    `view` INT DEFAULT 0,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `login_logs` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `id_user` INT NOT NULL,
    `content` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `category_logs` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `id_category` INT NOT NULL,
    `content` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_category`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `product_logs` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `id_product` INT NOT NULL,
    `content` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_product`) REFERENCES `products`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `services_logs` (
    `id` INT NOT NULL AUTO_INCREMENT,
    `user_id` INT NOT NULL,
    `id_service` INT NOT NULL,
    `content` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_service`) REFERENCES `services`(`id`) ON DELETE CASCADE
);
