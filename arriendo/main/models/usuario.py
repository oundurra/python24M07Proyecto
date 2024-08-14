from django.db import models

class Usuario(models.Model):
    usu_rut = models.IntegerField(primary_key=True)
    usu_nombres = models.CharField()
    usu_apepat = models.CharField()
    usu_apemat = models.CharField(blank=True, null=True)
    usu_direccion = models.CharField()
    usu_telefono = models.CharField(blank=True, null=True)
    usu_mail = models.CharField(blank=True, null=True)
    tipou_codigo = models.ForeignKey('TipoUsuario', models.DO_NOTHING, db_column='tipou_codigo', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'usuario'