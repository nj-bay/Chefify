from django.db import models

__author__ = 'nealshultz'


class DishType(models.Model):
    type = models.CharField(max_length=100)
    class Meta:
        app_label = 'food'