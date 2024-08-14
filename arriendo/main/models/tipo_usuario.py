from django.db import models

class TipoUsuario(models.Model):
    tipou_codigo = models.AutoField(primary_key=True)
    tipou_descripcion = models.CharField()

    class Meta:
        managed = False
        db_table = 'tipo_usuario'