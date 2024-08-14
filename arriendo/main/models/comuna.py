from django.db import models

class Comuna(models.Model):
    comuna_id = models.AutoField(primary_key=True)
    comuna_nombre = models.CharField()

    class Meta:
        managed = False
        db_table = 'comuna'