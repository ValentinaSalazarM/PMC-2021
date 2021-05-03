from flask import Flask, request
from flask_restful import Resource
from haversine import haversine
from datetime import datetime
import noboto

# Funcionalidades Usuario
usuario_schema = noboto.Usuario_Schema()
usuarios_schema = noboto.Usuario_Schema(many = True)
class RecursoListarUsuarios(Resource):
    def get(self):
        usuarios = noboto.Usuario.query.all()
        return usuarios_schema.dump(usuarios)
    def post(self):
        nuevo_usuario = noboto.Usuario(
            identificacion = request.json['identificacion'],
            nombre = request.json['nombre'],
            correo = request.json['correo'],
            celular = request.json['celular'],
            calificacion = request.json['calificacion'],
            foto_id = int(request.json['foto_id'])
        )
        noboto.db.session.add(nuevo_usuario)
        noboto.db.session.commit()
        return usuario_schema.dump(nuevo_usuario)
class RecursoUnUsuario(Resource):
    def get(self, identificacion_usuario):
        usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
        return usuario_schema.dump(usuario)
    def delete(self, identificacion_usuario):
        usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
        noboto.db.session.delete(usuario)
        noboto.db.session.commit()
        return '', 204

# Funcionalidades Publicacion
publicacion_schema = noboto.Publicacion_Schema()
publicaciones_schema = noboto.Publicacion_Schema(many = True)
class RecursoListarPublicaciones(Resource):
    def get(self):
        publicaciones = noboto.Publicacion.query.all()
        return publicaciones_schema.dump(publicaciones)
    def post(self):
        nueva_publicacion = noboto.Publicacion(
            id = request.json['id'],
            titulo = request.json['titulo'],
            fecha = request.json['fecha'],
            usuario_id = request.json['usuario_id'],
            objeto_id = request.json['objeto_id']
        )
        noboto.db.session.add(nueva_publicacion)
        noboto.db.session.commit()
        return publicacion_schema.dump(nueva_publicacion)
class RecursoUnaPublicacion(Resource):
    def get(self, id_publicacion):
        publicacion = noboto.Publicacion.query.get_or_404(id_publicacion)
        return publicacion_schema.dump(publicacion)
    def delete(self, id_publicacion):
        publicacion = noboto.Publicacion.query.get_or_404(id_publicacion)
        noboto.db.session.delete(publicacion)
        noboto.db.session.commit()
        return '', 204

# Funcionalidades Contraoferta
contraoferta_schema = noboto.Contraoferta_Schema()
contraofertas_schema = noboto.Contraoferta_Schema(many = True)
class RecursoListarContraofertas(Resource):
    def get(self):
        contraofertas = noboto.Contraoferta.query.all()
        return contraofertas_schema.dump(contraofertas)
    def post(self):
        nueva_contraoferta = noboto.Contraoferta(
            id = request.json['id'],
            mensaje = request.json['mensaje'],
            usuario_id = request.json['usuario_id'],
            publicacion_id = request.json['publicacion_id'],
            objeto_id = request.json['objeto_id']
        )
        noboto.db.session.add(nueva_contraoferta)
        noboto.db.session.commit()
        return contraoferta_schema.dump(nueva_contraoferta)
class RecursoUnaContraoferta(Resource):
    def get(self, id_contraoferta):
        contraoferta = noboto.Contraoferta.query.get_or_404(id_contraoferta)
        return contraoferta_schema.dump(contraoferta)
    def delete(self, id_contraoferta):
        contraoferta = noboto.Contraoferta.query.get_or_404(id_contraoferta)
        noboto.db.session.delete(contraoferta)
        noboto.db.session.commit()
        return '', 204

# Funcionalidades Trueque
trueque_schema = noboto.Trueque_Schema()
trueques_schema = noboto.Trueque_Schema(many = True)
class RecursoListarTrueques(Resource):
    def get(self):
        trueques = noboto.Trueque.query.all()
        return trueques_schema.dump(trueques)
    def post(self):
        nuevo_trueque = noboto.Trueque(
            id = request.json['id'],
            activo = request.json['activo'],
            diaEntrega = request.json['diaEntrega'],
            etapa = request.json['etapa'],
            localizacion_id = request.json['localizacion_id'],
            publicacion_id = request.json['publicacion_id'],
            contraoferta_id = request.json['contraoferta_id']
        )
        noboto.db.session.add(nuevo_trueque)
        noboto.db.session.commit()
        return trueque_schema.dump(nuevo_trueque)
