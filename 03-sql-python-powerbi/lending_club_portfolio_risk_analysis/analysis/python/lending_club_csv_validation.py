import pandas as pd

"""
Project: Lending Club Portfolio Risk & ROI Analysis
Step: Validate csv raw
Author: Aldo Navarro
"""

#Definiendo path del archivo
path = "/Users/aldonava09/Documents/datasets/lending_club/accepted_2007_to_2018Q4.csv"

#Creando df de verificacion
df_sample = pd.read_csv(path, nrows=1000)

#Revisando encabezados del df
print(df_sample.columns.to_list())