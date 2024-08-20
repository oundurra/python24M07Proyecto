from django.db import models
from .auth import AuthUser

class Usuario(models.Model):
    usu_rut = models.IntegerField(primary_key=True)
    usu_nombres = models.CharField()
    usu_apepat = models.CharField()
    usu_apemat = models.CharField(blank=True, null=True)
    usu_direccion = models.CharField()
    usu_telefono = models.CharField(blank=True, null=True)
    usu_mail = models.CharField(blank=True, null=True)
    tipo_usuario = models.ForeignKey('TipoUsuario', models.DO_NOTHING, db_column='tipou_codigo', blank=True, null=True)
    user_id = models.ForeignKey('AuthUser', models.DO_NOTHING, db_column='user_id')

    class Meta:
        managed = False
        db_table = 'usuario'
