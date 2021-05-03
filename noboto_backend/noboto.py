from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from flask_restful import Api
from flask_marshmallow import Marshmallow  
from flask_marshmallow.fields import fields as fd
import datetime

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'sqlite:///noboto.db'
db = SQLAlchemy(app)
ma = Marshmallow(app)
api = Api(app)

localizaciones_publicacion = db.Table('localizaciones_publicacion',
                                        db.Column('publicacion_id', db.Integer, db.ForeignKey('publicacion.id'), primary_key=True),
                                        db.Column('localizacion_id', db.Integer, db.ForeignKey('localizacion.id'), primary_key=True)
)
fotos_contraoferta = db.Table('fotos_contraoferta',
                                db.Column('foto_id', db.Integer, db.ForeignKey('foto.id'), primary_key=True),
                                db.Column('contraoferta_id', db.Integer, db.ForeignKey('contraoferta.id'), primary_key=True)
)

class Usuario(db.Model):

    identificacion = db.Column(db.String(255), primary_key = True)
    nombre = db.Column(db.String(255))
    correo = db.Column(db.String(255), unique = True)
    celular = db.Column(db.String(255))
    calificacion = db.Column(db.Numeric)

    foto_id = db.Column(db.Integer, db.ForeignKey('foto.id'), nullable=False)
    foto = db.relationship('Foto', backref = 'autor', uselist=False, 
                            lazy = 1, foreign_keys=[foto_id])

class Trueque(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    activo = db.Column(db.Boolean)
    diaEntrega = db.Column(db.DateTime)
    etapa = db.Column(db.String(50))
    
    localizacion_id = db.Column(db.Integer, db.ForeignKey('localizacion.id'), nullable=False)    
    localizacion = db.relationship('Localizacion', backref = 'trueque', uselist=False, 
                                    lazy = 1, foreign_keys=[localizacion_id])

    publicacion_id = db.Column(db.Integer, db.ForeignKey('publicacion.id'), nullable=False)
    publicacion = db.relationship('Publicacion', backref = 'trueque', uselist=False,
                                    lazy = 1, foreign_keys=[publicacion_id])

    contraoferta_id = db.Column(db.Integer, db.ForeignKey('contraoferta.id'), nullable=False)
    contraoferta = db.relationship('Contraoferta', backref = 'trueque', uselist=False, 
                                    lazy = 1, foreign_keys=[contraoferta_id])

class Localizacion(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    nombre = db.Column(db.String(255))    
    latitud = db.Column(db.Numeric)
    longitud = db.Column(db.Numeric)
    direccion = db.Column(db.String(50))

    usuario_id = db.Column(db.String(255), db.ForeignKey('usuario.identificacion'))
    usuario = db.relationship('Usuario', backref = 'localizaciones', uselist=True, 
                                lazy = 1, foreign_keys=[usuario_id])

class Mensaje(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    texto = db.Column(db.String(255))
    fecha = db.Column(db.DateTime)

    usuario_id = db.Column(db.String(255), db.ForeignKey('usuario.identificacion'), nullable=False)
    usuario = db.relationship('Usuario', backref = 'mensajes', uselist=True, 
                                lazy = 1, foreign_keys=[usuario_id])

    trueque_id = db.Column(db.Integer, db.ForeignKey('trueque.id'), nullable=False)
    trueque = db.relationship('Trueque', backref = 'chat', uselist=True, 
                                lazy = 1, foreign_keys=[trueque_id])
    
    foto_id = db.Column(db.Integer, db.ForeignKey('trueque.id'))
    foto = db.relationship('Trueque', backref = 'mensaje', uselist=False, 
                            lazy = 1, foreign_keys=[foto_id])

class Publicacion(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    titulo = db.Column(db.String(255))
    fecha = db.Column(db.DateTime, default=datetime.datetime.utcnow)

    usuario_id = db.Column(db.String(255), db.ForeignKey('usuario.identificacion'), nullable=False)
    usuario = db.relationship('Usuario', backref = 'publicaciones', uselist=True, 
                                    lazy = 1, foreign_keys=[usuario_id])

    objeto_id = db.Column(db.Integer, db.ForeignKey('objeto.id'), nullable=False)
    objeto = db.relationship('Objeto', backref = 'publicacion', uselist=False, lazy = 1)

    localizaciones = db.relationship('Localizacion', secondary=localizaciones_publicacion, lazy=1,
                                    backref=db.backref('publicaciones', lazy=1))

class Contraoferta(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    mensaje = db.Column(db.String(255))

    usuario_id = db.Column(db.String(255), db.ForeignKey('usuario.identificacion'))
    usuario = db.relationship('Usuario', backref = 'contraofertas', uselist=True, 
                                lazy = 1, foreign_keys=[usuario_id])

    publicacion_id = db.Column(db.Integer, db.ForeignKey('publicacion.id'), nullable=False)
    publicacion = db.relationship('Publicacion', backref = 'contraofertas', uselist=True, 
                                    lazy = 1, foreign_keys=[publicacion_id])

    objeto_id = db.Column(db.Integer, db.ForeignKey('objeto.id'), nullable=False)
    objeto = db.relationship('Objeto', backref = 'contraoferta', uselist=False, lazy = 1)
    
    fotos = db.relationship('Foto', secondary=fotos_contraoferta, lazy=1,
                            backref=db.backref('contraofertas', lazy=1))

class Foto(db.Model):
    
    id = db.Column(db.Integer, primary_key = True)
    ruta = db.Column(db.String(255), unique = True)

    publicacion_id = db.Column(db.Integer, db.ForeignKey('publicacion.id'))
    publicacion = db.relationship('Publicacion', backref = 'fotos', uselist=True, 
                                    lazy = 1, foreign_keys=[publicacion_id])
    
class Objeto(db.Model):

    id = db.Column(db.Integer, primary_key = True)
    nombre = db.Column(db.String(255))
    descripcion = db.Column(db.String(255))
    categoria = db.Column(db.String(255))
    condicion = db.Column(db.String(255))
    precio = db.Column(db.Numeric)
    valorIntrinseco = db.Column(db.Numeric)

# Esquemas
class Usuario_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('identificacion', 'nombre', 'correo', 'celular', 'calificacion', 'foto_id')
    calificacion = fd.Decimal(as_string=True)

class Trueque_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'activo', 'diaEntrega', 'etapa', 'localizacion_id', 'publicacion_id', 'contraoferta_id')
    diaEntrega = fd.DateTime(as_string=True)

class Localizacion_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'nombre', 'latitud', 'longitud', 'direccion', 'usuario_id')
    latitud = fd.Decimal(as_string=True)
    longitud = fd.Decimal(as_string=True)

class Mensaje_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'texto', 'fecha', 'usuario_id', 'trueque_id', 'foto_id')

class Publicacion_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'titulo', 'fecha', 'usuario_id', 'objeto_id')
    fecha = fd.DateTime(as_string=True)

class Contraoferta_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'mensaje', 'usuario_id', 'publicacion_id', 'objeto_id')

class Foto_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'ruta', 'publicacion_id')

class Objeto_Schema(ma.Schema):
    class Meta:
        # Campos que se exponen
        fields = ('id', 'nombre', 'descripcion', 'categoria', 'condicion', 'precio', 'valorIntrinseco')
    precio = fd.Decimal(as_string=True)
    valorIntrinseco = fd.Decimal(as_string=True)