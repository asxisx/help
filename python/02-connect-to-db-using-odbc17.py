import pyodbc
def db_connect():
    try:
        server = '172.30.1.135'
        database = 'temp_db'
        username = 'dbadmin'
        password = 'SD@#UILuh4378ohedbku3ytvi236ft'
        driver = "{ODBC Driver 17 for SQL Server}"
        connection_string = f'DRIVER={driver};SERVER={server};DATABASE={database};UID={username};PWD={password};Trusted_Connection=no' # Trusted_Connection=no was added because without it there was error
        connection = pyodbc.connect(connection_string)
        print("Success")

        cursor = connection.cursor()
        query = "SELECT * FROM users"
        cursor.execute(query)

        rows = cursor.fetchall()
        for row in rows:
            print(row)
        cursor.close()
        connection.close()
    except Exception as e:
        print("fail")
        print(f"Error: {e}")

if __name__ == "__main__":
    db_connect()
