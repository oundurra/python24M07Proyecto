from main.models.tipo_usuario import TipoUsuario

def add(descripcion):
    tipo_usuario = TipoUsuario()
    tipo_usuario.tipou_descripcion = descripcion
    tipo_usuario.save()