# Bella Case Study

## Overview

This project involves creating a SQLite database from CSV files and performing data analysis using Python. The data includes information about dishes, users, and orders.

## Data Sources

- `datasets/dishes_csv.csv`: Contains information about the dishes.
- `datasets/users_csv.csv`: Contains information about the users.
- `datasets/orders_csv.csv`: Contains information about the orders.
- `db/bellabona.db`: SQLite database file containing the data.

## Files

- `db/bellasql.py`: Script to create the SQLite database and import data from CSV files.
- `submission.ipynb`: Jupyter Notebook for data analysis and modeling.

## Setup

1. Ensure you have Python installed on your system.
2. Install the required Python packages:
    ```sh
    pip install pandas sqlite3 statsmodels
    ```

## Usage

1. Run the `db/bellasql.py` script to create the SQLite database and import the data:
    ```sh
    python db/bellasql.py
    ```
2. Open `submission.ipynb` in Jupyter Notebook to perform data analysis and modeling.

## Data Import Script

The `db/bellasql.py` script reads data from CSV files and imports it into a SQLite database. The script performs the following steps:

1. Reads the CSV files using pandas.
2. Prints the columns of each dataset.
3. Connects to the SQLite database.
4. Imports the data into the database.
5. Commits the transaction and closes the connection.

## Data Analysis

The `submission.ipynb` notebook contains code for data analysis and modeling. It includes:

- Reading data from the CSV files.
- Descriptive statistics and data visualization.
- Time series analysis using SARIMAX and ARIMA models.

## License

This project is licensed under the MIT License.
