from main.models.usuario import Usuario
from main.models.tipo_usuario import TipoUsuario

def add(rut,nombres,ape_pat,ape_mat,direccion,telefono,mail,tipou_codigo):
    tipo_usuario = TipoUsuario.objects.get(tipou_codigo=tipou_codigo)
    usuario = Usuario()
    usuario.usu_rut = rut
    usuario.usu_nombres = nombres
    usuario.usu_apepat = ape_pat
    usuario.usu_apemat = ape_mat
    usuario.usu_direccion = direccion
    usuario.usu_telefono = telefono
    usuario.usu_mail = mail
    usuario.tipou_codigo = tipo_usuario
    usuario.save()