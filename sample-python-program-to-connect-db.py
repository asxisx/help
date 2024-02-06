import pyodbc
server = ''
db = ''
username = ''
password = ''
try:
    conn_str = 'DRIVER={ODBC Driver 17 for SQL Server};SERVER='+server+';DATABASE='+db+';UID='+username+';PWD='+password+';'
    conn = pyodbc.connect(conn_str)
    cursor = conn.cursor()
    print("Connected to SQL")
    cursor.execute("SELECT @@version;")
    row = cursor.fetchone()
    print("SQL Server Version:",row[0])
    cursor.close()
    conn.close()
except pyodbc.Error as e:
    print("Error:",e)
