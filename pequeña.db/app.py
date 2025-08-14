from flask import Flask, url_for , render_template
import sqlite3 #importa el lenguaje flask
app = Flask(__name__) 
db=None

#-------------CONEXION A BASA DE DATOS-----------------

def abrirConexion(): #abre conexion
    db = sqlite3.connect('mi_base_de_datos.db')  #nombre de la db
    db.row_factory = sqlite3.Row #esto permite acceder a las filas como diccionarios
    return db

def cerrarConexion(db): #funcion para cerrar
    db.close()


#10 tablas 

#-----------INSERTAR DATOS-------------------
@app.route('/insertar/<string:usuario>/<string:email>')
def insertar(usuario, email):
    db = abrirConexion()  # Abrir la conexión
    cursor = db.cursor()

    # Insertar los datos de usuario y correo en la tabla
    cursor.execute("INSERT INTO usuario (usuario, email) VALUES (?, ?)", (usuario, email))
    db.commit()  # Guardar los cambios en la base de datos

#creo otro ruta con def que muestre todo (usuarios)


#que funcion tiene los signos de pregunta
#si quiero insertar los datos de cliente tengo que ingresar todas las filas
#hago lo mismo con todas
#en la ruta es opc o tengo que especificar 
#si la tabla tiene id, en la ruta se deberia poner int:id