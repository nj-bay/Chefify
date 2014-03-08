from django.db import models
from DishType import DishType

__author__ = 'nealshultz'

class Dish(models.Model):
    name = models.CharField(max_length=100)
    type = models.ForeignKey(DishType)

    class Meta:
        app_label = 'food'