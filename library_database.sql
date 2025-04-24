-- Library Database Management System

-- Create Authors Table
CREATE TABLE authors (
    author_id INT AUTO_INCREMENT PRIMARY KEY,
    author_name VARCHAR(100) NOT NULL,
    birthdate DATE,
    nationality VARCHAR(50)
);

-- Insert Sample Data into Authors table
INSERT INTO authors (author_name, birthdate, nationality) VALUES
('J.K. Rowling', '1965-07-31', 'British'),
('George Orwell', '1903-06-25', 'British'),
('J.R.R. Tolkien', '1892-01-03', 'British'),
('Isaac Asimov', '1920-01-02', 'American'),
('Agatha Christie', '1890-09-15', 'British'),
('Stephen King', '1947-09-21', 'American'),
('Jane Austen', '1775-12-16', 'British'),
('Mark Twain', '1835-11-30', 'American'),
('F. Scott Fitzgerald', '1896-09-24', 'American'),
('Harper Lee', '1926-04-28', 'American');

-- Create Categories Table
CREATE TABLE categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

-- Insert Sample Data into Categories
INSERT INTO categories (category_name) VALUES
('Fantasy'),
('Science Fiction'),
('Mystery'),
('Thriller'),
('Classics'),
('Historical Fiction'),
('Biography'),
('Adventure'),
('Horror'),
('Non-Fiction');

-- Create Books Table
CREATE TABLE books (
    book_id INT AUTO_INCREMENT PRIMARY KEY,
    book_title VARCHAR(200) NOT NULL,
    author_id INT NOT NULL,
    category_id INT NOT NULL,
    publication_year INT,
    isbn VARCHAR(20) UNIQUE,
    FOREIGN KEY (author_id) REFERENCES authors(author_id),
    FOREIGN KEY (category_id) REFERENCES categories(category_id)
);

-- Insert Sample Data into Books
INSERT INTO books (book_title, author_id, category_id, publication_year, isbn) VALUES
("Harry Potter and the Philosopher's Stone", 1, 1, 1997, '9780747532743'),
('1984', 2, 2, 1949, '9780451524935'),
('The Hobbit', 3, 1, 1937, '9780618260300'),
('Foundation', 4, 2, 1951, '9780553382570'),
('Murder on the Orient Express', 5, 3, 1934, '9780062693662'),
('The Shining', 6, 4, 1977, '9780307743657'),
('Pride and Prejudice', 7, 5, 1813, '9781503290563'),
('Adventures of Huckleberry Finn', 8, 8, 1884, '9780486280615'),
('The Great Gatsby', 9, 5, 1925, '9780743273565'),
('To Kill a Mockingbird', 10, 5, 1960, '9780061120084');

-- Create Patrons Table
CREATE TABLE patrons (
    patron_id INT AUTO_INCREMENT PRIMARY KEY,
    patron_name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE,
    phone VARCHAR(20),
    address VARCHAR(200)
);

-- Insert Sample Data into Patrons
INSERT INTO patrons (patron_name, email, phone, address) VALUES
('John Doe', 'johndoe@example.com', '555-1234', '123 Main St, Springfield'),
('Jane Smith', 'janesmith@example.com', '555-5678', '456 Oak St, Springfield'),
('Emily Clark', 'emilyclark@example.com', '555-8765', '789 Pine St, Springfield'),
('Michael Johnson', 'michaelj@example.com', '555-1122', '101 Maple St, Springfield'),
('Sophia Lee', 'sophialee@example.com', '555-3344', '202 Birch St, Springfield'),
('James Brown', 'jamesbrown@example.com', '555-5566', '303 Cedar St, Springfield'),
('Olivia Davis', 'oliviadavis@example.com', '555-7788', '404 Elm St, Springfield'),
('David Wilson', 'davidwilson@example.com', '555-9900', '505 Willow St, Springfield'),
('Emma Martinez', 'emmamartinez@example.com', '555-2233', '606 Redwood St, Springfield'),
('Daniel Lee', 'daniellee@example.com', '555-4455', '707 Cherry St, Springfield');

-- Create BorrowingRecords Table
CREATE TABLE borrowingrecords (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    patron_id INT NOT NULL,
    book_id INT NOT NULL,
    borrow_date DATE NOT NULL,
    return_date DATE,
    FOREIGN KEY (patron_id) REFERENCES patrons(patron_id),
    FOREIGN KEY (book_id) REFERENCES books(book_id)
);

-- Insert Sample Data into BorrowingRecords
INSERT INTO borrowingrecords (patron_id, book_id, borrow_date, return_date) VALUES
(1, 1, '2023-05-01', '2023-05-15'),
(2, 2, '2023-05-03', '2023-05-17'),
(3, 3, '2023-05-05', '2023-05-19'),
(4, 4, '2023-05-07', '2023-05-21'),
(5, 5, '2023-05-09', '2023-05-23'),
(6, 6, '2023-05-11', '2023-05-25'),
(7, 7, '2023-05-13', '2023-05-27'),
(8, 8, '2023-05-15', '2023-05-29'),
(9, 9, '2023-05-17', '2023-05-31'),
(10, 10, '2023-05-19', '2023-06-02'),
(1, 2, '2023-06-01', '2023-06-15'),
(2, 3, '2023-06-03', '2023-06-17'),
(3, 4, '2023-06-05', '2023-06-19'),
(4, 5, '2023-06-07', '2023-06-21'),
(5, 6, '2023-06-09', '2023-06-23'),
(6, 7, '2023-06-11', '2023-06-25'),
(7, 8, '2023-06-13', '2023-06-27'),
(8, 9, '2023-06-15', '2023-06-29'),
(9, 10, '2023-06-17', '2023-07-01'),
(10, 1, '2023-06-19', '2023-07-03');

