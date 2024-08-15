from django.db import models
from main.models.usuario import Usuario
from main.models.tipo_usuario import TipoUsuario
from main.models.tipo_inmueble import TipoInmueble
from main.models.comuna import Comuna
from datetime import date

class Inmueble(models.Model):
    inm_id = models.AutoField(primary_key=True)
    inm_nombre = models.CharField()
    inm_descripcion = models.CharField()
    inm_m2construidos = models.FloatField()
    inm_m2total = models.FloatField()
    inm_num_estacionamientos = models.IntegerField(blank=True, null=True)
    inm_num_habitaciones = models.IntegerField()
    inm_num_banos = models.IntegerField()
    inm_direccion = models.CharField()
    tipoi_codigo = models.ForeignKey(TipoInmueble, models.DO_NOTHING, db_column='tipoi_codigo', blank=True, null=True)
    inm_precio = models.FloatField()
    usu_rut = models.ForeignKey(Usuario, models.DO_NOTHING, db_column='usu_rut', blank=True, null=True)
    comuna = models.ForeignKey(Comuna, models.DO_NOTHING, blank=True, null=True)
    arrendatarios = models.ManyToManyField(Usuario, related_name='arrendatarios', through='InmuebleArrendatarios')

    class Meta:
        managed = False
        db_table = 'inmueble'

class InmuebleArrendatarios(models.Model):
    inm_id = models.ForeignKey(Inmueble, models.DO_NOTHING, db_column='inm_id')
    usu_rut = models.ForeignKey(Usuario, models.DO_NOTHING, db_column='usu_rut')
    ia_estado = models.BooleanField(default=True)
    ia_fecha_inicio = models.DateField(default=date.today)
    ia_fecha_fin = models.DateField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'inmueble_arrendatario'
