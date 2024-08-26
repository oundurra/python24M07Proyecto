from main.models.usuario import Usuario
from main.models.tipo_usuario import TipoUsuario

def addUsuario(rut,nombres,ape_pat,ape_mat,direccion,telefono,mail,tipou_codigo):
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

def getUsuarioById(id):
    return Usuario.objects.filter(user_id=id).first()

def getUsuarioByRut(rut):
    return Usuario.objects.get(usu_rut=rut)

def saveUsuario(usuario_dict):
    usuario = Usuario.objects.get(usu_rut=usuario_dict["usu_rut"])
    usuario.usu_nombres = usuario_dict["usu_nombres"]
    usuario.usu_apepat = usuario_dict["usu_apepat"]
    usuario.usu_apemat = usuario_dict["usu_apemat"]
    usuario.usu_direccion = usuario_dict["usu_direccion"]
    usuario.usu_telefono = usuario_dict["usu_telefono"]
    usuario.usu_mail = usuario_dict["usu_mail"]
    usuario.save()
