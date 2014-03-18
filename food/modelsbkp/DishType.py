from django.db import models

__author__ = 'nealshultz'


class DishType(models.Model):
    name = models.CharField(max_length=100)
    class Meta:
        app_label = 'food'

    def __unicode__(self):
        return self.name