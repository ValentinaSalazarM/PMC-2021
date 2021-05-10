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

# Funcionalidades Objeto
objeto_schema = noboto.Objeto_Schema()
objetos_schema = noboto.Objeto_Schema(many = True)
class RecursoListarObjetos(Resource):
    def get(self):
        objetos = noboto.Objeto.query.all()
        return objetos_schema.dump(objetos)
    def post(self):
        nuevo_objeto = noboto.Objeto(
            id = request.json['id'],
            nombre = request.json['nombre'],
            descripcion = request.json['descripcion'],
            categoria = request.json['categoria'],
            condicion = request.json['condicion'],
            precio = request.json['precio'],
            valorIntrinseco = request.json['valorIntrinseco']
        )
        noboto.db.session.add(nuevo_objeto)
        noboto.db.session.commit()
        return objeto_schema.dump(nuevo_objeto)
class RecursoUnObjeto(Resource):
    def get(self, id_objeto):
        objeto = noboto.Objeto.query.get_or_404(id_objeto)
        return objeto_schema.dump(objeto)
    def delete(self, id_objeto):
        objeto = noboto.Objeto.query.get_or_404(id_objeto)
        noboto.db.session.delete(objeto)
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
        ubicaciones_publicacion = [(loc.latitud, loc.longitud) for loc in publicacion.localizaciones]
        contraofertas = publicacion.contraofertas
        distancias_publicacion = {}
        tumbamiento_publicacion = {}
        for contraoferta in contraofertas:
            usuario_contraoferta = noboto.Usuario.query.get_or_404(contraoferta.usuario_id)
            ubicaciones_contraoferta = [(loc.latitud, loc.longitud) for loc in usuario_contraoferta.localizaciones]
            distancias = []
            for ubicacion_publicacion in ubicaciones_publicacion:
                for ubicacion_contraoferta in ubicaciones_contraoferta:
                    distancias.append(haversine(ubicacion_publicacion, ubicacion_contraoferta))
            distancias_publicacion[int(contraoferta.id)] = min(distancias)
            tumbamiento_publicacion[int(contraoferta.id)] = (publicacion.objeto.valorIntrinseco-contraoferta.objeto.valorIntrinseco)/publicacion.objeto.valorIntrinseco        
        contraofertas_dump = contraofertas_schema.dump(contraofertas)
        for contraoferta in contraofertas_dump:
            contraoferta['dist'] = float(distancias_publicacion[int(contraoferta['id'])])
            contraoferta['tumbamiento'] = float(tumbamiento_publicacion[int(contraoferta['id'])])
        return contraofertas_dump

class RecursoPublicacionesML(Resource):
    def get(self, id_publicacion, radio_m):
        publicaciones = noboto.Publicacion.query.all()
        publicacion_interes = noboto.Publicacion.query.get_or_404(id_publicacion)
        ubicaciones_interes = [(loc.latitud, loc.longitud) for loc in publicacion_interes.localizaciones]
        publicaciones_en_rango = []
        distancias_publicacion = {}
        tumbamiento_publicacion = {}
        for publicacion in publicaciones:
            if not publicacion.id == id_publicacion:
                ubicaciones_actual = [(loc.latitud, loc.longitud) for loc in publicacion.localizaciones]
                distancias = []
                for ubicacion_interes in ubicaciones_interes:
                    for ubicacion_actual in ubicaciones_actual:
                        distancias.append(haversine(ubicacion_interes, ubicacion_actual))
                if min(distancias) <= radio_m/1000:
                    publicaciones_en_rango.append(publicacion)
                distancias_publicacion[int(publicacion.id)] = min(distancias)
                tumbamiento_publicacion[int(publicacion.id)] = (publicacion_interes.objeto.valorIntrinseco-publicacion.objeto.valorIntrinseco)/publicacion_interes.objeto.valorIntrinseco
        publicaciones_dif_precio = {}
        for publicacion in publicaciones_en_rango:
            publicaciones_dif_precio[publicacion] = abs(publicacion_interes.objeto.valorIntrinseco - publicacion.objeto.valorIntrinseco)
        publicaciones_ordenadas = list(dict(sorted(publicaciones_dif_precio.items(), key=lambda item: item[1])).keys())
        publicaciones_dump = publicaciones_schema.dump(publicaciones_ordenadas[:3])
        for publicacion in publicaciones_dump:
            publicacion['dist'] = float(distancias_publicacion[int(publicacion['id'])])
            publicacion['tumbamiento'] = float(tumbamiento_publicacion[int(publicacion['id'])])
        return publicaciones_dump

class RecursoPublicacionesDistUsuario(Resource):
    def get(self, identificacion_usuario):
        publicaciones = noboto.Publicacion.query.all()
        usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
        ubicaciones_usuario = [(loc.latitud, loc.longitud) for loc in usuario.localizaciones]
        distancias_publicacion = {}
        publicaciones_otro_usuario = []
        for publicacion in publicaciones:
            if not int(publicacion.usuario_id) == identificacion_usuario:
                publicaciones_otro_usuario.append(publicacion)
                ubicaciones_actual = [(loc.latitud, loc.longitud) for loc in publicacion.localizaciones]
                distancias = []
                for ubicacion_usuario in ubicaciones_usuario:
                    for ubicacion_actual in ubicaciones_actual:
                        distancias.append(haversine(ubicacion_usuario, ubicacion_actual))
                distancias_publicacion[int(publicacion.id)] = min(distancias)
        publicaciones_dump = publicaciones_schema.dump(publicaciones_otro_usuario)
        for publicacion in publicaciones_dump:
            publicacion['dist'] = distancias_publicacion[int(publicacion['id'])]
        return publicaciones_dump

noboto.api.add_resource(RecursoListarUsuarios, '/usuarios')
noboto.api.add_resource(RecursoUnUsuario,'/usuario/<int:identificacion_usuario>')
noboto.api.add_resource(RecursoListarPublicaciones, '/publicaciones')
noboto.api.add_resource(RecursoUnaPublicacion,'/publicacion/<int:id_publicacion>')
noboto.api.add_resource(RecursoListarContraofertas, '/contraofertas')
noboto.api.add_resource(RecursoUnaContraoferta,'/contraoferta/<int:id_contraoferta>')
noboto.api.add_resource(RecursoListarTrueques, '/trueques')
noboto.api.add_resource(RecursoUnTrueque,'/trueque/<int:id_trueque>')
noboto.api.add_resource(RecursoListarObjetos, '/objetos')
noboto.api.add_resource(RecursoUnObjeto,'/objeto/<int:id_objeto>')

noboto.api.add_resource(RecursoPublicacionesDistUsuario,'/publicaciones_dist_usuario/<int:identificacion_usuario>')
noboto.api.add_resource(RecursoPublicacionesUsuario,'/publicaciones_usuario/<int:identificacion_usuario>')
noboto.api.add_resource(RecursoContraofertasPublicacion,'/contraofertas_publicacion/<int:id_publicacion>')
noboto.api.add_resource(RecursoPublicacionesML,'/publicacionesML/<int:id_publicacion>/radio_m/<int:radio_m>')

if __name__ == '__main__':
    noboto.app.run(debug=True, host='0.0.0.0')