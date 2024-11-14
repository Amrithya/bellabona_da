import sqlite3
import pandas as pd

dishes = "datasets/dishes_csv.csv"
users = 'datasets/users_csv.csv'
orders = 'datasets/orders_csv.csv'

db_file = 'db/bellabona.db'


data_dishes = pd.read_csv(dishes, delimiter=',')
data_users = pd.read_csv(users, delimiter=',')
data_orders = pd.read_csv(orders, delimiter=';')
data_orders.columns = ['id', 'user_id', 'dish_id', 'date']

print("dishes columns:", data_dishes.columns)
print("users columns:", data_users.columns)
print("orders columns:", data_orders.columns)

conn = sqlite3.connect(db_file)

try:
    data_dishes.to_sql('dishes', conn, if_exists='append', index=False)
    data_users.to_sql('users', conn, if_exists='append', index=False)
    data_orders.to_sql('orders', conn, if_exists='append', index=False)
    print("Data imported successfully in DB.")
except Exception as e:
    print("Error importing data:", e)
finally:
    conn.commit()

conn.close()