class RecursoUnTrueque(Resource):
    def get(self, id_trueque):
        trueque = noboto.Trueque.query.get_or_404(id_trueque)
        return trueque_schema.dump(trueque)
    def put(self, id_trueque):
        trueque = noboto.Trueque.query.get_or_404(id_trueque)
        if 'etapa' in request.json:
            trueque.etapa = request.json['etapa']
        if 'diaEntrega' in request.json:
            trueque.diaEntrega = date_time_obj = datetime.strptime(request.json['diaEntrega'], '%Y-%m-%d %H:%M:%S')
        if 'localizacion_id' in request.json:
            trueque.localizacion_id = int(request.json['localizacion_id'])
        noboto.db.session.commit()
        return trueque_schema.dump(trueque)
    def delete(self, id_trueque):
        trueque = noboto.Trueque.query.get_or_404(id_trueque)
        noboto.db.session.delete(trueque)
        noboto.db.session.commit()
        return '', 204

class RecursoPublicacionesUsuario(Resource):
    def get(self, identificacion_usuario):
        usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
        publicaciones = usuario.publicaciones
        return publicaciones_schema.dump(publicaciones)
class RecursoContraofertasPublicacion(Resource):
    def get(self, id_publicacion):
        publicacion = noboto.Publicacion.query.get_or_404(id_publicacion)
        contraofertas = publicacion.contraofertas
        print(type(contraofertas))
        return contraofertas_schema.dump(contraofertas)

class RecursoContraofertasPublicacionML(Resource):
    def get(self, id_publicacion, radio_m):
        publicaciones = noboto.Publicacion.query.all()
        publicacion_interes = noboto.Publicacion.query.get_or_404(id_publicacion)
        ubicaciones_interes = [(loc.latitud, loc.longitud) for loc in publicacion_interes.localizaciones]
        publicaciones_en_rango = []
        for publicacion in publicaciones:
            if not publicacion.id == id_publicacion:
                ubicaciones_actual = [(loc.latitud, loc.longitud) for loc in publicacion.localizaciones]
                distancias = []
                for ubicacion_interes in ubicaciones_interes:
                    for ubicacion_actual in ubicaciones_actual:
                        distancias.append(haversine(ubicacion_interes, ubicacion_actual))
                if min(distancias) <= radio_m/1000:
                    publicaciones_en_rango.append(publicacion)
        publicaciones_dif_precio = {}
        for publicacion in publicaciones_en_rango:
            publicaciones_dif_precio[publicacion] = abs(publicacion_interes.objeto.valorIntrinseco - publicacion.objeto.valorIntrinseco)
        publicaciones_ordenadas = list(dict(sorted(publicaciones_dif_precio.items(), key=lambda item: item[1])).keys())
        return publicaciones_schema.dump(publicaciones_ordenadas[:3])


noboto.api.add_resource(RecursoListarUsuarios, '/usuarios')
noboto.api.add_resource(RecursoUnUsuario,'/usuario/<int:identificacion_usuario>')
noboto.api.add_resource(RecursoListarPublicaciones, '/publicaciones')
noboto.api.add_resource(RecursoUnaPublicacion,'/publicacion/<int:id_publicacion>')
noboto.api.add_resource(RecursoListarContraofertas, '/contraofertas')
noboto.api.add_resource(RecursoUnaContraoferta,'/contraoferta/<int:id_contraoferta>')
noboto.api.add_resource(RecursoListarTrueques, '/trueques')
noboto.api.add_resource(RecursoUnTrueque,'/trueque/<int:id_trueque>')

noboto.api.add_resource(RecursoPublicacionesUsuario,'/publicaciones_usuario/<int:identificacion_usuario>')
noboto.api.add_resource(RecursoContraofertasPublicacion,'/contraofertas_publicacion/<int:id_publicacion>')
noboto.api.add_resource(RecursoContraofertasPublicacionML,'/contraofertas_publicacionML/<int:id_publicacion>/radio_m/<int:radio_m>')

if __name__ == '__main__':
    noboto.app.run(debug=True)