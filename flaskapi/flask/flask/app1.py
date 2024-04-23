# # Let's write your code here!


# from flask import Flask
# import requests
# import pymysql
# import os

# app = Flask(__name__)


# @app.route("/foodwastes")
# def foodwastes():
#     db_conn = pymysql.connect(host="localhost", user="root"
#                               ,password=os.getenv('kranta_sql_password')
#                               , database="waste_less_taste"
#                               ,cursorclass=pymysql.cursors.DictCursor)
#     with db_conn.cursor() as cursor:
#         cursor.execute("""
#                         SELECT 
#                        * from tonne_cap
#                             """)
#         foodwastes = cursor.fetchall()

#     db_conn.close() 

#     return foodwastes



# @app.route("/foodwastes/<country_name>")

# def foodwastes_c(country_name):
#     db_conn = pymysql.connect(host="localhost", user="root"
#                               ,password=os.getenv('kranta_sql_password')
#                               , database="waste_less_taste"
#                               ,cursorclass=pymysql.cursors.DictCursor)
#     with db_conn.cursor() as cursor:
#         cursor.execute("""
#  SELECT 
#                        * from tonne_cap
                         
#                             WHERE country =%s
#                             """,(country_name,))
#         foodwastes = cursor.fetchall()


#     db_conn.close() 

#     return foodwastes



# @app.route("/fruit/<country_name>")


# def fruit(country_name):
#     db_conn = pymysql.connect(host="localhost", user="root"
#                               ,password=os.getenv('kranta_sql_password')
#                               , database="waste_less_taste"
#                               ,cursorclass=pymysql.cursors.DictCursor)
#     with db_conn.cursor() as cursor:
#         cursor.execute("""
# SELECT
#   *
#                             FROM national_fruit 
                         
#                             WHERE country =%s
#                             """,(country_name,))
#         fruit = cursor.fetchone()

#     db_conn.close() 

#     return fruit




# @app.route("/goal/<country_name>")


# def goal(country_name):
#     db_conn = pymysql.connect(host="localhost", user="root"
#                               ,password=os.getenv('kranta_sql_password')
#                               , database="waste_less_taste"
#                               ,cursorclass=pymysql.cursors.DictCursor)
#     with db_conn.cursor() as cursor:
#         cursor.execute("""Select * from 12_3_eu
#                        WHERE country =%s
#                             """,(country_name,))
#         goal = cursor.fetchall()

#     db_conn.close() 

#     return goal





# @app.route("/top_wasted")


# def top_wasted():
#     db_conn = pymysql.connect(host="localhost", user="root"
#                               ,password=os.getenv('kranta_sql_password')
#                               , database="waste_less_taste"
#                               ,cursorclass=pymysql.cursors.DictCursor)
#     with db_conn.cursor() as cursor:
#         cursor.execute("""Select * from 
#                      top_wasted
#                             """)
#         top_wasted = cursor.fetchall()

#     db_conn.close() 

#     return top_wasted


from flask import Flask
from flasgger import Swagger
import pymysql
import os

app = Flask(__name__)
swagger = Swagger(app)

@app.route("/foodwastes")
def foodwastes():
    """
    Endpoint to get all food waste data.
    ---
    responses:
      200:
        description: A list of food waste data.
    """
    db_conn = pymysql.connect(host="localhost", user="root",
                               password=os.getenv('kranta_sql_password'),
                               database="waste_less_taste",
                               cursorclass=pymysql.cursors.DictCursor)
    with db_conn.cursor() as cursor:
        cursor.execute("SELECT * FROM tonne_cap")
        foodwastes = cursor.fetchall()

    db_conn.close()
    return foodwastes

@app.route("/foodwastes/<country_name>")
def foodwastes_c(country_name):
    """
    Endpoint to get food waste data for a specific country.
    ---
    parameters:
      - name: country_name
        in: path
        type: string
        required: true
        description: The name of the country.
    responses:
      200:
        description: Food waste data for the specified country.
      404:
        description: Country not found.
    """
    db_conn = pymysql.connect(host="localhost", user="root",
                               password=os.getenv('kranta_sql_password'),
                               database="waste_less_taste",
                               cursorclass=pymysql.cursors.DictCursor)
    with db_conn.cursor() as cursor:
        cursor.execute("SELECT * FROM tonne_cap WHERE country = %s", (country_name,))
        foodwastes = cursor.fetchall()

    db_conn.close()
    return foodwastes

@app.route("/fruit/<country_name>")
def fruit(country_name):
    """
    Endpoint to get the national fruit for a specific country.
    ---
    parameters:
      - name: country_name
        in: path
        type: string
        required: true
        description: The name of the country.
    responses:
      200:
        description: National fruit for the specified country.
      404:
        description: Country not found.
    """
    # Your function code here...

@app.route("/top_wasted")
def top_wasted():
    """
    Endpoint to get the list of top food wasted data.
    ---
    responses:
      200:
        description: A list of top food waste data.
    """
if __name__ == '__main__':
    app.run(debug=True)
