import pandas as pd

"""
Project: Lending Club Portfolio Risk & ROI Analysis
Step: Create staging csv 
Author: Aldo Navarro
"""

#Ruta al CSV original
input_path = "/Users/aldonava09/Documents/datasets/lending_club/accepted_2007_to_2018Q4.csv"

#Ruta de salida
output_path = "data/staging_loans.csv"

#Columnas utilizadas
cols = [
    "annual_inc",
    "emp_length",
    "home_ownership",
    "fico_range_high",
    "purpose",
    "loan_amnt",
    "int_rate",
    "term",
    "issue_d",
    "loan_status",
    "total_pymnt",
    "total_rec_prncp",
    "total_rec_int",
    "last_pymnt_d"
]

#Creando df 
staging_df = pd.read_csv(input_path,usecols=cols)
staging_df = staging_df[cols]

#Verificnado df
print(staging_df.head())
print(staging_df.shape)

#Guardando csv reducido
staging_df.to_csv(output_path, index=False)