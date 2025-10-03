from cs50 import SQL

db = SQL("sqlite:///data_jobs.db")

data_jobs = input("Data_jobs: ")

rows = db.execute("SELECT COUNT(*) AS n FROM data_jobs WHERE job_country = ?", data_jobs)
row = rows[0]

print(row["n"])
