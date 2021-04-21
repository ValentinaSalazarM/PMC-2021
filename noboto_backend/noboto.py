import esquemas, modelos, API_REST
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api
from flask_marshmallow import Marshmallow  

app = Flask(__name__)

app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///noboto.db'

db = SQLAlchemy(app)

ma = Marshmallow(app)

api = Api(app)

class Usuario (db.Model):

    identificacion = db.Column (db.String(255), primary_key = True)
    nombre = db.Column (db.String(255))
    correo = db.Column (db.String(255), unique = True)
    celular = db.Column (db.String(255))
    calificacion = db.Column (db.Numeric)
    
    trueques_oferta = db.relationship ("Trueque", backref = "ofertante", lazy = 1)
    trueques_contraoferta = db.relationship ("Trueque", backref = "contraofertante", lazy = 1)

    localizaciones = db.relationship ("Localizacion", backref = "usuario", lazy = 1)
    publicaciones = db.relationship ("Publicacion", backref = "autor", lazy = 1)
    mensajes = db.relationship ("Mensaje", backref = "autor", lazy = 1)
    contraofertas = db.relationship ("Contraoferta", backref = "autor", lazy = 1)

class Trueque (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    activo = db.Column (db.Boolean)
    diaEntrega = db.Column (db.DateTime)
    etapa = db.Column (db.String(50))
    
    localizacion_id = db.Column (db.Integer, db.ForeignKey ("localizacion.id"))
    
    ofertante_id = db.Column (db.String(255), db.ForeignKey ("usuario.id"))
    ofertante = db.relationship ('Usuario')

    contraofertante_id = db.Column (db.String(255), db.ForeignKey ("usuario.id"))
    contraofertante = db.relationship ('Usuario')

class Localizacion (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    nombre = db.Column (db.String(255))    
    latitud = db.Column (db.Numeric)
    longitud = db.Column (db.Numeric)
    direccion = db.Column (db.String(50))

    trueques = db.relationship ("Trueque", backref = "localizacion", lazy = 1)
    usuario_id = db.Column (db.String(255), db.ForeignKey ('usuario.id'))

class Mensaje (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    texto = db.Column (db.String(255))
    fecha = db.Column (db.DateTime)

    autor_id = db.Column (db.String(255), db.ForeignKey ('usuario.id'))
    autor = db.relationship ('Usuario') 

class Publicacion (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    titulo = db.Column (db.String(255))
    fecha = db.Column (db.DateTime)

    autor_id = db.Column (db.String(255), db.ForeignKey ('usuario.id'))
    autor = db.relationship ('Usuario')

    contraofertas = db.relationship ("Contraoferta", backref = "publicacion", lazy = 1)


class Contraoferta (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    mensaje = db.Column (db.String(255))
    usuario_id = db.Column (db.String(255), db.ForeignKey ('usuario.id'))
    publicacion_id = db.Column (db.String(255), db.ForeignKey ('publicacion.id'))


class Foto (db.Model):
    
    id = db.Column (db.String(255), primary_key = True)
    ruta = db.Column (db.String(255), unique = True)

class Objeto (db.Model):

    id = db.Column (db.String(255), primary_key = True)
    nombre = db.Column (db.String(255))
    descripcion = db.Column (db.String(255))
    categoria = db.Column (db.String(255))
    condicion = db.Column (db.String(255))
    precio = db.Column (db.Numeric)
    valorIntrinseco = db.Column (db.Numeric)


