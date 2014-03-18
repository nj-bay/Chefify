from django.db import models
from DishType import DishType
from Cuisine import Cuisine

__author__ = 'nealshultz'

class Dish(models.Model):
    name = models.CharField(max_length=100)
    type = models.ForeignKey(DishType)
    cuisine = models.ForeignKey(Cuisine)

    class Meta:
        app_label = 'food'

    def __unicode__(self):
        return "{0}, {1}, {2}".format(self.name, self.type, self.cuisine)