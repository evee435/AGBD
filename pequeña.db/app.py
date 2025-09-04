from flask import Flask, jsonify 
import mysql.connector
import sqlite3 #importa el lenguaje flask
db=None

app = Flask(__name__)

# Configuración de la base de datos
app.config['MYSQL_HOST'] = 'localhost'  # O la IP de tu servidor de base de datos
app.config['MYSQL_USER'] = 'accesorio'  # Tu usuario de MySQL
app.config['MYSQL_PASSWORD'] = 'accesorio1234'  # Tu contraseña de MySQL
app.config['MYSQL_DB'] = 'accesorios'  # El nombre de la base de datos que quieres usar
app.config['MYSQL_PORT'] = 3306  # el puerto (por defecto 3306)

# Establecer la conexión en una ruta
@app.route('/usuarios', methods=['GET'])
def obtener_usuarios():
    # Establecer la conexión a MySQL con el puerto
    conn = mysql.connector.connect(
        host=app.config['MYSQL_HOST'],
        user=app.config['MYSQL_USER'],
        password=app.config['MYSQL_PASSWORD'],
        database=app.config['MYSQL_DB'],
        port=app.config['MYSQL_PORT']  # Aquí se incluye el puerto
    )
    cursor = conn.cursor(dictionary=True)

    # Consultar la base de datos
    cursor.execute("SELECT * FROM usuarios")
    usuarios = cursor.fetchall()

    # Cerrar la conexión
    cursor.close()
    conn.close()

    # Retornar los resultados como JSON
    return jsonify(usuarios)