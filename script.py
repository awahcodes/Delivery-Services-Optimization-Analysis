
import pandas as pd
from sqlalchemy import create_engine
 
 #connect to server
conn_string = 'postgresql://postgres:Onajourney123#@localhost/OhmDeliveryServices'
db = create_engine(conn_string)
conn = db.connect()
 
 #import csv dataset into database 'museum' using loop
 
files = ['deliveries', 'costs', 'routes']
 
for file in files:
    df = pd.read_csv(f'C:/Users/aniwa/OneDrive/Desktop/New World/Data Analyst Portfolio/Delivery Services Optimization/{file}.csv')
    df.to_sql(file, con=conn, if_exists='replace', index=False)

   