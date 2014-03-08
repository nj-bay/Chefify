from django.db import models
from Cuisine import Cuisine
from Dish import Dish

__author__ = 'nealshultz'


class Menu(models.Model):
    # chef_id = models.ForeignKey('Chef', related_name='menus')
    cuisine = models.ForeignKey(Cuisine)
    dishes = models.ForeignKey(Dish)
    class Meta:
        app_label = 'food'