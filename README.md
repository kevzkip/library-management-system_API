# Library Management System API

## Project Title:
Library Management System API

## Description:
This project is a RESTful API for managing a library's database system. It allows users to perform operations such as creating, retrieving, updating, and deleting books, authors, and categories. The project leverages FastAPI for building the API, MySQL for the database, and Uvicorn for running the application.

## Features:
- **Create, Read, Update, Delete (CRUD)** functionality for Books, Authors, and Categories.
- Connection to MySQL database.
- Use of FastAPI to build a robust API.
- Real-time feedback and validation of inputs.

## How to Run/Setup the Project:

### 1. Clone the repository:
```bash
git clone https://github.com/kevzkip/library-management-system_API.git
```
### 2. Navigate to the project directory:
```
cd "Library DATABASE Management System"
```
### 3. Create a virtual environment (if not already created):
```
python -m venv venv
```
### 4. Activate the virtual environment:
Windows:

```
.\venv\Scripts\activate
```
macOS/Linux:

```
source venv/bin/activate
```
### 5. Install the required dependencies:
```
pip install -r requirements.txt
```
### 6. Set up the database:
Import the library_database.sql file into MySQL:

```
mysql -u <username> -p <database_name> < library_database.sql
```
Replace <username> with your MySQL username and <database_name> with your target database name.

### 7. Run the application:
```
uvicorn main:app --reload
The application will be running on http://127.0.0.1:8000.
```
### 8. Access the API Documentation:
Visit http://127.0.0.1:8000/docs to interact with the API via the auto-generated documentation provided by FastAPI.

### ERD (Entity-Relationship Diagram):
![ERD Screenshot](https://github.com/kevzkip/library-management-system_API/blob/main/ERD.png)
