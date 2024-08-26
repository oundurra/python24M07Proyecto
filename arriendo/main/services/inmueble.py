from main.models.inmueble import Inmueble, InmuebleArrendatarios
from main.models.tipo_inmueble import TipoInmueble
from main.models.comuna import Comuna
from main.models.tipo_inmueble import TipoInmueble
from main.models.usuario import Usuario

def addInmueble(nombre, descripcion, m2_construidos, m2_totales, num_estacionamientos, num_habitaciones, num_banos, direccion, tipo, precio, rut, comuna):
    inmueble = Inmueble()
    inmueble.inm_nombre = nombre
    inmueble.inm_descripcion = descripcion
    inmueble.inm_m2construidos = m2_construidos
    inmueble.inm_m2total = m2_totales
    inmueble.inm_num_estacionamientos = num_estacionamientos
    inmueble.inm_num_habitaciones = num_habitaciones
    inmueble.inm_num_banos = num_banos
    inmueble.inm_direccion = direccion
    inmueble.tipoi_codigo = TipoInmueble.objects.get(tipoi_codigo=tipo)
    inmueble.inm_precio = precio
    inmueble.usu_rut = Usuario.objects.get(usu_rut=rut)
    inmueble.comuna = Comuna.objects.get(comuna_id=comuna)
    inmueble.save()

def add_arrendatario(id, rut, fecha_inicio):
    inmueble = Inmueble.objects.get(inm_id=id)
    usuario = Usuario.objects.get(usu_rut=rut)
    InmuebleArrendatarios.objects.create(usu_rut=usuario, inm_id=inmueble, ia_fecha_inicio=fecha_inicio)

def getInmuebleAll():
    return Inmueble.objects.prefetch_related('inmueble').all()

def getInmuebleByOwner(owner):
    return Inmueble.objects.prefetch_related('inmueble').filter(usu_rut=owner)

def getInmuebleById(id):
    return Inmueble.objects.get(inm_id=id)
