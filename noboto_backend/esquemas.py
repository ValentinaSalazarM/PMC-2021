from noboto import ma

class Usuario_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("identificacion", "nombre", "correo", "celular", "calificacion")

class Trueque_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "activo", "diaEntrega", "etapa")

class Localizacion_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "latitud", "longitud", "direccion")

class Mensaje_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "texto", "fecha")

class Publicacion_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "titulo", "fecha")

class Contraoferta_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "mensaje")

class Foto_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "ruta")

class Objeto_Schema(ma.Schema):

    class Meta:

        # Campos que se exponen
        fields = ("id", "nombre", "descripcion", "categoria", "condicion", "precio", "valorIntrinseco")