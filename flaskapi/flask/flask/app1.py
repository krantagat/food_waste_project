# Let's write your code here!


from flask import Flask
import requests
import pymysql
import os

app = Flask(__name__)


@app.route("/foodwastes/")
def foodwastes():
    db_conn = pymysql.connect(host="localhost", user="root"
                              ,password=os.getenv('kranta_sql_password')
                              , database="waste_less_taste"
                              ,cursorclass=pymysql.cursors.DictCursor)
    with db_conn.cursor() as cursor:
        cursor.execute("""
                        SELECT 
                       * from tonne_cap
                            """)
        foodwastes = cursor.fetchall()

    db_conn.close() 

    return foodwastes


