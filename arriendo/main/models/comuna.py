from django.db import models
from .region import Region

class Comuna(models.Model):
    comuna_id = models.AutoField(primary_key=True)
    comuna_nombre = models.CharField()
    region_id = models.ForeignKey(Region,models.DO_NOTHING, db_column='region_id')

    class Meta:
        managed = False
        db_table = 'comuna'