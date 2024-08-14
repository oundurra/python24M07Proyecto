from django.db import models

class TipoInmueble(models.Model):
    tipoi_codigo = models.AutoField(primary_key=True)
    tipoi_descripcion = models.CharField()

    class Meta:
        managed = False
        db_table = 'tipo_inmueble'