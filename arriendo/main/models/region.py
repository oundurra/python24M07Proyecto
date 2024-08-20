from django.db import models

class Region(models.Model):
    region_id = models.CharField(primary_key=True)
    region_nombre = models.CharField()

    class Meta:
        managed = False
        db_table = 'region'