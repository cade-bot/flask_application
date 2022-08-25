import os

user = os.environ['MYSQL_USER'] = 'root'
password = os.environ['MYSQL_PASSWORD'] = 'paine990'
host = os.environ['MYSQL_HOST'] = 'fmadata2'
database = os.environ['MYSQL_DATABASE'] = 'fmadata'
port = os.environ['MYSQL_PORT'] = '3306'

DATABASE_CONNECTION_URI = 'mysql://root:paine990@127.0.0.1:3306/fmadata'
