import os

user = os.environ['MYSQL_USER'] = 'root'
password = os.environ['MYSQL_PASSWORD'] = 'password'
host = os.environ['MYSQL_HOST'] = 'flask_application_sql_server_1'
database = os.environ['MYSQL_DATABASE'] = 'fmadata'
port = os.environ['MYSQL_PORT'] = '3306'

DATABASE_CONNECTION_URI = 'mysql://root:password@sql_server:3306/fmadata'
