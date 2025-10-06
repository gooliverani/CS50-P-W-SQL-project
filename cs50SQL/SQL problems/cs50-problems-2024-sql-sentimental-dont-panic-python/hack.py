from cs50 import SQL

# Connect to the database
db = SQL("sqlite:///dont-panic.db")

# Prompt user for new password
new_password = input("Enter a password: ")

# Update admin password using prepared statement
db.execute(
    """
    UPDATE "users"
    SET "password" = ?
    WHERE "username" = 'admin';
    """,
    new_password
)
