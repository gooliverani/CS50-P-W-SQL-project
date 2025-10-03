import csv

with open("data_jobs.csv", "r") as file:
    reader = csv.DictReader(file)
    counts = {}
    for row in reader:
        data_jobs = row["job_country"]
        if data_jobs in counts:
            counts[data_jobs] += 1
        else:
            counts[data_jobs] = 1

for data_jobs in sorted(counts, key=counts.get, reverse=True):
    print(f"{data_jobs}: {counts[data_jobs]}")

