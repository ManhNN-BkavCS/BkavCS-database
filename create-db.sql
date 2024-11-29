DROP DATABASE IF EXISTS `Bkav_CS`;
CREATE DATABASE IF NOT EXISTS `Bkav_CS`;
USE `Bkav_CS`;

-- --------------------------------------------------------

CREATE TABLE IF NOT EXISTS `users` (
    `id` VARCHAR(50),
    `full_name` VARCHAR(255) NOT NULL,
    `username` VARCHAR(255) NOT NULL,
    `email` VARCHAR(255) NOT NULL,
    `password` VARCHAR(255) NOT NULL,
    `role` VARCHAR(255) NOT NULL DEFAULT 'admin',
    `session_quantity` INT DEFAULT 3,
    `login_time` INT DEFAULT 24,
    `is_active` BOOLEAN DEFAULT TRUE,
    PRIMARY KEY (`id`),
    UNIQUE KEY `username` (`username`),
    UNIQUE KEY `email` (`email`)
);

CREATE TABLE IF NOT EXISTS `categories` (
    `id` VARCHAR(50),
    `category_name` VARCHAR(255) NOT NULL,
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`)
);

CREATE TABLE IF NOT EXISTS `products` (
    `id` VARCHAR(50),
    `id_category` VARCHAR(50) NOT NULL,
    `product_name` VARCHAR(255) NOT NULL,
    `preview` TEXT,
    `logo` VARCHAR(255),
    `image` VARCHAR(255),
    `link_demo` VARCHAR(255),
    `file_download` VARCHAR(255),
    `content` TEXT,
    `view` INT DEFAULT 0,
    `status` VARCHAR(255),
    `created_at` DATETIME,
    `updated_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_category`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `services` (
    `id` VARCHAR(50),
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
    `id` VARCHAR(50),
    `id_user` VARCHAR(50) NOT NULL,
    `user` VARCHAR(255),
    `ip_address` VARCHAR(255),
    `action` VARCHAR(255),
    `content` TEXT,
    `status` ENUM('success', 'failed') NOT NULL,
    `reason` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`id_user`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `user_logs` (
    `id` VARCHAR(50),
    `admin_id` VARCHAR(50) NOT NULL,
    `user_id` VARCHAR(50) NOT NULL,
    `ip_address` VARCHAR(255),
    `action` VARCHAR(255),
    `content` TEXT,
    `status` ENUM('success', 'failed') NOT NULL,
    `reason` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`admin_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `category_logs` (
    `id` VARCHAR(50),
    `user_id` VARCHAR(50) NOT NULL,
    `id_category` VARCHAR(50) NOT NULL,
    `ip_address` VARCHAR(255),
    `action` VARCHAR(255),
    `content` TEXT,
    `status` ENUM('success', 'failed') NOT NULL,
    `reason` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_category`) REFERENCES `categories`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `product_logs` (
    `id` VARCHAR(50),
    `user_id` VARCHAR(50) NOT NULL,
    `id_product` VARCHAR(50) NOT NULL,
    `ip_address` VARCHAR(255),
    `action` VARCHAR(255),
    `content` TEXT,
    `status` ENUM('success', 'failed') NOT NULL,
    `reason` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_product`) REFERENCES `products`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `services_logs` (
    `id` VARCHAR(50),
    `user_id` VARCHAR(50) NOT NULL,
    `id_service` VARCHAR(50) NOT NULL,
    `ip_address` VARCHAR(255),
    `action` VARCHAR(255),
    `content` TEXT,
    `status` ENUM('success', 'failed') NOT NULL,
    `reason` TEXT,
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE,
    FOREIGN KEY (`id_service`) REFERENCES `services`(`id`) ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS `session` (
    `id` VARCHAR(50),
    `user_id` VARCHAR(50) NOT NULL,
    `ip_address` VARCHAR(255),
    `refresh_token` VARCHAR(255),
    `created_at` DATETIME,
    PRIMARY KEY (`id`),
    FOREIGN KEY (`user_id`) REFERENCES `users`(`id`) ON DELETE CASCADE
);
