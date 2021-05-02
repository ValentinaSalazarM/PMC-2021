from flask import Flask, request
from flask_restful import Resource
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
    #def put(self, identificacion_usuario):
    #    usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
    #    if 'titulo' in request.json:
    #        usuario.titulo = request.json['titulo']
    #    if 'contenido' in request.json:
    #        publicacion.contenido = request.json['contenido']
    #    db.session.commit()
    #    return post_schema.dump(publicacion)
    def delete(self, identificacion_usuario):
        usuario = noboto.Usuario.query.get_or_404(identificacion_usuario)
        noboto.db.session.delete(usuario)
        noboto.db.session.commit()
        return '', 204

noboto.api.add_resource(RecursoListarUsuarios, '/usuarios')
noboto.api.add_resource(RecursoUnUsuario,'/usuario/<int:identificacion_usuario>')

if __name__ == '__main__':
    noboto.app.run(debug=True)