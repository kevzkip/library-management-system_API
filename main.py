from fastapi import FastAPI, HTTPException
import mysql.connector
from mysql.connector import Error

app = FastAPI()

# Database connection details
db_config = {
    "host": "localhost",
    "user": "root",  # Change this if you have a different MySQL user
    "password": "",  # Leave empty if no password is set
    "database": "librarydb"  # Your database name
}

# Function to connect to the database
def get_db_connection():
    try:
        connection = mysql.connector.connect(**db_config)
        return connection
    except Error as e:
        print("Error connecting to MySQL:", e)
        return None

# CRUD Operations

# CREATE a new book
@app.post("/books/")
async def create_book(book_title: str, author_id: int, category_id: int, publication_year: int, isbn: str):
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor()
        cursor.execute("INSERT INTO books (book_title, author_id, category_id, publication_year, isbn) VALUES (%s, %s, %s, %s, %s)",
                       (book_title, author_id, category_id, publication_year, isbn))
        connection.commit()
        cursor.close()
        connection.close()
        return {"message": "Book added successfully"}
    else:
        raise HTTPException(status_code=500, detail="Database connection failed")

# READ all books
@app.get("/books/")
async def get_books():
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor(dictionary=True)
        cursor.execute("SELECT * FROM books")
        books = cursor.fetchall()
        cursor.close()
        connection.close()
        return books
    else:
        raise HTTPException(status_code=500, detail="Database connection failed")

# UPDATE a book
@app.put("/books/{book_id}")
async def update_book(book_id: int, book_title: str, author_id: int, category_id: int, publication_year: int, isbn: str):
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor()
        cursor.execute("UPDATE books SET book_title = %s, author_id = %s, category_id = %s, publication_year = %s, isbn = %s WHERE book_id = %s",
                       (book_title, author_id, category_id, publication_year, isbn, book_id))
        connection.commit()
        cursor.close()
        connection.close()
        return {"message": "Book updated successfully"}
    else:
        raise HTTPException(status_code=500, detail="Database connection failed")

# DELETE a book
@app.delete("/books/{book_id}")
async def delete_book(book_id: int):
    connection = get_db_connection()
    if connection:
        cursor = connection.cursor()
        cursor.execute("DELETE FROM books WHERE book_id = %s", (book_id,))
        connection.commit()
        cursor.close()
        connection.close()
        return {"message": "Book deleted successfully"}
    else:
        raise HTTPException(status_code=500, detail="Database connection failed")
