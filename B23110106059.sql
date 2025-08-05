
-- 1. Create a database named library_db
CREATE DATABASE library_db;


-- 2. Create a table of books
CREATE TABLE books (
    book_id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    author VARCHAR(255),
    year_published INT,
    isAvailable BOOLEAN,
    price DECIMAL(10, 2),
    publication VARCHAR(255)
);

-- 3. Insert 15 sample books (with Pakistani names and publishers)
INSERT INTO books (title, author, year_published, isAvailable, price, publication) VALUES
('Jang e Azadi', 'Ahmed Raza', 2005, TRUE, 499.00, 'Oxford Karachi'),
('Zehni Khauf', 'Saima Jamil', 2018, TRUE, 749.00, 'Ferozsons Lahore'),
('Data Science ka Safar', 'Ali Shahbaz', 2021, TRUE, 899.50, 'Ilm-o-Adab Islamabad'),
('History of Sindh', 'Nimra Tariq', 1999, TRUE, 230.00, 'Sindh Publishers Hyderabad'),
('Python Seekhiye', 'Talha Mehmood', 2023, TRUE, 620.00, 'Pak Publishers Karachi'),
('Islami Tareekh', 'Zubair Qureshi', 2012, TRUE, 299.00, 'Jamia Press Multan'),
('AI aur Mustaqbil', 'Rabia Khalid', 2020, FALSE, 850.00, 'FutureTech Lahore'),
('Qadeem Riwayat', 'Faraz Ahmed', 1985, TRUE, 180.00, 'Nigarshat Peshawar'),
('Cyber Duniya', 'Sana Haroon', 2022, TRUE, 720.00, 'SecureBooks Islamabad'),
('Adabi Tajaweez', 'Awais Javed', 2003, TRUE, 340.00, 'UrduMarkaz Karachi'),
('Tanqeedi Nazar', 'Hassan Imran', 2016, TRUE, 399.00, 'Ferozsons Lahore'),
('Science aur Maashra', 'Bushra Iqbal', 2011, TRUE, 579.00, 'Ilm Ghar Faisalabad'),
('Blockchain Samajhiye', 'Zainab Noor', 2023, TRUE, 999.00, 'Digital Press Lahore'),
('Mausam aur Zindagi', 'Abdul Hadi', 2009, TRUE, 460.00, 'Nature Books Quetta'),
('Programming in Urdu', 'Yasir Nadeem', 2015, TRUE, 580.00, 'CodeHouse Karachi');

-- 4. Select all books published after 2000
SELECT * FROM books
WHERE year_published > 2000;

-- 5. Select books with a price less than 599.00, ordered by price descending
SELECT * FROM books
WHERE price < 599.00
ORDER BY price DESC;

-- 6. Select the top 3 most expensive books
SELECT * FROM books
ORDER BY price DESC
LIMIT 3;

-- 7. Select 2 books, skipping the first 2, ordered by publication year descending
SELECT * FROM books
ORDER BY year_published DESC
OFFSET 2
LIMIT 2;

-- 8. Select all books of the publication “Ferozsons Lahore” ordered alphabetically by title
SELECT * FROM books
WHERE publication = 'Ferozsons Lahore'
ORDER BY title ASC;


