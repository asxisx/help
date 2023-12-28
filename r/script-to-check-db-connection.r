# Load the required libraries
library(DBI)
library(odbc)

# Database connection parameters
db_server <- "your_server_name"
db_port <- your_server_port
db_user <- "your_username"
db_password <- "your_password"
db_name <- "your_database_name"

# Create a connection
con <- dbConnect(
  odbc(),
  Driver = "ODBC Driver 17 for SQL Server",
  Server = db_server,
  Port = db_port,
  Database = db_name,
  UID = db_user,
  PWD = db_password
)

# Check if the connection was successful
if (dbIsValid(con)) {
  cat("Connection successful!\n")
} else {
  cat("Connection failed.\n")
}

# Close the connection
dbDisconnect(con)


# Run the code using Rscript <script-name>.R
