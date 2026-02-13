import pandas as pd
import psycopg2

"""
Project: Lending Club Portfolio Risk & ROI Analysis
Step: Export clean analytical dataset from PostgreSQL
Author: Aldo Navarro
"""

# Connection to SQL
conn = psycopg2.connect(
    host="localhost",
    database="fintech_loans",
    user="postgres",
    password="Postgres1"
)

# Query from loan_analysis_dataset view
query = "SELECT * FROM loan_analysis_dataset;"

#Create analysis dataframe
analysis_df = pd.read_sql(query, conn)

# Export CSV
analysis_df.to_csv("loan_analysis_dataset.csv", index=False)

conn.close()

print("Analysis dataset exported successfully.")