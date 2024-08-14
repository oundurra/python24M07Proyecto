from main.models.tipo_inmueble import TipoInmueble

def add(descripcion):
    tipo_inmueble = TipoInmueble()
    tipo_inmueble.tipoi_descripcion = descripcion
    tipo_inmueble.save()